package product

import (
	"context"
	"errors"
	"openrent-server/ai"
	"openrent-server/core"
	"openrent-server/models"
	"openrent-server/notification"
	"openrent-server/owner_rent"
	"openrent-server/rent"
	"openrent-server/testutils"
	"sync"
	"sync/atomic"
	"testing"
	"time"

	"github.com/pgvector/pgvector-go"
	"gorm.io/gorm"
)

func TestRentRace(t *testing.T) {
	db := testutils.TestDb{}
	defer testutils.CleanupTestDb(t, &db)
	if !testutils.InitTestDb(t, &db) {
		return
	}

	sqlDB, _ := db.Db.DB()
	sqlDB.SetMaxOpenConns(0)

	err := gorm.G[models.Account](db.Db).Create(context.Background(), &models.Account{
		ID:           1,
		Email:        "user@rent.com",
		Name:         "User",
		PasswordHash: "has-no-password",
		Role:         string(models.AccountRoleUser),
		User: &models.UserAccount{
			UserAddresses: []models.UserAddress{{ID: 1}},
		},
	})
	if err != nil {
		t.Error("Cannot create owner User", err)
		return
	}
	err = gorm.G[models.Account](db.Db).Create(context.Background(), &models.Account{
		ID:           2,
		Email:        "renter@rent.com",
		Name:         "renter",
		PasswordHash: "has-no-password",
		Role:         string(models.AccountRoleUser),
		User: &models.UserAccount{
			UserAddresses: []models.UserAddress{{ID: 2}},
		},
	})
	if err != nil {
		t.Error("Cannot create renter User", err)
		return
	}

	var embeddings [768]float32
	var stock int32 = 5
	err = gorm.G[models.Product](db.Db).Create(context.Background(), &models.Product{
		Model:               gorm.Model{ID: 1},
		UserAccountID:       1,
		UserAddressID:       1,
		Stock:               int(stock),
		Embedding:           pgvector.NewVector(embeddings[:]),
		EmbeddingSimilarity: pgvector.NewVector(embeddings[:]),
	})
	if err != nil {
		t.Error("Cannot create Product", err)
		return
	}

	service := NewService(db.Db, ai.NewNoopEmbedder(), nil, notification.NewNoopService(), nil, "")

	var wg sync.WaitGroup
	start := make(chan struct{})
	requestCount := 100
	var usedStock int32 = 0

	startDate := time.Now()
	endDate := startDate.AddDate(0, 0, 1)

	for i := 1; i <= requestCount; i++ {
		wg.Go(func() {
			<-start
			_, err := service.Rent(context.Background(), 2, RentRequest{
				StartDate: startDate,
				EndDate:   endDate,
				ID:        1,
				Quantity:  1,
			})
			if err == nil {
				atomic.AddInt32(&usedStock, 1)
			} else if !errors.Is(err, ErrStockUnavailable) {
				t.Log(err)
			}
		})
	}

	close(start)
	wg.Wait()

	if usedStock != stock {
		t.Errorf("Error used stock, Expected: %d, Actual: %d", stock, usedStock)
		return
	}
}

func TestRentOverlap(t *testing.T) {
	db := testutils.TestDb{}
	defer testutils.CleanupTestDb(t, &db)
	if !testutils.InitTestDb(t, &db) {
		return
	}

	ctx := context.Background()

	err := gorm.G[models.Account](db.Db).Create(ctx, &models.Account{
		ID: 1, Email: "owner@test.com", Name: "Owner", Role: string(models.AccountRoleUser),
		User: &models.UserAccount{UserAddresses: []models.UserAddress{{ID: 1}}},
	})
	if err != nil {
		t.Fatal(err)
	}

	err = gorm.G[models.Account](db.Db).Create(ctx, &models.Account{
		ID: 2, Email: "renter@test.com", Name: "Renter", Role: string(models.AccountRoleUser),
		User: &models.UserAccount{UserAddresses: []models.UserAddress{{ID: 2}}},
	})
	if err != nil {
		t.Fatal(err)
	}

	var embeddings [768]float32
	err = gorm.G[models.Product](db.Db).Create(ctx, &models.Product{
		Model:               gorm.Model{ID: 1},
		UserAccountID:       1,
		UserAddressID:       1,
		Stock:               1,
		Embedding:           pgvector.NewVector(embeddings[:]),
		EmbeddingSimilarity: pgvector.NewVector(embeddings[:]),
	})
	if err != nil {
		t.Fatal(err)
	}

	productService := NewService(db.Db, ai.NewNoopEmbedder(), nil, notification.NewNoopService(), nil, "")
	ownerRentService := owner_rent.NewService(db.Db, notification.NewNoopService(), nil, "")
	rentService := rent.NewService(db.Db, notification.NewNoopService(), nil, "", ai.NewNoopAIGenerative())

	t.Run("DateOverlap", func(t *testing.T) {
		now := time.Now()
		baseStart := now.AddDate(0, 0, 5)
		baseEnd := now.AddDate(0, 0, 10)

		_, err := productService.Rent(ctx, 2, RentRequest{ID: 1, Quantity: 1, StartDate: baseStart, EndDate: baseEnd})
		if err != nil {
			t.Fatalf("Failed to create base rent: %v", err)
		}

		tests := []struct {
			name      string
			start     time.Time
			end       time.Time
			wantError error
		}{
			{"Exact Match", baseStart, baseEnd, ErrStockUnavailable},
			{"Inside", baseStart.Add(24 * time.Hour), baseEnd.Add(-24 * time.Hour), ErrStockUnavailable},
			{"Partial Start", baseStart.Add(-2 * 24 * time.Hour), baseStart.Add(2 * 24 * time.Hour), ErrStockUnavailable},
			{"Partial End", baseEnd.Add(-2 * 24 * time.Hour), baseEnd.Add(2 * 24 * time.Hour), ErrStockUnavailable},
			{"Surrounding", baseStart.Add(-2 * 24 * time.Hour), baseEnd.Add(2 * 24 * time.Hour), ErrStockUnavailable},
			{"Touching Start", baseStart.Add(-2 * 24 * time.Hour), baseStart, ErrStockUnavailable},
			{"Touching End", baseEnd, baseEnd.Add(2 * 24 * time.Hour), ErrStockUnavailable},
			{"Before", baseStart.Add(-4 * 24 * time.Hour), baseStart.Add(-2 * 24 * time.Hour), nil},
			{"After", baseEnd.Add(2 * 24 * time.Hour), baseEnd.Add(4 * 24 * time.Hour), nil},
		}

		for _, tt := range tests {
			t.Run(tt.name, func(t *testing.T) {
				_, err := productService.Rent(ctx, 2, RentRequest{ID: 1, Quantity: 1, StartDate: tt.start, EndDate: tt.end})
				if !errors.Is(err, tt.wantError) {
					t.Errorf("Rent() error = %v, wantError %v", err, tt.wantError)
				}
			})
		}

		db.Db.Exec("DELETE FROM rents")
	})

	t.Run("StateTransitions", func(t *testing.T) {
		now := time.Now()
		start := now.AddDate(0, 0, 5)
		end := now.AddDate(0, 0, 10)

		res, err := productService.Rent(ctx, 2, RentRequest{ID: 1, Quantity: 1, StartDate: start, EndDate: end})
		if err != nil {
			t.Fatal(err)
		}
		rentID := res.ID

		checkOverlap := func(expectedError error) {
			_, err := productService.Rent(ctx, 2, RentRequest{ID: 1, Quantity: 1, StartDate: start, EndDate: end})
			if !errors.Is(err, expectedError) {
				t.Errorf("State overlap check failed: got %v, want %v", err, expectedError)
			}
		}

		checkOverlap(ErrStockUnavailable)

		if err := ownerRentService.Approve(ctx, 1, rentID); err != nil {
			t.Fatal(err)
		}
		checkOverlap(ErrStockUnavailable)

		db.Db.Model(&models.Rent{}).Where("id = ?", rentID).Update("start_date", core.ConvertTimeToDate(now))

		if err := rentService.Receive(ctx, 2, rentID); err != nil {
			t.Fatal(err)
		}
		checkOverlap(ErrStockUnavailable)

		payment := 0
		if err := ownerRentService.Handover(ctx, 1, owner_rent.HandoverRequest{ID: rentID, Payment: &payment}); err != nil {
			t.Fatal(err)
		}
		checkOverlap(ErrStockUnavailable)

		if err := rentService.RequestReturn(ctx, 2, rentID); err != nil {
			t.Fatal(err)
		}
		checkOverlap(ErrStockUnavailable)

		zero := 0
		if err := ownerRentService.ConfirmReturn(ctx, 1, owner_rent.ConfirmReturnRequest{
			ID:                rentID,
			FinalPayment:      &zero,
			LateFinePayment:   &zero,
			DamageFinePayment: &zero,
		}); err != nil {
			t.Fatal(err)
		}
		checkOverlap(nil)
	})

	t.Run("Cancellation", func(t *testing.T) {
		now := time.Now()
		start := now.AddDate(0, 0, 20)
		end := now.AddDate(0, 0, 25)

		res, err := productService.Rent(ctx, 2, RentRequest{ID: 1, Quantity: 1, StartDate: start, EndDate: end})
		if err != nil {
			t.Fatal(err)
		}

		if err := ownerRentService.Reject(ctx, 1, owner_rent.RejectRequest{ID: res.ID, Note: "Not available"}); err != nil {
			t.Fatal(err)
		}

		_, err = productService.Rent(ctx, 2, RentRequest{ID: 1, Quantity: 1, StartDate: start, EndDate: end})
		if err != nil {
			t.Errorf("Should be able to rent after cancellation, got: %v", err)
		}
	})
}

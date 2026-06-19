package rent

import (
	"context"
	"errors"
	"openrent-server/ai"
	"openrent-server/models"
	"openrent-server/notification"
	"openrent-server/testutils"
	"testing"

	"gorm.io/gorm"
)

func TestRentSecurity(t *testing.T) {
	db := testutils.TestDb{}
	defer testutils.CleanupTestDb(t, &db)
	if !testutils.InitTestDb(t, &db) {
		return
	}

	ctx := context.Background()
	service := NewService(db.Db, notification.NewNoopService(), nil, "", ai.NewNoopAIGenerative())

	if err := testutils.CreateAccount(db.Db, 1, "Owner"); err != nil {
		t.Fatal(err)
	}
	if err := testutils.CreateAccount(db.Db, 2, "Attacker"); err != nil {
		t.Fatal(err)
	}
	if err := testutils.CreateAccount(db.Db, 3, "Renter"); err != nil {
		t.Fatal(err)
	}
	if err := testutils.CreateAddress(db.Db, 1, 1, "Address"); err != nil {
		t.Fatal(err)
	}
	if err := testutils.CreateProduct(db.Db, 100, 1, 1, "Product", 1); err != nil {
		t.Fatal(err)
	}

	rent := models.Rent{
		Model:         gorm.Model{ID: 1},
		ProductID:     100,
		UserAccountID: 3,
		State:         models.RentStateReadyForPickup,
	}
	if err := db.Db.Create(&rent).Error; err != nil {
		t.Fatal(err)
	}

	t.Run("IDOR_ReceiveRent", func(t *testing.T) {
		err := service.Receive(ctx, 2, 1)
		if !errors.Is(err, ErrNotFound) {
			t.Errorf("Expected ErrNotFound, got %v", err)
		}
	})

	t.Run("IDOR_RequestReturn", func(t *testing.T) {
		err := service.RequestReturn(ctx, 2, 1)
		if !errors.Is(err, ErrNotFound) {
			t.Errorf("Expected ErrNotFound, got %v", err)
		}
	})
}

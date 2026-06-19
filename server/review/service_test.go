package review

import (
	"context"
	"errors"
	"openrent-server/models"
	"openrent-server/testutils"
	"testing"

	"gorm.io/gorm"
)

func TestReviewSecurity(t *testing.T) {
	db := testutils.TestDb{}
	defer testutils.CleanupTestDb(t, &db)
	if !testutils.InitTestDb(t, &db) {
		return
	}

	ctx := context.Background()
	service := NewService(db.Db)

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
		State:         models.RentStateCompleted,
	}
	if err := db.Db.Create(&rent).Error; err != nil {
		t.Fatal(err)
	}

	review := models.Review{
		Model:   gorm.Model{ID: 1},
		RentID:  1,
		Rating:  5,
		Content: "Great!",
	}
	if err := db.Db.Create(&review).Error; err != nil {
		t.Fatal(err)
	}

	t.Run("IDOR_UpdateReview", func(t *testing.T) {
		err := service.Update(ctx, 2, UpdateReviewRequest{ID: 1, Content: "Hacked"})
		if !errors.Is(err, ErrNotFound) {
			t.Errorf("Expected ErrNotFound, got %v", err)
		}
	})

	t.Run("IDOR_DeleteReview", func(t *testing.T) {
		err := service.Delete(ctx, 2, 1)
		if !errors.Is(err, ErrNotFound) {
			t.Errorf("Expected ErrNotFound, got %v", err)
		}
	})
}

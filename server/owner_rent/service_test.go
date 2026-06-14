package owner_rent

import (
	"context"
	"errors"
	"openrent-server/models"
	"openrent-server/notification"
	"openrent-server/testutils"
	"testing"

	"gorm.io/gorm"
)

func TestOwnerRentSecurity(t *testing.T) {
	db := testutils.TestDb{}
	defer testutils.CleanupTestDb(t, &db)
	if !testutils.InitTestDb(t, &db) {
		return
	}

	ctx := context.Background()
	service := NewService(db.Db, notification.NewNoopService(), nil, "")

	if err := testutils.CreateAccount(db.Db, 1, "Owner"); err != nil {
		t.Fatal(err)
	}
	if err := testutils.CreateAccount(db.Db, 2, "Attacker"); err != nil {
		t.Fatal(err)
	}
	if err := testutils.CreateAccount(db.Db, 3, "Renter"); err != nil {
		t.Fatal(err)
	}
	if err := testutils.CreateAddress(db.Db, 1, 1, "Address A"); err != nil {
		t.Fatal(err)
	}
	if err := testutils.CreateProduct(db.Db, 1, 1, 1, "Product", 1); err != nil {
		t.Fatal(err)
	}

	rent := models.Rent{
		Model:         gorm.Model{ID: 1},
		ProductID:     1,
		UserAccountID: 3,
		State:         models.RentStatePendingApproval,
	}
	if err := db.Db.Create(&rent).Error; err != nil {
		t.Fatal(err)
	}

	t.Run("IDOR_ApproveRent", func(t *testing.T) {
		err := service.Approve(ctx, 2, 1)
		if !errors.Is(err, ErrNotFound) {
			t.Errorf("Expected ErrNotFound, got %v", err)
		}
	})

	t.Run("IDOR_RejectRent", func(t *testing.T) {
		err := service.Reject(ctx, 2, RejectRequest{ID: 1, Note: "Hacked"})
		if !errors.Is(err, ErrNotFound) {
			t.Errorf("Expected ErrNotFound, got %v", err)
		}
	})
}

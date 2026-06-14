package address

import (
	"context"
	"errors"
	"openrent-server/models"
	"openrent-server/testutils"
	"testing"
)

func TestAddressSecurity(t *testing.T) {
	db := testutils.TestDb{}
	defer testutils.CleanupTestDb(t, &db)
	if !testutils.InitTestDb(t, &db) {
		return
	}

	ctx := context.Background()
	service := NewService(db.Db)

	if err := testutils.CreateAccount(db.Db, 1, "User A"); err != nil {
		t.Fatal(err)
	}
	if err := testutils.CreateAccount(db.Db, 2, "User B"); err != nil {
		t.Fatal(err)
	}

	addr := models.UserAddress{
		ID:            1,
		UserAccountID: 1,
		Name:          "User A Home",
		Province:      "Province",
		Regency:       "Regency",
		District:      "District",
		AddressDetail: "Detail",
	}
	if err := db.Db.Create(&addr).Error; err != nil {
		t.Fatal(err)
	}

	t.Run("IDOR_GetAddress", func(t *testing.T) {
		_, err := service.Get(ctx, 2, 1)
		if !errors.Is(err, ErrNotFound) {
			t.Errorf("Expected ErrNotFound, got %v", err)
		}
	})

	t.Run("IDOR_UpdateAddress", func(t *testing.T) {
		_, err := service.Update(ctx, 2, 1, AddRequest{Name: "Hacked"})
		if !errors.Is(err, ErrNotFound) {
			t.Errorf("Expected ErrNotFound, got %v", err)
		}
	})

	t.Run("IDOR_DeleteAddress", func(t *testing.T) {
		err := service.Delete(ctx, 2, 1)
		if !errors.Is(err, ErrNotFound) {
			t.Errorf("Expected ErrNotFound, got %v", err)
		}
	})
}

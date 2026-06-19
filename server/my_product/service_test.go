package my_product

import (
	"context"
	"errors"
	"openrent-server/ai"
	"openrent-server/testutils"
	"testing"
)

func TestMyProductSecurity(t *testing.T) {
	db := testutils.TestDb{}
	defer testutils.CleanupTestDb(t, &db)
	if !testutils.InitTestDb(t, &db) {
		return
	}

	ctx := context.Background()
	service := NewService(db.Db, ai.NewNoopEmbedder(), nil, "")

	if err := testutils.CreateAccount(db.Db, 1, "User A"); err != nil {
		t.Fatal(err)
	}
	if err := testutils.CreateAccount(db.Db, 2, "User B"); err != nil {
		t.Fatal(err)
	}
	if err := testutils.CreateAddress(db.Db, 1, 1, "Address A"); err != nil {
		t.Fatal(err)
	}
	if err := testutils.CreateProduct(db.Db, 1, 1, 1, "User A Product", 1); err != nil {
		t.Fatal(err)
	}

	t.Run("IDOR_GetProduct", func(t *testing.T) {
		_, err := service.GetById(ctx, 2, 1)
		if !errors.Is(err, ErrNotFound) {
			t.Errorf("Expected ErrNotFound, got %v", err)
		}
	})

	t.Run("IDOR_UpdateProduct", func(t *testing.T) {
		_, err := service.Update(ctx, 2, UpdateRequest{ID: 1, AddRequest: AddRequest{Name: "Hacked", AddressID: 1}})
		if !errors.Is(err, ErrNotFound) {
			t.Errorf("Expected ErrNotFound, got %v", err)
		}
	})

	t.Run("IDOR_DeleteProduct", func(t *testing.T) {
		err := service.Delete(ctx, 2, 1)
		if !errors.Is(err, ErrNotFound) {
			t.Errorf("Expected ErrNotFound, got %v", err)
		}
	})
}

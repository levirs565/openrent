package message

import (
	"context"
	"errors"
	"openrent-server/models"
	"openrent-server/testutils"
	"testing"

	"gorm.io/gorm"
)

func TestMessageSecurity(t *testing.T) {
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
	if err := testutils.CreateAccount(db.Db, 3, "User C"); err != nil {
		t.Fatal(err)
	}

	msg := models.Message{
		Model:      gorm.Model{ID: 1},
		SenderID:   1,
		ReceiverID: 3,
		Message:    "Hello User C",
	}
	if err := db.Db.Create(&msg).Error; err != nil {
		t.Fatal(err)
	}

	t.Run("IDOR_UpdateMessage", func(t *testing.T) {
		err := service.Update(ctx, 2, UpdateRequest{ID: 1, Message: "Hacked"})
		if !errors.Is(err, ErrNotFound) {
			t.Errorf("Expected ErrNotFound, got %v", err)
		}
	})

	t.Run("IDOR_DeleteMessage", func(t *testing.T) {
		err := service.Delete(ctx, 2, 1)
		if !errors.Is(err, ErrNotFound) {
			t.Errorf("Expected ErrNotFound, got %v", err)
		}
	})
}

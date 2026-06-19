package chat

import (
	"context"
	"openrent-server/models"
	"openrent-server/notification"
	"openrent-server/testutils"
	"testing"

	"gorm.io/gorm"
)

func TestChatSecurity(t *testing.T) {
	db := testutils.TestDb{}
	defer testutils.CleanupTestDb(t, &db)
	if !testutils.InitTestDb(t, &db) {
		return
	}

	ctx := context.Background()
	service := NewService(db.Db, notification.NewNoopService(), nil, "")

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
		ReceiverID: 2,
		Message:    "Secret between A and B",
	}
	if err := db.Db.Create(&msg).Error; err != nil {
		t.Fatal(err)
	}

	t.Run("IDOR_ListMessages", func(t *testing.T) {
		msgs, err := service.ListMessages(ctx, 3, 1)
		if err != nil {
			t.Fatal(err)
		}

		for _, m := range msgs {
			var msgID uint
			if am, ok := m.(*ActiveMessageResponseItem); ok {
				msgID = am.ID
			} else if dm, ok := m.(*DeletedMessageResponseItem); ok {
				msgID = dm.ID
			}

			if msgID == 1 {
				t.Errorf("User C should not be able to see message between A and B")
			}
		}
	})

	t.Run("Privacy_ListChats", func(t *testing.T) {
		chats, err := service.ListChats(ctx, 3)
		if err != nil {
			t.Fatal(err)
		}

		if len(chats) > 0 {
			t.Errorf("%s", chats[0].LastMessage.(*ActiveMessageResponseItem).Message)
			t.Errorf("User C should have no chats, got %d", len(chats))
		}
	})
}

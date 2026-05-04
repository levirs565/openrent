package notification

import (
	"context"
	"log"
	"openrent-server/models"

	"firebase.google.com/go/v4/messaging"
	"github.com/samber/lo"
	"gorm.io/gorm"
)

type fcmService struct {
	db        *gorm.DB
	fcmClient *messaging.Client
}

var _ Service = (*fcmService)(nil)

func NewFCMService(fcmClient *messaging.Client, db *gorm.DB) *fcmService {
	return &fcmService{fcmClient: fcmClient, db: db}
}

func (s *fcmService) SendNotification(ctx context.Context, userId uint, notification Notification) error {
	list, err := gorm.G[models.FCMToken](s.db).
		Select("id", "token").
		Where("user_account_id = ?", userId).
		Find(ctx)
	if err != nil {
		return err
	}

	if len(list) == 0 {
		return nil
	}

	tokens := lo.Map(list, func(model models.FCMToken, _ int) string {
		return model.Token
	})
	br, err := s.fcmClient.SendEachForMulticast(ctx, &messaging.MulticastMessage{
		Tokens:       tokens,
		Notification: notification.Notification,
		Data:         notification.Data,
		Android:      notification.Android,
		Webpush:      notification.Webpush,
		APNS:         notification.APNS,
		FCMOptions:   notification.FCMOptions,
	})

	if br.FailureCount > 0 {
		var failedTokenIds []uint
		for idx, resp := range br.Responses {
			if !resp.Success {
				log.Printf("failed to send notification to token %s: %v", tokens[idx], resp.Error)
				failedTokenIds = append(failedTokenIds, list[idx].ID)
			}
		}
		if len(failedTokenIds) > 0 {
			_, err := gorm.G[models.FCMToken](s.db).
				Where("id IN ?", failedTokenIds).
				Delete(ctx)
			if err != nil {
				return err
			}
		}
	}
	if err != nil {
		return err
	}

	return nil
}

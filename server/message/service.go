package message

import (
	"context"
	"errors"
	"openrent-server/models"

	"gorm.io/gorm"
)

var ErrNotFound = errors.New("message not found")

type Service struct {
	db *gorm.DB
}

func NewService(db *gorm.DB) *Service {
	return &Service{
		db: db,
	}
}

func (s *Service) Update(ctx context.Context, userId uint, request UpdateRequest) error {
	rows, err := gorm.G[models.Message](s.db).
		Select("message").
		Where("id = ?", request.ID).
		Where("sender_id = ?", userId).
		Updates(ctx, models.Message{
			Message: request.Message,
		})
	if err != nil {
		return err
	}
	if rows == 0 {
		return ErrNotFound
	}
	return nil
}

func (s *Service) Delete(ctx context.Context, userId uint, messageId uint) error {
	rows, err := gorm.G[models.Message](s.db).
		Where("id = ?", messageId).
		Where("sender_id = ?", userId).
		Delete(ctx)
	if err != nil {
		return err
	}
	if rows == 0 {
		return ErrNotFound
	}
	return nil
}

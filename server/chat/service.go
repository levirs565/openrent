package chat

import (
	"context"
	"errors"
	"openrent-server/models"

	"github.com/samber/lo"
	"gorm.io/gorm"
	"gorm.io/gorm/clause"
)

var ErrCannotSendToSelf = errors.New("cannot send to self")

type Service struct {
	db *gorm.DB
}

func NewService(db *gorm.DB) *Service {
	return &Service{
		db: db,
	}
}

func (s *Service) Send(ctx context.Context, userId uint, request SendMessageRequest) error {
	if userId == request.ReceiverID {
		return ErrCannotSendToSelf
	}

	model := sendMessageRequestToModel(request)
	model.SenderID = userId

	err := gorm.G[models.Message](s.db).
		Create(ctx, &model)
	if err != nil {
		return err
	}

	return nil
}

func (s *Service) ListMessages(ctx context.Context, userId uint, otherUserId uint) ([]MessageResponseItem, error) {
	model, err := gorm.G[models.Message](s.db).
		Scopes(func(db *gorm.Statement) {
			db.Unscoped = true
		}).
		Select(
			"id", "created_at", "deleted_at", "updated_at", "message", "sender_id",
		).
		Where(clause.Or(
			gorm.Expr("sender_id = ? AND receiver_id = ?", userId, otherUserId),
			gorm.Expr("sender_id = ? AND receiver_id = ?", otherUserId, userId),
		)).
		Order("created_at DESC").
		Find(ctx)
	if err != nil {
		return []MessageResponseItem{}, err
	}

	result := lo.Map(model, func(item models.Message, index int) MessageResponseItem {
		return modelToResponseItem(item, userId)
	})
	return result, nil
}

func (s *Service) ListChats(ctx context.Context, userId uint) ([]ChatResponseItem, error) {
	type participantModel struct {
		models.Message
		OtherID   uint
		OtherUser models.UserAccount `gorm:"foreignKey:AccountID;references:OtherID"`
	}

	var model []participantModel

	err := s.db.Unscoped().WithContext(ctx).Table(
		"(?) as c",
		s.db.Unscoped().Model(&models.Message{}).
			Select(
				"(CASE WHEN sender_id = ? THEN receiver_id ELSE sender_id END) AS other_id, *",
				userId,
			),
	).Select(`
		DISTINCT ON (other_id) c.id, c.created_at, c.deleted_at, c.updated_at, c.message, c.other_id,
		c.sender_id
	`).
		Order(clause.OrderBy{Expression: gorm.Expr("other_id, created_at DESC")}).
		Joins("OtherUser.Account", s.db.Select("name")).
		Find(&model).Error
	if err != nil {
		return []ChatResponseItem{}, err
	}

	result := lo.Map(model, func(item participantModel, index int) ChatResponseItem {
		return ChatResponseItem{
			ID:          item.OtherID,
			Name:        item.OtherUser.Account.Name,
			LastMessage: modelToResponseItem(item.Message, userId),
		}
	})

	return result, nil
}

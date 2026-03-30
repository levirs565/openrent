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

func (s *Service) send(ctx context.Context, userId uint, request SendChatRequest) error {
	if userId == request.ReceiverID {
		return ErrCannotSendToSelf
	}

	model := sendChatRequestToModel(request)
	model.SenderID = userId

	err := gorm.G[models.Chat](s.db).
		Create(ctx, &model)
	if err != nil {
		return err
	}

	return nil
}

func (s *Service) list(ctx context.Context, userId uint, otherUserId uint) ([]ChatResponseItem, error) {
	model, err := gorm.G[models.Chat](s.db).
		Select(
			"id", "created_at", "updated_at", "message", "sender_id",
		).
		Where(clause.Or(
			gorm.Expr("sender_id = ? AND receiver_id = ?", userId, otherUserId),
			gorm.Expr("sender_id = ? AND receiver_id = ?", otherUserId, userId),
		)).
		Order("created_at DESC").
		Find(ctx)
	if err != nil {
		return []ChatResponseItem{}, err
	}

	result := lo.Map(model, func(item models.Chat, index int) ChatResponseItem {
		return modelToResponseItem(item, userId)
	})
	return result, nil
}

func (s *Service) listParticipants(ctx context.Context, userId uint) ([]ParticipantResponseItem, error) {
	type participantModel struct {
		models.Chat
		OtherID   uint
		OtherUser models.UserAccount `gorm:"foreignKey:AccountID;references:OtherID"`
	}

	var model []participantModel
	err := s.db.WithContext(ctx).Table(
		"(?) as c",
		s.db.Model(&models.Chat{}).
			Select(
				"(CASE WHEN sender_id = ? THEN receiver_id ELSE sender_id END) AS other_id, *",
				userId,
			),
	).Select(`
		DISTINCT ON (other_id) c.id, c.created_at, c.updated_at, c.message, c.other_id, c.sender_id
	`).
		Order(clause.OrderBy{Expression: gorm.Expr("other_id, created_at DESC")}).
		Joins("OtherUser.Account", s.db.Select("name")).
		Find(&model).Error
	if err != nil {
		return []ParticipantResponseItem{}, err
	}

	result := lo.Map(model, func(item participantModel, index int) ParticipantResponseItem {
		return ParticipantResponseItem{
			ID:       item.OtherID,
			Name:     item.OtherUser.Account.Name,
			LastChat: modelToResponseItem(item.Chat, userId),
		}
	})

	return result, nil
}

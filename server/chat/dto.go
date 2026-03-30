package chat

import (
	"openrent-server/models"
	"time"
)

type SendChatRequest struct {
	ReceiverID uint   `param:"id"`
	Message    string `json:"message" validate:"required"`
}

func sendChatRequestToModel(request SendChatRequest) models.Chat {
	return models.Chat{
		ReceiverID: request.ReceiverID,
		Message:    request.Message,
	}
}

type ListChatRequest struct {
	ID uint `param:"id"`
}

type ChatResponseItem interface {
	IsChat() bool
}

type ActiveChatResponseItem struct {
	ID          uint      `json:"id"`
	CurrentUser bool      `json:"current_user"`
	CreatedAt   time.Time `json:"created_at"`
	UpdatedAt   time.Time `json:"updated_at"`
	Message     string    `json:"message"`
}

var _ ChatResponseItem = (*ActiveChatResponseItem)(nil)

// IsChat implements [ChatResponseItem].
func (a *ActiveChatResponseItem) IsChat() bool {
	panic("unimplemented")
}

type DeleteChatResponseItem struct {
	ID          uint      `json:"id"`
	CurrentUser bool      `json:"current_user"`
	CreatedAt   time.Time `json:"created_at"`
	DeletedAt   time.Time `json:"deleted_at"`
}

var _ ChatResponseItem = (*DeleteChatResponseItem)(nil)

// IsChat implements [ChatResponseItem].
func (d *DeleteChatResponseItem) IsChat() bool {
	panic("unimplemented")
}

func modelToResponseItem(model models.Chat, userId uint) ChatResponseItem {
	if model.DeletedAt.Valid {
		return &DeleteChatResponseItem{
			ID:          model.ID,
			CurrentUser: model.SenderID == userId,
			CreatedAt:   model.CreatedAt,
			DeletedAt:   model.DeletedAt.Time,
		}
	}
	return &ActiveChatResponseItem{
		ID:          model.ID,
		CurrentUser: model.SenderID == userId,
		CreatedAt:   model.CreatedAt,
		UpdatedAt:   model.UpdatedAt,
		Message:     model.Message,
	}
}

type ParticipantResponseItem struct {
	ID       uint             `json:"id"`
	Name     string           `json:"name"`
	LastChat ChatResponseItem `json:"last_chat"`
}

package chat

import (
	"openrent-server/models"
	"time"
)

type SendMessageRequest struct {
	ReceiverID uint   `param:"id"`
	Message    string `json:"message" validate:"required"`
}

func sendMessageRequestToModel(request SendMessageRequest) models.Message {
	return models.Message{
		ReceiverID: request.ReceiverID,
		Message:    request.Message,
	}
}

type ListMessagesRequest struct {
	ID uint `param:"id"`
}

type MessageResponseItem interface {
	IsChat() bool
}

type ActiveMessageResponseItem struct {
	ID          uint      `json:"id"`
	CurrentUser bool      `json:"current_user"`
	CreatedAt   time.Time `json:"created_at"`
	UpdatedAt   time.Time `json:"updated_at"`
	Message     string    `json:"message"`
}

var _ MessageResponseItem = (*ActiveMessageResponseItem)(nil)

// IsChat implements [MessageResponseItem].
func (a *ActiveMessageResponseItem) IsChat() bool {
	return true
}

type DeletedMessageResponseItem struct {
	ID          uint      `json:"id"`
	CurrentUser bool      `json:"current_user"`
	CreatedAt   time.Time `json:"created_at"`
	DeletedAt   time.Time `json:"deleted_at"`
}

var _ MessageResponseItem = (*DeletedMessageResponseItem)(nil)

// IsChat implements [MessageResponseItem].
func (d *DeletedMessageResponseItem) IsChat() bool {
	return true
}

func modelToResponseItem(model models.Message, userId uint) MessageResponseItem {
	if model.DeletedAt.Valid {
		return &DeletedMessageResponseItem{
			ID:          model.ID,
			CurrentUser: model.SenderID == userId,
			CreatedAt:   model.CreatedAt,
			DeletedAt:   model.DeletedAt.Time,
		}
	}
	return &ActiveMessageResponseItem{
		ID:          model.ID,
		CurrentUser: model.SenderID == userId,
		CreatedAt:   model.CreatedAt,
		UpdatedAt:   model.UpdatedAt,
		Message:     model.Message,
	}
}

type ChatResponseItem struct {
	ID          uint                `json:"id"`
	Name        string              `json:"name"`
	LastMessage MessageResponseItem `json:"last_message"`
}

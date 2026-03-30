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

type ChatResponseItem struct {
	ID          uint      `json:"id"`
	CurrentUser bool      `json:"current_user"`
	CreatedAt   time.Time `json:"created_at"`
	UpdatedAt   time.Time `json:"updated_at"`
	Message     string    `json:"message"`
}

func modelToResponseItem(model models.Chat, userId uint) ChatResponseItem {
	return ChatResponseItem{
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

type UpdateChatRequest struct {
	ReceiverID uint   `param:"id"`
	ChatID     uint   `param:"chat_id"`
	Message    string `json:"message" validate:"required"`
}

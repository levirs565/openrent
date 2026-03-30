package message

type UpdateRequest struct {
	ID      uint   `param:"id"`
	Message string `json:"message" validate:"required"`
}

type DeleteRequest struct {
	ID uint `param:"id"`
}

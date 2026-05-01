package user

type GetByIDRequest struct {
	ID uint `param:"id"`
}

type ResponseShort struct {
	ID        uint    `json:"id"`
	Name      string  `json:"name"`
	AvatarURL *string `json:"avatar_url"`
}

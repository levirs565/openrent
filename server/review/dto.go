package review

import (
	"openrent-server/models"
)

type DeleteRequest struct {
	ID uint `param:"id"`
}

type UpdateReviewRequest struct {
	ID      uint   `param:"id"`
	Rating  uint   `json:"rating" validate:"required,min=1,max=5"`
	Content string `json:"content" validate:"required"`
}

func updateReviewRequestToModel(request UpdateReviewRequest) models.Review {
	return models.Review{
		Rating:  request.Rating,
		Content: request.Content,
	}
}

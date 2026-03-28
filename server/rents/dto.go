package rents

import (
	"openrent-server/models"

	"gorm.io/datatypes"
)

type ProductShort struct {
	ID   uint   `json:"id"`
	Name string `json:"name"`
}

type UserShort struct {
	ID   uint   `json:"id"`
	Name string `json:"name"`
}

type ReviewShort struct {
	ID uint `json:"id"`
}

type ResponseItem struct {
	ID        uint             `json:"id"`
	Product   ProductShort     `json:"product"`
	User      UserShort        `json:"user"`
	Review    *ReviewShort     `json:"review"`
	State     models.RentState `json:"state"`
	StartDate datatypes.Date   `json:"start_date"`
	EndDate   datatypes.Date   `json:"end_date"`
	Quantity  int              `json:"quantity"`
}

func modelToResponseItem(model models.Rent) ResponseItem {
	var review *ReviewShort = nil
	if model.Review != nil {
		review = &ReviewShort{
			ID: model.Review.ID,
		}
	}
	return ResponseItem{
		ID: model.ID,
		Product: ProductShort{
			ID:   model.ProductID,
			Name: model.ProductSnapshot.Name,
		},
		User: UserShort{
			ID:   model.UserAccountID,
			Name: model.OwnerSnapshotName,
		},
		Review:    review,
		State:     model.State,
		StartDate: model.StartDate,
		EndDate:   model.EndDate,
		Quantity:  model.Quantity,
	}
}

type GetByIdRequest struct {
	ID uint `param:"id"`
}

// TODO: Verification, Image, Rating, Transcation success count, Joinat, Primary Address
type UserDetails struct {
	ID   uint   `json:"id"`
	Name string `json:"name"`
}

type ReviewDetails struct {
	ID      uint   `json:"id"`
	Rating  uint   `json:"rating"`
	Content string `json:"content"`
}

type ResponseItemDetails struct {
	ID        uint             `json:"id"`
	Product   ProductShort     `json:"product"`
	User      UserDetails      `json:"user"`
	Review    *ReviewDetails   `json:"review"`
	State     models.RentState `json:"state"`
	StartDate datatypes.Date   `json:"start_date"`
	EndDate   datatypes.Date   `json:"end_date"`
	Quantity  int              `json:"quantity"`
}

func modelToResponseItemDetails(model models.Rent) ResponseItemDetails {
	var review *ReviewDetails = nil
	if model.Review != nil {
		review = &ReviewDetails{
			ID:      model.Review.ID,
			Rating:  model.Review.Rating,
			Content: model.Review.Content,
		}
	}
	return ResponseItemDetails{
		ID: model.ID,
		Product: ProductShort{
			ID:   model.ProductID,
			Name: model.ProductSnapshot.Name,
		},
		User: UserDetails{
			ID:   model.UserAccountID,
			Name: model.OwnerSnapshotName,
		},
		Review:    review,
		State:     model.State,
		StartDate: model.StartDate,
		EndDate:   model.EndDate,
		Quantity:  model.Quantity,
	}
}

type ReceiveRequest struct {
	ID uint `param:"id"`
}

type RequestReturnRequest struct {
	ID uint `param:"id"`
}

type AddReviewRequest struct {
	ID      uint   `param:"id"`
	Rating  uint   `json:"rating" validate:"required,min=1,max=5"`
	Content string `json:"content" validate:"required"`
}

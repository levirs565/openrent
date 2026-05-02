package owner_rent

import (
	"openrent-server/core"
	"openrent-server/models"
	"time"

	"gorm.io/datatypes"
)

type ProductShort struct {
	ID       uint    `json:"id"`
	Name     string  `json:"name"`
	ImageURL *string `json:"image_url"`
}

type UserShort struct {
	ID   uint   `json:"id"`
	Name string `json:"name"`
}

type ResponseItem struct {
	ID        uint             `json:"id"`
	Product   ProductShort     `json:"product"`
	User      UserShort        `json:"user"`
	State     models.RentState `json:"state"`
	StartDate datatypes.Date   `json:"start_date"`
	EndDate   datatypes.Date   `json:"end_date"`
	Quantity  int              `json:"quantity"`
}

func modelToResponseItem(model models.Rent) ResponseItem {
	return ResponseItem{
		ID: model.ID,
		Product: ProductShort{
			ID:   model.ProductID,
			Name: model.ProductSnapshot.Name,
		},
		User: UserShort{
			ID:   model.UserAccountID,
			Name: model.RenterSnapshotName,
		},
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
	ID           uint                      `json:"id"`
	Product      core.RentProductDetail    `json:"product"`
	User         UserDetails               `json:"user"`
	Review       *ReviewDetails            `json:"review"`
	State        models.RentState          `json:"state"`
	StartDate    datatypes.Date            `json:"start_date"`
	EndDate      datatypes.Date            `json:"end_date"`
	Quantity     int                       `json:"quantity"`
	Cancellation *core.RentCancellationDto `json:"cancellation"`
	Payment      core.RentPaymentDto       `json:"payment"`
	ReturnedAt   *time.Time                `json:"returned_at"`
}

func modelToResponseItemDetails(model models.Rent) ResponseItemDetails {
	var review *ReviewDetails
	if model.Review != nil {
		review = &ReviewDetails{
			ID:      model.Review.ID,
			Rating:  model.Review.Rating,
			Content: model.Review.Content,
		}
	}
	return ResponseItemDetails{
		ID:      model.ID,
		Product: core.RentProductDetailFromModel(model),
		User: UserDetails{
			ID:   model.UserAccountID,
			Name: model.RenterSnapshotName,
		},
		Cancellation: core.RentCancellationFromModel(model),
		ReturnedAt:   model.ReturnedAt,
		Payment:      core.RentPaymentFromModel(model),
		Review:       review,
		State:        model.State,
		StartDate:    model.StartDate,
		EndDate:      model.EndDate,
		Quantity:     model.Quantity,
	}
}

type ApproveRequest struct {
	ID uint `param:"id"`
}

type RejectRequest struct {
	ID   uint   `param:"id"`
	Note string `json:"note" validate:"required"`
}

type CancelRequest struct {
	ID   uint   `param:"id"`
	Note string `json:"note" validate:"required"`
}

type HandoverRequest struct {
	ID      uint `param:"id"`
	Payment *int `json:"payment" validate:"required"`
}

type ConfirmReturnRequest struct {
	ID                uint `param:"id"`
	FinalPayment      *int `json:"final_payment" validate:"required"`
	LateFinePayment   *int `json:"late_fine_payment" validate:"required"`
	DamageFinePayment *int `json:"damage_fine_payment" validate:"required"`
}

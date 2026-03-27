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
			Name: model.OwnerSnapshotName,
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

type ResponseItemDetails struct {
	ID        uint             `json:"id"`
	Product   ProductShort     `json:"product"`
	User      UserDetails      `json:"user"`
	State     models.RentState `json:"state"`
	StartDate datatypes.Date   `json:"start_date"`
	EndDate   datatypes.Date   `json:"end_date"`
	Quantity  int              `json:"quantity"`
}

func modelToResponseItemDetails(model models.Rent) ResponseItemDetails {
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
		State:     model.State,
		StartDate: model.StartDate,
		EndDate:   model.EndDate,
		Quantity:  model.Quantity,
	}
}

type ReceiveRequest struct {
	ID uint `param:"id"`
}

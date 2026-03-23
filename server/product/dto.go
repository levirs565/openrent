package product

import (
	"openrent-server/models"
	"time"
)

type ListRequest struct {
	Owner bool   `query:"owner"`
	Query string `query:"q"`
}

type UserData struct {
	ID   uint   `json:"id"`
	Name string `json:"name"`
}

type ResponseItemShort struct {
	ID          uint      `json:"id"`
	User        UserData  `json:"user"`
	CreatedAt   time.Time `json:"created_at"`
	UpdatedAt   time.Time `json:"updated_at"`
	Name        string    `json:"name"`
	PricePerDay int       `json:"price_per_day"`
	Stock       int       `json:"stock"`
}

func modelToResponseShort(model models.Product) ResponseItemShort {
	return ResponseItemShort{
		ID: model.ID,
		User: UserData{
			ID:   model.UserAccountID,
			Name: model.UserAccount.Account.Name,
		},
		CreatedAt:   model.CreatedAt,
		UpdatedAt:   model.UpdatedAt,
		Name:        model.Name,
		PricePerDay: model.PricePerDay,
		Stock:       model.Stock,
	}
}

type ResponseItem struct {
	ID            uint      `json:"id"`
	User          UserData  `json:"user"`
	CreatedAt     time.Time `json:"created_at"`
	UpdatedAt     time.Time `json:"updated_at"`
	Name          string    `json:"name"`
	PricePerDay   int       `json:"price_per_day"`
	LateFeePerDay int       `json:"late_fee_per_day"`
	Stock         int       `json:"stock"`
	Description   string    `json:"description"`
}

func modelToResponse(model models.Product) ResponseItem {
	return ResponseItem{
		ID: model.ID,
		User: UserData{
			ID:   model.UserAccountID,
			Name: model.UserAccount.Account.Name,
		},
		CreatedAt:     model.CreatedAt,
		UpdatedAt:     model.UpdatedAt,
		Name:          model.Name,
		PricePerDay:   model.PricePerDay,
		LateFeePerDay: model.LateFeePerDay,
		Stock:         model.Stock,
		Description:   model.Description,
	}
}

type GetByIdRequest struct {
	ID uint `param:"id"`
}

type AddRequest struct {
	Name          string `json:"name" validate:"required"`
	PricePerDay   int    `json:"price_per_day" validate:"required"`
	LateFeePerDay int    `json:"late_fee_per_day" validate:"required"`
	Stock         int    `json:"stock" validate:"required"`
	Description   string `json:"description" validate:"required"`
}

func addRequestToModel(item AddRequest) models.Product {
	return models.Product{
		Name:          item.Name,
		PricePerDay:   item.PricePerDay,
		LateFeePerDay: item.LateFeePerDay,
		Stock:         item.Stock,
		Description:   item.Description,
	}
}

type UpdateRequest struct {
	AddRequest
	ID uint `param:"id"`
}

type DeleteRequest struct {
	ID uint `param:"id"`
}

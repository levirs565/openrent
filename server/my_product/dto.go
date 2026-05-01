package my_product

import (
	"openrent-server/models"
	"time"
)

type ResponseItemShortAddress struct {
	ID   uint   `json:"id"`
	Name string `json:"name"`
}

type ResponseItemShort struct {
	ID          uint                     `json:"id"`
	CreatedAt   time.Time                `json:"created_at"`
	UpdatedAt   time.Time                `json:"updated_at"`
	Name        string                   `json:"name"`
	PricePerDay int                      `json:"price_per_day"`
	Stock       int                      `json:"stock"`
	Address     ResponseItemShortAddress `json:"address"`
}

func modelToResponseShort(model models.Product) ResponseItemShort {
	return ResponseItemShort{
		ID: model.ID,
		Address: ResponseItemShortAddress{
			ID:   model.UserAddressID,
			Name: model.UserAddress.Name,
		},
		CreatedAt:   model.CreatedAt,
		UpdatedAt:   model.UpdatedAt,
		Name:        model.Name,
		PricePerDay: model.PricePerDay,
		Stock:       model.Stock,
	}
}

type ResponseItemAddress struct {
	ID            uint    `json:"id"`
	Name          string  `json:"name"`
	Province      string  `json:"province"`
	Regency       string  `json:"regency"`
	District      string  `json:"district"`
	AddressDetail string  `json:"detail"`
	Lat           float64 `json:"lat"`
	Lng           float64 `json:"lng"`
}

type ResponseItem struct {
	ID            uint                `json:"id"`
	CreatedAt     time.Time           `json:"created_at"`
	UpdatedAt     time.Time           `json:"updated_at"`
	Name          string              `json:"name"`
	PricePerDay   int                 `json:"price_per_day"`
	LateFeePerDay int                 `json:"late_fee_per_day"`
	Stock         int                 `json:"stock"`
	Description   string              `json:"description"`
	Address       ResponseItemAddress `json:"address"`
}

func modelToResponse(model models.Product) ResponseItem {
	return ResponseItem{
		ID: model.ID,
		Address: ResponseItemAddress{
			ID:            model.UserAddressID,
			Name:          model.UserAddress.Name,
			Province:      model.UserAddress.Province,
			Regency:       model.UserAddress.Regency,
			District:      model.UserAddress.District,
			AddressDetail: model.UserAddress.AddressDetail,
			Lat:           model.UserAddress.Location.Lat,
			Lng:           model.UserAddress.Location.Lng,
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

type AddRequest struct {
	Name          string `json:"name" validate:"required"`
	AddressID     uint   `json:"address_id" validate:"required"`
	PricePerDay   int    `json:"price_per_day" validate:"required"`
	LateFeePerDay int    `json:"late_fee_per_day" validate:"required"`
	Stock         int    `json:"stock" validate:"required"`
	Description   string `json:"description" validate:"required"`
}

func addRequestToModel(item AddRequest) models.Product {
	return models.Product{
		Name:          item.Name,
		UserAddressID: item.AddressID,
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

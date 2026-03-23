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

type ResponseItemShortAddress struct {
	ID      uint    `json:"id"`
	Regency string  `json:"regency"`
	Lat     float64 `json:"lat"`
	Lng     float64 `json:"lng"`
}

type ResponseItemShort struct {
	ID          uint                     `json:"id"`
	User        UserData                 `json:"user"`
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
		User: UserData{
			ID:   model.UserAccountID,
			Name: model.UserAccount.Account.Name,
		},
		Address: ResponseItemShortAddress{
			ID:      model.UserAddressID,
			Regency: model.UserAddress.Regency,
			Lat:     model.UserAddress.Location.Lat,
			Lng:     model.UserAddress.Location.Lng,
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
	Province      string  `json:"province"`
	Regency       string  `json:"regency"`
	District      string  `json:"district"`
	AddressDetail string  `json:"detail"`
	Lat           float64 `json:"lat"`
	Lng           float64 `json:"lng"`
}

type ResponseItem struct {
	ID            uint                `json:"id"`
	User          UserData            `json:"user"`
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
		User: UserData{
			ID:   model.UserAccountID,
			Name: model.UserAccount.Account.Name,
		},
		Address: ResponseItemAddress{
			ID:            model.UserAddressID,
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

type GetByIdRequest struct {
	ID uint `param:"id"`
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

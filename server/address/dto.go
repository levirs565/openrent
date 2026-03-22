package address

import (
	"openrent-server/models"
	"time"

	"github.com/restayway/gogis"
)

type ResponseItem struct {
	ID            uint      `json:"id"`
	CreatedAt     time.Time `json:"created_at"`
	UpdatedAt     time.Time `json:"updated_at"`
	Name          string    `json:"name"`
	Province      string    `json:"province"`
	Regency       string    `json:"regency"`
	District      string    `json:"district"`
	AddressDetail string    `json:"detail"`
	Lat           float64   `json:"lat"`
	Lng           float64   `json:"lng"`
}

func modelToResponse(model models.UserAddress) ResponseItem {
	return ResponseItem{
		ID:            model.ID,
		CreatedAt:     model.CreatedAt,
		UpdatedAt:     model.UpdatedAt,
		Name:          model.Name,
		Province:      model.Province,
		Regency:       model.Regency,
		District:      model.District,
		AddressDetail: model.AddressDetail,
		Lat:           model.Location.Lat,
		Lng:           model.Location.Lng,
	}
}

type GetByIdRequest struct {
	ID uint `param:"id"`
}

type AddRequest struct {
	Name          string `json:"name" validate:"required"`
	Province      string `json:"province" validate:"required"`
	Regency       string `json:"regency" validate:"required"`
	District      string `json:"district" validate:"required"`
	AddressDetail string `json:"detail" validate:"required"`
	// TODO: Fix This
	Lat float64 `json:"lat"`
	Lng float64 `json:"lng"`
}

func addRequestToResponse(item AddRequest) models.UserAddress {
	return models.UserAddress{
		Name:          item.Name,
		Province:      item.Province,
		Regency:       item.Regency,
		District:      item.District,
		AddressDetail: item.AddressDetail,
		Location: gogis.Point{
			Lng: item.Lng,
			Lat: item.Lat,
		},
	}
}

type UpdateRequest struct {
	AddRequest
	ID uint `param:"id"`
}

type DeleteRequest struct {
	ID uint `param:"id"`
}

package product

import (
	"openrent-server/core"
	"openrent-server/models"
	"time"
)

type ListRequest struct {
	Owner           bool     `query:"owner"`
	Query           string   `query:"q"`
	DisableAISearch bool     `query:"no_ai_search"`
	Regions         []string `query:"regions"`
	Lat             float64  `query:"lat"`
	Lng             float64  `query:"lng" validate:"required_with=Lat"`
	RadiusKM        int      `query:"radius_km" validate:"required_with=Lng"`
}

type ResponseItemShortAddress struct {
	ID      uint    `json:"id"`
	Regency string  `json:"regency"`
	Lat     float64 `json:"lat"`
	Lng     float64 `json:"lng"`
}

type ResponseItemShort struct {
	ID          uint                     `json:"id"`
	User        core.UserData            `json:"user"`
	CreatedAt   time.Time                `json:"created_at"`
	UpdatedAt   time.Time                `json:"updated_at"`
	Name        string                   `json:"name"`
	PricePerDay int                      `json:"price_per_day"`
	Stock       int                      `json:"stock"`
	Address     ResponseItemShortAddress `json:"address"`
	ImageURL    *string                  `json:"image_url"`
}

func modelToResponseShort(model models.Product) ResponseItemShort {
	return ResponseItemShort{
		ID: model.ID,
		User: core.UserData{
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
	User          core.UserData       `json:"user"`
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
		User: core.UserData{
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

type ResponseItemDetail struct {
	ResponseItem
	Recommendations []ResponseItemShort `json:"recommendations"`
	TopReviews      []core.ReviewDetail `json:"top_reviews"`
	ImageURL        *string             `json:"image_url"`
}

type GetByIdRequest struct {
	ID uint `param:"id"`
}

// TODO: Validate EndDate > StartDate
type RentRequest struct {
	ID        uint      `param:"id"`
	StartDate time.Time `json:"start_date" validate:"required"`
	EndDate   time.Time `json:"end_date" validate:"required"`
	Quantity  int       `json:"quantity" validate:"required"`
}

type ListReviewRequest struct {
	ID uint `param:"id"`
}

// TODO: Refactor

// TODO: Sort by, ASC or DES, Paging?

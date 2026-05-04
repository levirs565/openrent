package my_product

import (
	"openrent-server/core"
	"openrent-server/models"
	"time"
)

type GetByIdRequest struct {
	ID uint `param:"id"`
}

type ResponseItemRentCount struct {
	Pending       int `json:"pending"`
	Ready         int `json:"ready"`
	OnRent        int `json:"on_rent"`
	PendingReturn int `json:"pending_return"`
	Late          int `json:"late"`
}

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
	RentCount   ResponseItemRentCount    `json:"rent_count"`
	ImageURL    *string                  `json:"image_url"`
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

type UserShort struct {
	ID   uint   `json:"id"`
	Name string `json:"name"`
}

type RentItem struct {
	ID        uint             `json:"id"`
	User      UserShort        `json:"user"`
	State     models.RentState `json:"state"`
	StartDate time.Time        `json:"start_date"`
	EndDate   time.Time        `json:"end_date"`
	Quantity  int              `json:"quantity"`
}

func modelToRentItem(model models.Rent) RentItem {
	return RentItem{
		ID: model.ID,
		User: UserShort{
			ID:   model.UserAccountID,
			Name: model.RenterSnapshotName,
		},
		State:     model.State,
		StartDate: core.ConvertDateToTime(model.StartDate),
		EndDate:   core.ConvertDateToTimeForEnd(model.EndDate),
		Quantity:  model.Quantity,
	}
}

type ResponseItemDetail struct {
	ResponseItem
	ImageURL     *string                 `json:"image_url"`
	TopReviews   []core.ReviewDetail     `json:"top_reviews"`
	Rents        []RentItem              `json:"rents"`
	Availability []core.RentAvailability `json:"availability"`
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

type ImagePresignedRequest struct {
	ID          uint   `param:"id"`
	Size        int64  `json:"size" validate:"required,min=1"`
	ContentType string `json:"content_type" validate:"required"`
}

type ImageConfirmRequest struct {
	ID   uint   `param:"id"`
	Name string `json:"name" validate:"required"`
}

type ImagePresignResponse struct {
	Name    string              `json:"name"`
	URL     string              `json:"url"`
	Method  string              `json:"method"`
	Headers map[string][]string `json:"headers"`
}

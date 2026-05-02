package core

import "openrent-server/models"

type RentCancellationDto struct {
	Reason models.RentCancelReason `json:"reason"`
	Note   string                  `json:"note"`
}

func RentCancellationFromModel(model models.Rent) *RentCancellationDto {
	var cancellation *RentCancellationDto
	if model.CancelReason != nil {
		cancellation = &RentCancellationDto{
			Reason: *model.CancelReason,
		}
		if model.CancelReasonNote != nil {
			cancellation.Note = *model.CancelReasonNote
		}
	}
	return cancellation
}

type UserData struct {
	ID   uint   `json:"id"`
	Name string `json:"name"`
}

type ReviewDetail struct {
	ID      uint     `json:"id"`
	User    UserData `json:"user"`
	Rating  uint     `json:"rating"`
	Content string   `json:"content"`
}

func ReviewDetailFromModel(item models.Review) ReviewDetail {
	return ReviewDetail{
		ID: item.ID,
		User: UserData{
			ID:   item.Rent.UserAccountID,
			Name: item.Rent.RenterSnapshotName,
		},
		Rating:  item.Rating,
		Content: item.Content,
	}
}

type RentPaymentDto struct {
	Initial    *int `json:"initial"`
	Final      *int `json:"final"`
	LateFine   *int `json:"late_fine"`
	DamageFine *int `json:"damage_fine"`
}

func RentPaymentFromModel(model models.Rent) RentPaymentDto {
	return RentPaymentDto{
		Initial:    model.InitialPayment,
		Final:      model.FinalPayment,
		LateFine:   model.LateFinePayment,
		DamageFine: model.DamageFinePayment,
	}
}

type RentProductAddressDetail struct {
	Province      string  `json:"province"`
	Regency       string  `json:"regency"`
	District      string  `json:"district"`
	AddressDetail string  `json:"detail"`
	Latitude      float64 `json:"latitude"`
	Longitude     float64 `json:"longitude"`
}

type RentProductDetail struct {
	ID            uint                     `json:"id"`
	Name          string                   `json:"name"`
	ImageURL      *string                  `json:"image_url"`
	PricePerDay   int                      `json:"price_per_day"`
	LateFeePerDay int                      `json:"late_fee_per_day"`
	Address       RentProductAddressDetail `json:"address"`
}

func RentProductDetailFromModel(model models.Rent) RentProductDetail {
	address := model.ProductSnapshot.Details.Data().UserAddress
	return RentProductDetail{
		ID:            model.ProductID,
		Name:          model.ProductSnapshot.Name,
		PricePerDay:   model.ProductSnapshot.PricePerDay,
		LateFeePerDay: model.ProductSnapshot.LateFeePerDay,
		Address: RentProductAddressDetail{
			Province:      address.Province,
			Regency:       address.Regency,
			District:      address.District,
			AddressDetail: address.AddressDetail,
			Latitude:      address.Location.Lat,
			Longitude:     address.Location.Lng,
		},
	}
}

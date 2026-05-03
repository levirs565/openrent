package core

import (
	"context"
	"openrent-server/models"

	"gorm.io/datatypes"
	"gorm.io/gorm"
)

type RentAvailability struct {
	StartDate datatypes.Date `json:"start_date"`
	EndDate   datatypes.Date `json:"end_date"`
	Quantity  int            `json:"quantity"`
	IsOverdue bool           `json:"is_overdue"`
}

func GetRentAvailability(
	ctx context.Context,
	db *gorm.DB,
	productID uint,
) ([]RentAvailability, error) {
	var result []RentAvailability
	err := gorm.G[models.Rent](db).
		Select(
			"rents.start_date", "rents.end_date", "rents.quantity",
			"(rents.end_date < CURRENT_DATE) as is_overdue",
		).
		Where("rents.product_id = ?", productID).
		Where(
			"rents.state NOT IN ?",
			[]models.RentState{
				models.RentStateAwaitingFinalPayment,
				models.RentStateCompleted,
				models.RentStateCancelled,
			},
		).
		Scan(ctx, &result)

	if err != nil {
		return []RentAvailability{}, err
	}

	return result, nil
}

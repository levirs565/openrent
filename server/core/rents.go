package core

import (
	"context"
	"openrent-server/models"
	"time"

	"github.com/samber/lo"
	"gorm.io/datatypes"
	"gorm.io/gorm"
)

type RentAvailability struct {
	StartDate time.Time `json:"start_date"`
	EndDate   time.Time `json:"end_date"`
	Quantity  int       `json:"quantity"`
	IsOverdue bool      `json:"is_overdue"`
}

func GetRentAvailability(
	ctx context.Context,
	db *gorm.DB,
	productID uint,
) ([]RentAvailability, error) {
	type row struct {
		StartDate datatypes.Date
		EndDate   datatypes.Date
		Quantity  int
		IsOverdue bool
	}

	var result []row
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

	return lo.Map(result, func(item row, index int) RentAvailability {
		return RentAvailability{
			StartDate: ConvertDateToTime(item.StartDate),
			EndDate:   ConvertDateToTimeForEnd(item.EndDate),
			Quantity:  item.Quantity,
			IsOverdue: item.IsOverdue,
		}
	}), nil
}

package core

import (
	"context"
	"openrent-server/models"

	"gorm.io/gorm"
	"gorm.io/gorm/clause"
)

// TODO: Must moved to service
func GetProductTopReviews(ctx context.Context, db *gorm.DB, id uint) ([]models.Review, error) {
	// TODO Sort by AI
	return gorm.G[models.Review](db).
		Select("reviews.id", "reviews.rating", "reviews.content").
		Joins(
			clause.JoinTarget{Association: "Rent"},
			func(db gorm.JoinBuilder, joinTable, curTable clause.Table) error {
				db.Select("user_account_id", "renter_snapshot_name")
				return nil
			},
		).
		Where(`"Rent".product_id = ?`, id).
		Limit(5).
		Find(ctx)
}

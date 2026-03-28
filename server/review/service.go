package review

import (
	"context"
	"errors"
	"openrent-server/models"

	"gorm.io/gorm"
	"gorm.io/gorm/clause"
)

var ErrNotFound = errors.New("review not found")

type Service struct {
	db *gorm.DB
}

func NewService(db *gorm.DB) *Service {
	return &Service{
		db: db,
	}
}

func (s *Service) Update(ctx context.Context, userId uint, request UpdateReviewRequest) error {
	count, err := gorm.G[models.Review](s.db.Debug()).
		Joins(clause.JoinTarget{Association: "Rent"}, nil).
		Where("reviews.id = ?", request.ID).
		Where(`"Rent".user_account_id = ?`, userId).
		Count(ctx, "*")
	if err != nil {
		return err
	}
	if count == 0 {
		return ErrNotFound
	}

	model := updateReviewRequestToModel(request)
	rows, err := gorm.G[models.Review](s.db).
		Where("reviews.id = ?", request.ID).
		Updates(ctx, model)
	if err != nil {
		return err
	}
	if rows == 0 {
		return ErrNotFound
	}
	return nil
}

func (s *Service) Delete(ctx context.Context, userId uint, id uint) error {
	count, err := gorm.G[models.Review](s.db.Debug()).
		Joins(clause.JoinTarget{Association: "Rent"}, nil).
		Where("reviews.id = ?", id).
		Where(`"Rent".user_account_id = ?`, userId).
		Count(ctx, "*")
	if err != nil {
		return err
	}
	if count == 0 {
		return ErrNotFound
	}

	rows, err := gorm.G[models.Review](s.db).
		Where("reviews.id = ?", id).
		Delete(ctx)
	if err != nil {
		return err
	}
	if rows == 0 {
		return ErrNotFound
	}
	return nil
}

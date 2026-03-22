package product

import (
	"context"
	"errors"
	"fmt"
	"openrent-server/models"

	"github.com/samber/lo"
	"gorm.io/gorm"
	"gorm.io/gorm/clause"
)

var ErrNotFound = errors.New("Product not found")

type Service struct {
	db *gorm.DB
}

func NewService(db *gorm.DB) *Service {
	return &Service{
		db: db,
	}
}

func (s *Service) List(ctx context.Context, userId uint, parameters ListRequest) ([]ResponseItemShort, error) {
	// TODO: Paging
	q := s.db.WithContext(ctx).Model(&models.Product{})

	if parameters.Owner {
		q = q.Where("user_account_id = ?", userId)
	}
	if len(parameters.Query) > 0 {
		pattern := fmt.Sprintf("%%%s%%", parameters.Query)
		q = q.Where("name ILIKE ? OR description ILIKE ?", pattern, pattern)
	}

	var products []models.Product
	result := q.Limit(50).Find(&products)

	if result.Error != nil {
		return []ResponseItemShort{}, result.Error
	}

	var mapped = lo.Map(products, func(item models.Product, index int) ResponseItemShort {
		return modelToResponseShort(item)
	})
	return mapped, nil
}

func (s *Service) GetById(ctx context.Context, id uint) (ResponseItem, error) {
	model, err := gorm.G[models.Product](s.db).Where("id = ?", id).First(ctx)

	if err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return ResponseItem{}, ErrNotFound
		}
		return ResponseItem{}, err
	}

	return modelToResponse(model), nil
}

func (s *Service) Add(ctx context.Context, userId uint, product AddRequest) (ResponseItem, error) {
	model := addRequestToModel(product)
	model.UserAccountID = userId

	err := gorm.G[models.Product](s.db).Create(ctx, &model)
	if err != nil {
		return ResponseItem{}, err
	}

	return modelToResponse(model), nil
}

func (s *Service) Update(ctx context.Context, userId uint, product UpdateRequest) (ResponseItem, error) {
	model := addRequestToModel(product.AddRequest)
	model.UserAccountID = userId
	model.ID = product.ID

	updates := []models.Product{}
	result := s.db.WithContext(ctx).
		Model(&updates).
		Clauses(clause.Returning{}).
		Where("user_account_id = ? AND id = ?", userId, product.ID).
		Updates(model)

	if result.Error != nil {
		return ResponseItem{}, result.Error
	}
	if result.RowsAffected == 0 {
		return ResponseItem{}, ErrNotFound
	}

	return modelToResponse(updates[0]), nil
}

func (s *Service) Delete(ctx context.Context, userId uint, id uint) error {
	rows, err := gorm.G[models.Product](s.db).
		Where("user_account_id = ? and id = ?", userId, id).
		Delete(ctx)
	if err != nil {
		return err
	}
	if rows == 0 {
		return ErrNotFound
	}
	return nil
}

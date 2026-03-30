package address

import (
	"context"
	"errors"
	"openrent-server/models"

	"github.com/samber/lo"
	"gorm.io/gorm"
	"gorm.io/gorm/clause"
)

var ErrNotFound = errors.New("address not found")

type Service struct {
	db *gorm.DB
}

func NewService(db *gorm.DB) *Service {
	return &Service{
		db: db,
	}
}

func (s *Service) List(ctx context.Context, userId uint) ([]ResponseItem, error) {
	list, err := gorm.G[models.UserAddress](s.db).
		Where("user_account_id = ?", userId).
		Order("name ASC").Find(ctx)

	if err != nil {
		return []ResponseItem{}, err
	}

	return lo.Map(list, func(item models.UserAddress, index int) ResponseItem {
		return modelToResponse(item)
	}), nil
}

func (s *Service) Get(ctx context.Context, userId uint, id uint) (ResponseItem, error) {
	item, err := gorm.G[models.UserAddress](s.db).
		Where("user_account_id = ? AND id = ?", userId, id).
		First(ctx)

	if err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return ResponseItem{}, ErrNotFound
		}
		return ResponseItem{}, err
	}

	return modelToResponse(item), nil
}

func (s *Service) Add(ctx context.Context, userId uint, item AddRequest) (ResponseItem, error) {
	model := addRequestToResponse(item)
	model.UserAccountID = userId

	err := gorm.G[models.UserAddress](s.db).Create(ctx, &model)
	if err != nil {
		return ResponseItem{}, err
	}

	return modelToResponse(model), nil
}

func (s *Service) Update(ctx context.Context, userId uint, id uint, item AddRequest) (ResponseItem, error) {
	model := addRequestToResponse(item)
	model.ID = id
	model.UserAccountID = userId

	updates := []models.UserAddress{}
	result := s.db.WithContext(ctx).Model(&updates).
		Clauses(clause.Returning{}).
		Where("id = ? and user_account_id = ?", id, userId).
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
	rows, err := gorm.G[models.UserAddress](s.db).
		Where("id = ? and user_account_id = ?", id, userId).
		Delete(ctx)
	if err != nil {
		return err
	}
	if rows == 0 {
		return ErrNotFound
	}
	return nil
}

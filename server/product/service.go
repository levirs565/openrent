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
	q := s.db.WithContext(ctx).
		Model(&models.Product{}).
		Select(
			"products.id", "products.created_at", "products.updated_at",
			"products.name", "products.price_per_day", "products.stock",
			"products.user_account_id", "products.user_address_id",
		).
		Joins("UserAccount.Account", s.db.Select("name")).
		Joins("UserAddress", s.db.Select("regency", "location"))

	if len(parameters.Regions) > 0 {
		q = q.Where(
			`"UserAddress".regency IN ? OR "UserAddress".province IN ?`,
			parameters.Regions, parameters.Regions,
		)
	}
	if parameters.Lat != 0 && parameters.Lng != 0 && parameters.RadiusKM != 0 {
		q = q.Where(
			`ST_DWithin(
				"UserAddress".location::geography,
				ST_SetSRID(ST_Point(?, ?), 4326)::geography,
				?
			)`,
			parameters.Lng, parameters.Lat, parameters.RadiusKM*1000,
		)
	}
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
	model, err := gorm.G[models.Product](s.db).
		Select(
			"products.id", "products.created_at", "products.updated_at",
			"products.name", "products.price_per_day", "products.late_fee_per_day",
			"products.stock", "products.description", "products.user_account_id",
			"products.user_address_id",
		).
		Joins(
			clause.JoinTarget{Association: "UserAccount.Account"},
			func(db gorm.JoinBuilder, joinTable, curTable clause.Table) error {
				db.Select("name")
				return nil
			},
		).
		Joins(
			clause.JoinTarget{Association: "UserAddress"},
			func(db gorm.JoinBuilder, joinTable, curTable clause.Table) error {
				db.Select("province", "regency", "district", "address_detail", "location")
				return nil
			},
		).
		Where("products.id = ?", id).First(ctx)

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
	// Check address is deleted or not

	err := gorm.G[models.Product](s.db).Create(ctx, &model)
	if err != nil {
		return ResponseItem{}, err
	}

	model, err = gorm.G[models.Product](s.db).
		Select(
			"products.id", "products.created_at", "products.updated_at",
			"products.name", "products.price_per_day", "products.late_fee_per_day",
			"products.stock", "products.description", "products.user_account_id",
			"products.user_address_id",
		).
		Joins(
			clause.JoinTarget{Association: "UserAccount.Account"},
			func(db gorm.JoinBuilder, joinTable, curTable clause.Table) error {
				db.Select("name")
				return nil
			},
		).
		Joins(
			clause.JoinTarget{Association: "UserAddress"},
			func(db gorm.JoinBuilder, joinTable, curTable clause.Table) error {
				db.Select("province", "regency", "district", "address_detail", "location")
				return nil
			},
		).
		Where("products.id = ?", model.ID).First(ctx)

	if err != nil {
		return ResponseItem{}, err
	}

	return modelToResponse(model), nil
}

func (s *Service) Update(ctx context.Context, userId uint, product UpdateRequest) (ResponseItem, error) {
	model := addRequestToModel(product.AddRequest)
	model.UserAccountID = userId
	model.ID = product.ID

	rows, err := gorm.G[models.Product](s.db).
		Where("user_account_id = ? AND id = ?", userId, product.ID).
		Updates(ctx, model)

	if err != nil {
		return ResponseItem{}, err
	}
	if rows == 0 {
		return ResponseItem{}, ErrNotFound
	}

	model, err = gorm.G[models.Product](s.db).
		Select(
			"products.id", "products.created_at", "products.updated_at",
			"products.name", "products.price_per_day", "products.late_fee_per_day",
			"products.stock", "products.description", "products.user_account_id",
			"products.user_address_id",
		).
		Joins(
			clause.JoinTarget{Association: "UserAccount.Account"},
			func(db gorm.JoinBuilder, joinTable, curTable clause.Table) error {
				db.Select("name")
				return nil
			},
		).
		Joins(
			clause.JoinTarget{Association: "UserAddress"},
			func(db gorm.JoinBuilder, joinTable, curTable clause.Table) error {
				db.Select("province", "regency", "district", "address_detail", "location")
				return nil
			},
		).
		Where("products.id = ?", model.ID).First(ctx)

	return modelToResponse(model), nil
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

package my_product

import (
	"context"
	"errors"
	"fmt"
	"openrent-server/core"
	"openrent-server/embedding"
	"openrent-server/models"

	"github.com/pgvector/pgvector-go"
	"github.com/samber/lo"
	"gorm.io/gorm"
	"gorm.io/gorm/clause"
)

var ErrNotFound = errors.New("product not found")

type Service struct {
	db       *gorm.DB
	embedder embedding.AIEmbedder
}

func NewService(db *gorm.DB, embedder embedding.AIEmbedder) *Service {
	return &Service{
		db:       db,
		embedder: embedder,
	}
}

func (s *Service) List(ctx context.Context, userId uint) ([]ResponseItemShort, error) {
	type productWithRents struct {
		models.Product
		PendingRentCount   int
		ReadyRentCount     int
		OnRentCount        int
		PendingReturnCount int
		LateCount          int
	}

	var products []productWithRents
	err := gorm.G[models.Product](s.db.Debug()).
		Select(
			`
				products.id, products.created_at, products.updated_at,
				products.name, products.price_per_day, products.stock,
				products.user_address_id,
				"UserAddress".name AS "UserAddress__name",
				? AS pending_rent_count,
				? AS ready_rent_count,
				? AS on_rent_count,
				? AS pending_return_count,
				? AS late_count
			`,
			gorm.Expr(
				`SUM (CASE WHEN "Rent".state = ? THEN 1 ELSE 0 END)`,
				models.RentStatePendingApproval,
			),
			gorm.Expr(
				`SUM (CASE WHEN "Rent".state IN ? THEN 1 ELSE 0 END)`,
				[]models.RentState{models.RentStateReadyForPickup, models.RentStateAwaitingHandover},
			),
			gorm.Expr(
				`SUM (CASE WHEN "Rent".state = ? THEN 1 ELSE 0 END)`,
				models.RentStateOnRent,
			),
			gorm.Expr(
				`SUM (CASE WHEN "Rent".state = ? THEN 1 ELSE 0 END)`,
				models.RentStateAwaitingReturnConfirmation,
			),
			gorm.Expr(
				`SUM (CASE WHEN "Rent".state NOT IN ? AND "Rent".end_date < CURRENT_DATE THEN 1 ELSE 0 END)`,
				[]models.RentState{
					models.RentStateAwaitingFinalPayment,
					models.RentStateCompleted,
					models.RentStateCancelled,
				},
			),
		).
		Joins(
			clause.JoinTarget{Association: "UserAddress"},
			func(db gorm.JoinBuilder, joinTable, curTable clause.Table) error {
				return nil
			},
		).
		Joins(
			clause.JoinTarget{Association: "Rent", Type: clause.LeftJoin},
			func(db gorm.JoinBuilder, joinTable, curTable clause.Table) error {
				return nil
			},
		).
		Group(`products.id, "UserAddress".id`).
		Where("products.user_account_id = ?", userId).
		Scan(ctx, &products)

	if err != nil {
		return []ResponseItemShort{}, err
	}

	var mapped = lo.Map(products, func(item productWithRents, index int) ResponseItemShort {
		return ResponseItemShort{
			ID: item.ID,
			Address: ResponseItemShortAddress{
				ID:   item.UserAddressID,
				Name: item.UserAddress.Name,
			},
			CreatedAt:   item.CreatedAt,
			UpdatedAt:   item.UpdatedAt,
			Name:        item.Name,
			PricePerDay: item.PricePerDay,
			Stock:       item.Stock,
			RentCount: ResponseItemRentCount{
				Pending:       item.PendingRentCount,
				Ready:         item.ReadyRentCount,
				OnRent:        item.OnRentCount,
				PendingReturn: item.PendingReturnCount,
				Late:          item.LateCount,
			},
		}
	})
	return mapped, nil
}

func (s *Service) GetById(ctx context.Context, userId uint, id uint) (ResponseItemDetail, error) {
	model, err := gorm.G[models.Product](s.db).
		Select(
			"products.id", "products.created_at", "products.updated_at",
			"products.name", "products.price_per_day", "products.late_fee_per_day",
			"products.stock", "products.description", "products.user_address_id",
		).
		Joins(
			clause.JoinTarget{Association: "UserAddress"},
			func(db gorm.JoinBuilder, joinTable, curTable clause.Table) error {
				db.Select("province", "regency", "district", "address_detail", "location", "name")
				return nil
			},
		).
		Where("products.id = ?", id).
		Where("products.user_account_id = ?", userId).
		First(ctx)

	if err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return ResponseItemDetail{}, ErrNotFound
		}
		return ResponseItemDetail{}, err
	}

	reviews, err := core.GetProductTopReviews(ctx, s.db, id)

	if err != nil {
		return ResponseItemDetail{}, err
	}

	return ResponseItemDetail{
		ResponseItem: modelToResponse(model),
		TopReviews: lo.Map(reviews, func(item models.Review, index int) core.ReviewDetail {
			return core.ReviewDetailFromModel(item)
		}),
	}, nil
}

func (s *Service) Add(ctx context.Context, userId uint, product AddRequest) (ResponseItem, error) {
	model := addRequestToModel(product)
	model.UserAccountID = userId
	// Check address is deleted or not

	embed, err := s.embedProduct(ctx, model.Name, model.Description)
	if err != nil {
		return ResponseItem{}, err
	}
	model.Embedding = pgvector.NewVector(embed)

	err = gorm.G[models.Product](s.db).Create(ctx, &model)
	if err != nil {
		return ResponseItem{}, err
	}

	model, err = gorm.G[models.Product](s.db).
		Select(
			"products.id", "products.created_at", "products.updated_at",
			"products.name", "products.price_per_day", "products.late_fee_per_day",
			"products.stock", "products.description", "products.user_account_id",
		).
		Joins(
			clause.JoinTarget{Association: "UserAddress"},
			func(db gorm.JoinBuilder, joinTable, curTable clause.Table) error {
				db.Select("province", "regency", "district", "address_detail", "location", "name")
				return nil
			},
		).
		Where("products.id = ?", model.ID).First(ctx)

	if err != nil {
		return ResponseItem{}, err
	}

	return modelToResponse(model), nil
}

func (s *Service) embedProduct(ctx context.Context, name string, description string) ([]float32, error) {
	content := fmt.Sprintf("Product: %s, Description: %s", name, description)
	return s.embedder.Embed(ctx, content)
}

func (s *Service) Update(ctx context.Context, userId uint, product UpdateRequest) (ResponseItem, error) {
	model := addRequestToModel(product.AddRequest)
	model.UserAccountID = userId
	model.ID = product.ID

	embed, err := s.embedProduct(ctx, model.Name, model.Description)
	if err != nil {
		return ResponseItem{}, err
	}
	model.Embedding = pgvector.NewVector(embed)

	// TODO: Lock Stock
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
		).
		Joins(
			clause.JoinTarget{Association: "UserAddress"},
			func(db gorm.JoinBuilder, joinTable, curTable clause.Table) error {
				db.Select("province", "regency", "district", "address_detail", "location", "name")
				return nil
			},
		).
		Where("products.id = ?", model.ID).First(ctx)
	if err != nil {
		return ResponseItem{}, err
	}

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

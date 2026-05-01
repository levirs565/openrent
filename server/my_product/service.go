package my_product

import (
	"context"
	"errors"
	"fmt"
	"openrent-server/embedding"
	"openrent-server/models"

	"github.com/pgvector/pgvector-go"
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

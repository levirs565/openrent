package product

import (
	"context"
	"errors"
	"fmt"
	"openrent-server/core"
	"openrent-server/embedding"
	"openrent-server/models"
	"openrent-server/notification"
	"strconv"

	"firebase.google.com/go/v4/messaging"
	"github.com/aws/aws-sdk-go-v2/service/s3"
	"github.com/pgvector/pgvector-go"
	"github.com/samber/lo"
	"gorm.io/datatypes"
	"gorm.io/gorm"
	"gorm.io/gorm/clause"
)

var ErrNotFound = errors.New("product not found")
var ErrStockUnavailable = errors.New("stock unavailable")
var ErrCannotRentOwnedProduct = errors.New("cannnot rent owned product")

type Service struct {
	db           *gorm.DB
	embedder     embedding.AIEmbedder
	notification notification.Service
	s3           *s3.Client
	s3Bucket     string
}

func NewService(
	db *gorm.DB, embedder embedding.AIEmbedder, notification notification.Service,
	s3 *s3.Client, s3Bucket string,
) *Service {
	return &Service{
		db:           db,
		embedder:     embedder,
		notification: notification,
		s3:           s3,
		s3Bucket:     s3Bucket,
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
			"products.image_name",
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
		q = q.Where("products.user_account_id = ?", userId)
	}
	if len(parameters.Query) > 0 {
		if parameters.DisableAISearch {
			pattern := fmt.Sprintf("%%%s%%", parameters.Query)
			q = q.Where("products.name ILIKE ? OR products.description ILIKE ?", pattern, pattern)
		} else {
			content := fmt.Sprintf("Product search: %s", parameters.Query)
			vector, err := s.embedder.Embed(ctx, content)
			if err != nil {
				return []ResponseItemShort{}, err
			}

			q = q.Where("(products.embedding <=> ?) < 0.3", pgvector.NewVector(vector))
		}
	}

	if !parameters.StartDate.IsZero() && !parameters.EndDate.IsZero() {
		quntity := parameters.Quantity
		if quntity == 0 {
			quntity = 1
		}
		q = q.Joins(`
				LEFT JOIN rents ON
				rents.product_id = products.id AND
				rents.state NOT IN ? AND
				(
					(rents.start_date <= ? AND rents.end_date >= ?) OR
					(rents.end_date < CURRENT_DATE)
				)
				`,
			[]models.RentState{
				models.RentStateAwaitingFinalPayment,
				models.RentStateCompleted,
				models.RentStateCancelled,
			},
			datatypes.Date(parameters.EndDate),
			datatypes.Date(parameters.StartDate),
		).
			Group(`products.id, "UserAccount__Account".id,  "UserAddress".id`).
			Having("products.stock - COALESCE(SUM(rents.quantity), 0) >= ?", quntity)
	}

	var products []models.Product
	result := q.Limit(50).Find(&products)

	if result.Error != nil {
		return []ResponseItemShort{}, result.Error
	}

	var mapped = lo.Map(products, func(item models.Product, index int) ResponseItemShort {
		result := modelToResponseShort(item)
		result.ImageURL = core.FormatProductImageUrl(s.s3, s.s3Bucket, item.ID, item.ImageName)
		return result
	})
	return mapped, nil
}

func (s *Service) GetById(ctx context.Context, id uint) (ResponseItemDetail, error) {
	model, err := gorm.G[models.Product](s.db).
		Select(
			"products.id", "products.created_at", "products.updated_at",
			"products.name", "products.price_per_day", "products.late_fee_per_day",
			"products.stock", "products.description", "products.user_account_id",
			"products.user_address_id", "products.embedding", "products.image_name",
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
			return ResponseItemDetail{}, ErrNotFound
		}
		return ResponseItemDetail{}, err
	}

	recomendations, err := gorm.G[models.Product](s.db).
		Select(
			"products.id", "products.created_at", "products.updated_at",
			"products.name", "products.price_per_day", "products.stock",
			"products.user_account_id", "products.user_address_id",
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
				db.Select("regency", "location")
				return nil
			},
		).
		Where("(products.embedding <=> ?) < 0.2", model.Embedding).
		Where("products.id <> ?", model.ID).
		Order(clause.OrderBy{
			Expression: gorm.Expr("(products.embedding <=> ?) ASC", model.Embedding),
		}).
		Limit(10).
		Find(ctx)
	if err != nil {
		return ResponseItemDetail{}, err
	}

	reviews, err := core.GetProductTopReviews(ctx, s.db, id)
	if err != nil {
		return ResponseItemDetail{}, err
	}

	return ResponseItemDetail{
		ResponseItem: modelToResponse(model),
		Recommendations: lo.Map(recomendations, func(item models.Product, index int) ResponseItemShort {
			return modelToResponseShort(item)
		}),
		TopReviews: lo.Map(reviews, func(item models.Review, index int) core.ReviewDetail {
			return core.ReviewDetailFromModel(item)
		}),
		ImageURL: core.FormatProductImageUrl(s.s3, s.s3Bucket, model.ID, model.ImageName),
	}, nil
}

func (s *Service) Rent(ctx context.Context, userId uint, request RentRequest) error {
	// TODO: Buffern?
	// TODO: Cron expired rent
	// TODO: Lock timeour? Maybe not needed, because of ctx timeout
	var ownerId uint
	var productName string
	var renterName string
	var rentalId uint
	err := s.db.Transaction(func(tx *gorm.DB) error {
		model := models.Product{}
		err := tx.WithContext(ctx).
			Model(&model).
			Clauses(clause.Locking{Strength: "UPDATE"}).
			Select("stock", "user_account_id").
			First(&model, request.ID).Error
		if err != nil {
			if errors.Is(err, gorm.ErrRecordNotFound) {
				return ErrNotFound
			}
			return err
		}

		if model.UserAccountID == userId {
			return ErrCannotRentOwnedProduct
		}

		var reservedStock int
		err = gorm.G[models.Rent](tx).
			Where("rents.product_id = ?", request.ID).
			Where(
				"rents.state NOT IN ?",
				[]models.RentState{
					models.RentStateAwaitingFinalPayment,
					models.RentStateCompleted,
					models.RentStateCancelled,
				},
			).
			Where(clause.Or(
				clause.And(
					gorm.Expr("rents.start_date <= ?", datatypes.Date(request.EndDate)),
					gorm.Expr("rents.end_date >= ?", datatypes.Date(request.StartDate)),
				),
				gorm.Expr("rents.end_date < CURRENT_DATE"),
			)).
			Select("COALESCE(SUM(rents.quantity), 0)").
			Scan(ctx, &reservedStock)
		if err != nil {
			return err
		}

		if request.Quantity+reservedStock > model.Stock {
			return ErrStockUnavailable
		}

		ownerId = model.UserAccountID

		model, err = gorm.G[models.Product](tx).
			Select(
				"products.name", "products.price_per_day",
				"products.late_fee_per_day", "products.description",
				"products.image_name",
			).
			Joins(
				clause.JoinTarget{Association: "UserAddress"},
				func(db gorm.JoinBuilder, joinTable, curTable clause.Table) error {
					db.Select("province", "regency", "district", "address_detail", "location")
					return nil
				},
			).
			Joins(
				clause.JoinTarget{Association: "UserAccount.Account"},
				func(db gorm.JoinBuilder, joinTable, curTable clause.Table) error {
					db.Select("name")
					return nil
				},
			).
			Where("products.id", request.ID).
			First(ctx)
		if err != nil {
			return err
		}

		userData, err := gorm.G[models.Account](tx).
			Select("name").
			Where("id = ?", userId).
			First(ctx)
		if err != nil {
			return err
		}

		productName = model.Name
		renterName = userData.Name

		rentModel := models.Rent{
			ProductID:     request.ID,
			UserAccountID: userId,
			State:         models.RentStatePendingApproval,
			ProductSnapshot: models.RentProductSnapshot{
				Name:          model.Name,
				PricePerDay:   model.PricePerDay,
				LateFeePerDay: model.LateFeePerDay,
				ImageName:     model.ImageName,
				Details: datatypes.NewJSONType(models.RentProductDetailsSnapshot{
					Description: model.Description,
					UserAddress: models.RentAddressSnapshot{
						Province:      model.UserAddress.Province,
						Regency:       model.UserAddress.Regency,
						District:      model.UserAddress.District,
						AddressDetail: model.UserAddress.AddressDetail,
						Location:      model.UserAddress.Location,
					},
				}),
			},
			OwnerSnapshotName:  model.UserAccount.Account.Name,
			RenterSnapshotName: userData.Name,
			StartDate:          datatypes.Date(request.StartDate),
			EndDate:            datatypes.Date(request.EndDate),
			Quantity:           request.Quantity,
		}
		err = gorm.G[models.Rent](tx).Create(ctx, &rentModel)
		if err != nil {
			return err
		}
		rentalId = rentModel.ID

		return nil
	})

	if err != nil {
		return err
	}

	err = s.notification.SendNotification(ctx, ownerId, notification.Notification{
		Data: map[string]string{
			"type":       "rent_request",
			"product_id": strconv.FormatUint(uint64(request.ID), 10),
			"rentals_id": strconv.FormatUint(uint64(rentalId), 10),
		},
		Notification: &messaging.Notification{
			Title: fmt.Sprintf("New rent request for product %s", productName),
			Body:  fmt.Sprintf("New rent request from %s", renterName),
		},
	})
	if err != nil {
		return err
	}
	return nil
}

func (s *Service) ListReview(ctx context.Context, userId uint, request ListReviewRequest) ([]core.ReviewDetail, error) {
	reviews, err := gorm.G[models.Review](s.db).
		Select("reviews.id", "reviews.rating", "reviews.content").
		Joins(
			clause.JoinTarget{Association: "Rent"},
			func(db gorm.JoinBuilder, joinTable, curTable clause.Table) error {
				db.Select("user_account_id", "renter_snapshot_name")
				return nil
			},
		).
		Where(`"Rent".product_id = ?`, request.ID).
		Find(ctx)

	if err != nil {
		return []core.ReviewDetail{}, nil
	}

	return lo.Map(reviews, func(item models.Review, index int) core.ReviewDetail {
		return core.ReviewDetailFromModel(item)
	}), nil
}

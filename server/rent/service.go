package rent

import (
	"context"
	"errors"
	"fmt"
	"openrent-server/core"
	"openrent-server/models"
	"openrent-server/notification"
	"strconv"
	"time"

	"firebase.google.com/go/v4/messaging"
	"github.com/aws/aws-sdk-go-v2/service/s3"
	"github.com/samber/lo"
	"gorm.io/gorm"
	"gorm.io/gorm/clause"
)

var ErrNotFound = errors.New("rent not found")
var ErrNotReady = errors.New("rent is not ready")
var ErrNotActive = errors.New("rent is not active")
var ErrNotCompleted = errors.New("rent is not completed")
var ErrReviewDuplicated = errors.New("review is duplicated")

type Service struct {
	db           *gorm.DB
	notification notification.Service
	s3           *s3.Client
	s3Bucket     string
}

func NewService(db *gorm.DB, notification notification.Service, s3 *s3.Client, s3Bucket string) *Service {
	return &Service{
		db:           db,
		notification: notification,
		s3:           s3,
		s3Bucket:     s3Bucket,
	}
}

func (s *Service) list(ctx context.Context, userId uint) ([]ResponseItem, error) {
	result, err := gorm.G[models.Rent](s.db).
		Select(
			"rents.id", "rents.state", "rents.start_date", "rents.end_date",
			"rents.quantity", "rents.product_id", "rents.user_account_id",
			"rents.owner_snapshot_name", "rents.product_snapshot_name",
			"rents.product_snapshot_image_name",
		).
		Joins(
			clause.JoinTarget{Type: clause.LeftJoin, Association: "Review"},
			func(db gorm.JoinBuilder, joinTable, curTable clause.Table) error {
				db.Select("id")
				return nil
			},
		).
		Joins(
			clause.JoinTarget{Type: clause.LeftJoin, Association: "Product"},
			func(db gorm.JoinBuilder, joinTable, curTable clause.Table) error {
				db.Select("user_account_id")
				return nil
			},
		).
		Where(`rents.user_account_id = ?`, userId).
		Find(ctx)

	if err != nil {
		return []ResponseItem{}, err
	}

	list := lo.Map(result, func(item models.Rent, index int) ResponseItem {
		result := modelToResponseItem(item)
		result.Product.ImageURL = core.FormatProductImageUrl(s.s3, s.s3Bucket, item.ProductID, item.ProductSnapshot.ImageName)
		return result
	})
	return list, nil
}

func (s *Service) getById(ctx context.Context, userId uint, id uint) (ResponseItemDetails, error) {
	result, err := gorm.G[models.Rent](s.db).
		Select(
			"rents.id", "rents.state", "rents.start_date", "rents.end_date",
			"rents.quantity", "rents.product_id", "rents.user_account_id",
			"rents.owner_snapshot_name", "rents.product_snapshot_name",
			"rents.cancel_reason", "rents.cancel_reason_note",
			"rents.product_snapshot_image_name",
			"rents.product_snapshot_details",
			"rents.product_snapshot_price_per_day",
			"rents.product_snapshot_late_fee_per_day",
			"rents.initial_payment",
			"rents.final_payment",
			"rents.late_fine_payment",
			"rents.damage_fine_payment",
			"rents.returned_at",
		).
		Joins(
			clause.JoinTarget{Type: clause.LeftJoin, Association: "Review"},
			func(db gorm.JoinBuilder, joinTable, curTable clause.Table) error {
				db.Select("id", "rating", "content")
				return nil
			},
		).
		Joins(
			clause.JoinTarget{Type: clause.LeftJoin, Association: "Product"},
			func(db gorm.JoinBuilder, joinTable, curTable clause.Table) error {
				db.Select("user_account_id")
				return nil
			},
		).
		Where("rents.id = ?", id).
		Where(`rents.user_account_id = ?`, userId).
		First(ctx)

	if err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return ResponseItemDetails{}, ErrNotFound
		}
		return ResponseItemDetails{}, err
	}

	response := modelToResponseItemDetails(result)
	response.Product.ImageURL = core.FormatProductImageUrl(s.s3, s.s3Bucket, result.ProductID, result.ProductSnapshot.ImageName)
	return response, nil
}

func (s *Service) receive(ctx context.Context, userId uint, id uint) error {
	data, err := gorm.G[models.Rent](s.db).
		Select("rents.state", "rents.product_snapshot_name", "rents.start_date").
		Joins(
			clause.JoinTarget{Association: "Product"},
			func(db gorm.JoinBuilder, joinTable, curTable clause.Table) error {
				db.Select("user_account_id")
				return nil
			},
		).
		Where("rents.id = ?", id).
		Where(`rents.user_account_id = ?`, userId).
		First(ctx)
	if err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return ErrNotFound
		}
		return err
	}
	if data.State != models.RentStateReadyForPickup {
		return ErrNotReady
	}

	if time.Now().Before(core.ConvertDateToTime(data.StartDate)) {
		return ErrNotReady
	}

	model := models.Rent{}
	model.State = models.RentStateAwaitingHandover

	rowsAffected, err := gorm.G[models.Rent](s.db).
		Where("rents.id = ?", id).
		Where("rents.state = ?", models.RentStateReadyForPickup).
		Select("State").
		Updates(ctx, model)
	if rowsAffected == 0 {
		return ErrNotFound
	}
	if err != nil {
		return err
	}

	err = s.notification.SendNotification(ctx, data.Product.UserAccountID, notification.Notification{
		Data: map[string]string{
			"type":    "rent_receive",
			"rent_id": strconv.FormatUint(uint64(id), 10),
		},
		Notification: &messaging.Notification{
			Title: "Rent need handover",
			Body:  fmt.Sprintf("Rent for %s is ready for handover", data.ProductSnapshot.Name),
		},
	})
	if err != nil {
		return err
	}

	return nil
}

func (s *Service) requestReturn(ctx context.Context, userId uint, id uint) error {
	data, err := gorm.G[models.Rent](s.db).
		Select("rents.state", "rents.product_snapshot_name").
		Joins(
			clause.JoinTarget{Association: "Product"},
			func(db gorm.JoinBuilder, joinTable, curTable clause.Table) error {
				db.Select("user_account_id")
				return nil
			},
		).
		Where("rents.id = ?", id).
		Where(`rents.user_account_id = ?`, userId).
		First(ctx)
	if err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return ErrNotFound
		}
		return err
	}
	if data.State != models.RentStateOnRent {
		return ErrNotActive
	}

	model := models.Rent{}
	model.State = models.RentStateAwaitingReturnConfirmation

	rowsAffected, err := gorm.G[models.Rent](s.db).
		Where("rents.id = ?", id).
		Where("rents.state = ?", models.RentStateOnRent).
		Select("State").
		Updates(ctx, model)
	if rowsAffected == 0 {
		return ErrNotFound
	}
	if err != nil {
		return err
	}

	err = s.notification.SendNotification(ctx, data.Product.UserAccountID, notification.Notification{
		Data: map[string]string{
			"type":    "rent_return",
			"rent_id": strconv.FormatUint(uint64(id), 10),
		},
		Notification: &messaging.Notification{
			Title: "Rent need return confirmation",
			Body:  fmt.Sprintf("Rent for %s is ready for return", data.ProductSnapshot.Name),
		},
	})
	if err != nil {
		return err
	}

	return nil
}

func (s *Service) addReview(ctx context.Context, userId uint, reqest AddReviewRequest) error {
	data, err := gorm.G[models.Rent](s.db).
		Select("state").
		Where("id = ?", reqest.ID).
		Where("user_account_id = ?", userId).
		First(ctx)

	if err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return ErrNotFound
		}
		return err
	}
	if data.State != models.RentStateCompleted {
		return ErrNotCompleted
	}
	model := models.Review{
		RentID:  reqest.ID,
		Rating:  reqest.Rating,
		Content: reqest.Content,
	}
	err = gorm.G[models.Review](s.db).Create(ctx, &model)
	if err != nil {
		if errors.Is(err, gorm.ErrDuplicatedKey) {
			rows, err := gorm.G[models.Review](s.db.Debug()).
				Scopes(func(db *gorm.Statement) {
					db.Unscoped = true
				}).
				Select("*").
				Omit("id").
				Where("rent_id = ?", reqest.ID).
				Where("deleted_at IS NOT NULL").
				Updates(ctx, model)
			if err != nil {
				return err
			}
			if rows == 0 {
				return ErrReviewDuplicated
			}
		} else {
			return err
		}
	}
	// cancelled need review?, AI sort
	return nil
}

package rent

import (
	"context"
	"errors"
	"openrent-server/models"

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
	db *gorm.DB
}

func NewService(db *gorm.DB) *Service {
	return &Service{
		db: db,
	}
}

func (s *Service) list(ctx context.Context, userId uint) ([]ResponseItem, error) {
	result, err := gorm.G[models.Rent](s.db).
		Select(
			"rents.id", "rents.state", "rents.start_date", "rents.end_date",
			"rents.quantity", "rents.product_id", "rents.user_account_id",
			"rents.owner_snapshot_name", "rents.product_snapshot_name",
		).
		Joins(
			clause.JoinTarget{Type: clause.LeftJoin, Association: "Review"},
			func(db gorm.JoinBuilder, joinTable, curTable clause.Table) error {
				db.Select("id")
				return nil
			},
		).
		Where(`user_account_id = ?`, userId).
		Find(ctx)

	if err != nil {
		return []ResponseItem{}, err
	}

	list := lo.Map(result, func(item models.Rent, index int) ResponseItem {
		return modelToResponseItem(item)
	})
	return list, nil
}

func (s *Service) getById(ctx context.Context, userId uint, id uint) (ResponseItemDetails, error) {
	result, err := gorm.G[models.Rent](s.db).
		Select(
			"rents.id", "rents.state", "rents.start_date", "rents.end_date",
			"rents.quantity", "rents.product_id", "rents.user_account_id",
			"rents.owner_snapshot_name", "rents.product_snapshot_name",
		).
		Joins(
			clause.JoinTarget{Type: clause.LeftJoin, Association: "Review"},
			func(db gorm.JoinBuilder, joinTable, curTable clause.Table) error {
				db.Select("id", "rating", "content")
				return nil
			},
		).
		Where("rents.id = ?", id).
		Where(`user_account_id = ?`, userId).
		First(ctx)

	if err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return ResponseItemDetails{}, ErrNotFound
		}
		return ResponseItemDetails{}, err
	}

	return modelToResponseItemDetails(result), nil
}

func (s *Service) receive(ctx context.Context, userId uint, id uint) error {
	data, err := gorm.G[models.Rent](s.db).
		Select("rents.state").
		Where("rents.id = ?", id).
		Where(`user_account_id = ?`, userId).
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

	// TODO: Notification
	return nil
}

func (s *Service) requestReturn(ctx context.Context, userId uint, id uint) error {
	data, err := gorm.G[models.Rent](s.db).
		Select("rents.state").
		Where("rents.id = ?", id).
		Where(`user_account_id = ?`, userId).
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

	// TODO: Notification
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
	// Notification, cancelled need review?, AI sort
	return nil
}

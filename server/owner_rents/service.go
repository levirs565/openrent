package owner_rents

import (
	"context"
	"errors"
	"openrent-server/models"
	"time"

	"github.com/samber/lo"
	"gorm.io/gorm"
	"gorm.io/gorm/clause"
)

var ErrNotFound = errors.New("Rent not found")
var ErrNotPending = errors.New("Rent is not waiting approval")
var ErrNotReady = errors.New("Rent is not ready")
var ErrCannotHandover = errors.New("Cannot handover rent")

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
			"rents.renter_snapshot_name", "rents.product_snapshot_name",
		).
		Joins(
			clause.JoinTarget{Association: "Product"},
			func(db gorm.JoinBuilder, joinTable, curTable clause.Table) error {
				db.Select("")
				return nil
			},
		).
		Where(`"Product".user_account_id = ?`, userId).
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
			"rents.renter_snapshot_name", "rents.product_snapshot_name",
		).
		Joins(
			clause.JoinTarget{Association: "Product"},
			func(db gorm.JoinBuilder, joinTable, curTable clause.Table) error {
				db.Select("")
				return nil
			},
		).
		Where("rents.id = ?", id).
		Where(`"Product".user_account_id = ?`, userId).
		First(ctx)

	if err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return ResponseItemDetails{}, ErrNotFound
		}
		return ResponseItemDetails{}, err
	}

	return modelToResponseItemDetails(result), nil
}

func (s *Service) approve(ctx context.Context, userId uint, id uint) error {
	data, err := gorm.G[models.Rent](s.db).
		Select("rents.state").
		Joins(
			clause.JoinTarget{Association: "Product"},
			func(db gorm.JoinBuilder, joinTable, curTable clause.Table) error {
				db.Select("")
				return nil
			},
		).
		Where("rents.id = ?", id).
		Where(`"Product".user_account_id = ?`, userId).
		First(ctx)
	if err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return ErrNotFound
		}
		return err
	}
	if data.State != models.RentStatePendingApproval {
		return ErrNotPending
	}

	model := models.Rent{}
	now := time.Now()
	model.ApprovedAt = &now
	model.State = models.RentStateReadyForPickup

	// TODO: Wait payment
	rowsAffected, err := gorm.G[models.Rent](s.db).
		Where("rents.id = ?", id).
		Where("rents.state = ?", models.RentStatePendingApproval).
		Select("ApprovedAt", "State").
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

func (s *Service) reject(ctx context.Context, userId uint, request RejectRequest) error {
	data, err := gorm.G[models.Rent](s.db).
		Select("rents.state").
		Joins(
			clause.JoinTarget{Association: "Product"},
			func(db gorm.JoinBuilder, joinTable, curTable clause.Table) error {
				db.Select("")
				return nil
			},
		).
		Where("rents.id = ?", request.ID).
		Where(`"Product".user_account_id = ?`, userId).
		First(ctx)
	if err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return ErrNotFound
		}
		return err
	}
	if data.State != models.RentStatePendingApproval {
		return ErrNotPending
	}

	model := models.Rent{}
	cancelReason := models.RentCancelReasonOwnerRejected
	model.CancelReason = &cancelReason
	model.CancelReasonNote = &request.Note
	model.State = models.RentStateCancelled

	rowsAffected, err := gorm.G[models.Rent](s.db).
		Where("rents.id = ?", request.ID).
		Where("rents.state = ?", models.RentStatePendingApproval).
		Select("CancelReason", "CancelReasonNote", "State").Updates(ctx, model)

	if rowsAffected == 0 {
		return ErrNotFound
	}
	if err != nil {
		return err
	}

	// TODO: Notification
	return nil
}

func (s *Service) cancel(ctx context.Context, userId uint, request CancelRequest) error {
	data, err := gorm.G[models.Rent](s.db).
		Select("rents.state").
		Joins(
			clause.JoinTarget{Association: "Product"},
			func(db gorm.JoinBuilder, joinTable, curTable clause.Table) error {
				db.Select("")
				return nil
			},
		).
		Where("rents.id = ?", request.ID).
		Where(`"Product".user_account_id = ?`, userId).
		First(ctx)
	if err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return ErrNotFound
		}
		return err
	}
	if data.State != models.RentStateOnRent {
		return ErrNotReady
	}

	model := models.Rent{}
	cancelReason := models.RentCancelReasonOwnerCancelled
	model.CancelReason = &cancelReason
	model.CancelReasonNote = &request.Note
	model.State = models.RentStateCancelled

	rowsAffected, err := gorm.G[models.Rent](s.db).
		Where("rents.id = ?", request.ID).
		Where("rents.state = ?", models.RentStateOnRent).
		Select("CancelReason", "CancelReasonNote", "State").Updates(ctx, model)

	if rowsAffected == 0 {
		return ErrNotFound
	}
	if err != nil {
		return err
	}

	// TODO: Notification
	return nil
}

func (s *Service) handover(ctx context.Context, userId uint, id uint) error {
	data, err := gorm.G[models.Rent](s.db).
		Select("rents.state").
		Joins(
			clause.JoinTarget{Association: "Product"},
			func(db gorm.JoinBuilder, joinTable, curTable clause.Table) error {
				db.Select("")
				return nil
			},
		).
		Where("rents.id = ?", id).
		Where(`"Product".user_account_id = ?`, userId).
		First(ctx)
	if err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return ErrNotFound
		}
		return err
	}
	if data.State != models.RentStateAwaitingHandover {
		return ErrCannotHandover
	}

	model := models.Rent{}
	model.State = models.RentStateOnRent

	// TODO: Wait payment
	rowsAffected, err := gorm.G[models.Rent](s.db).
		Where("rents.id = ?", id).
		Where("rents.state = ?", models.RentStateAwaitingHandover).
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

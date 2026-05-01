package owner_rent

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
var ErrNotPending = errors.New("rent is not waiting approval")
var ErrNotReady = errors.New("rent is not ready")
var ErrCannotHandover = errors.New("cannot handover rent")
var ErrReturnNotRequested = errors.New("return is not requested")

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
			"rents.renter_snapshot_name", "rents.product_snapshot_name",
			"rents.product_snapshot_image_name",
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
			"rents.renter_snapshot_name", "rents.product_snapshot_name",
			"rents.cancel_reason", "rents.cancel_reason_note",
			"rents.product_snapshot_image_name",
		).
		Joins(
			clause.JoinTarget{Association: "Product"},
			func(db gorm.JoinBuilder, joinTable, curTable clause.Table) error {
				db.Select("")
				return nil
			},
		).
		Joins(
			clause.JoinTarget{Association: "Review", Type: clause.LeftJoin},
			func(db gorm.JoinBuilder, joinTable, curTable clause.Table) error {
				db.Select("id", "rating", "content")
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

	response := modelToResponseItemDetails(result)
	response.Product.ImageURL = core.FormatProductImageUrl(s.s3, s.s3Bucket, result.ProductID, result.ProductSnapshot.ImageName)
	return response, nil
}

func (s *Service) approve(ctx context.Context, userId uint, id uint) error {
	data, err := gorm.G[models.Rent](s.db).
		Select("rents.state", "rents.user_account_id", "rents.product_snapshot_name").
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

	err = s.notification.SendNotification(ctx, data.UserAccountID, notification.Notification{
		Data: map[string]string{
			"type":    "rent_approved",
			"rent_id": strconv.FormatUint(uint64(id), 10),
		},
		Notification: &messaging.Notification{
			Title: "Your rent is approved",
			Body:  fmt.Sprintf("Rent for %s is approved", data.ProductSnapshot.Name),
		},
	})
	if err != nil {
		return err
	}

	return nil
}

func (s *Service) reject(ctx context.Context, userId uint, request RejectRequest) error {
	data, err := gorm.G[models.Rent](s.db).
		Select("rents.state", "rents.user_account_id", "rents.product_snapshot_name").
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

	err = s.notification.SendNotification(ctx, data.UserAccountID, notification.Notification{
		Data: map[string]string{
			"type":    "rent_rejected",
			"rent_id": strconv.FormatUint(uint64(request.ID), 10),
		},
		Notification: &messaging.Notification{
			Title: "Your rent is rejected",
			Body:  fmt.Sprintf("Rent for %s is rejected. Reason: %s", data.ProductSnapshot.Name, request.Note),
		},
	})
	if err != nil {
		return err
	}

	return nil
}

func (s *Service) cancel(ctx context.Context, userId uint, request CancelRequest) error {
	data, err := gorm.G[models.Rent](s.db).
		Select("rents.state", "rents.user_account_id", "rents.product_snapshot_name").
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
	// TODO: Check this state
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

	err = s.notification.SendNotification(ctx, data.UserAccountID, notification.Notification{
		Data: map[string]string{
			"type":    "rent_cancelled",
			"rent_id": strconv.FormatUint(uint64(request.ID), 10),
		},
		Notification: &messaging.Notification{
			Title: "Your rent is cancelled",
			Body:  fmt.Sprintf("Rent for %s is cancelled. Reason: %s", data.ProductSnapshot.Name, request.Note),
		},
	})
	if err != nil {
		return err
	}

	return nil
}

func (s *Service) handover(ctx context.Context, userId uint, id uint) error {
	data, err := gorm.G[models.Rent](s.db).
		Select("rents.state", "rents.user_account_id", "rents.product_snapshot_name").
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

	err = s.notification.SendNotification(ctx, data.UserAccountID, notification.Notification{
		Data: map[string]string{
			"type":    "rent_handover",
			"rent_id": strconv.FormatUint(uint64(id), 10),
		},
		Notification: &messaging.Notification{
			Title: "Hand over is success",
			Body:  fmt.Sprintf("Handover for %s", data.ProductSnapshot.Name),
		},
	})
	if err != nil {
		return err
	}

	return nil
}

func (s *Service) confirmReturn(ctx context.Context, userId uint, id uint) error {
	data, err := gorm.G[models.Rent](s.db).
		Select("rents.state", "rents.user_account_id", "rents.product_snapshot_name").
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
	if data.State != models.RentStateAwaitingReturnConfirmation {
		return ErrReturnNotRequested
	}

	// TODO: Payment
	model := models.Rent{}
	model.State = models.RentStateCompleted

	// TODO: Wait payment
	rowsAffected, err := gorm.G[models.Rent](s.db).
		Where("rents.id = ?", id).
		Where("rents.state = ?", models.RentStateAwaitingReturnConfirmation).
		Select("State").
		Updates(ctx, model)
	if rowsAffected == 0 {
		return ErrNotFound
	}
	if err != nil {
		return err
	}

	err = s.notification.SendNotification(ctx, data.UserAccountID, notification.Notification{
		Data: map[string]string{
			"type":    "rent_confirm_return",
			"rent_id": strconv.FormatUint(uint64(id), 10),
		},
		Notification: &messaging.Notification{
			Title: "Return is confirmed",
			Body:  fmt.Sprintf("Return for %s is confirmed", data.ProductSnapshot.Name),
		},
	})
	if err != nil {
		return err
	}

	return nil
}

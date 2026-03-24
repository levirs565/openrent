package models

import (
	"time"

	"gorm.io/datatypes"
	"gorm.io/gorm"
)

// type RequestState string

// const (
// 	RequestStatePending  RequestState = "pending"
// 	RequestStateAccepted RequestState = "accepted"
// 	RequestStateRejected RequestState = "rejected"
// )

type RentState string

const (
	RentStatePendingApproval            RentState = "pending"
	RentStateAwaitingInitialPayment     RentState = "initial_payment"
	RentStateReadyForPickup             RentState = "ready"
	RentStateOnRent                     RentState = "on_rent"
	RentStateAwaitingReturnConfirmation RentState = "return_pending"
	RentStateAwaitingFinalPayment       RentState = "final_payment"
	RentStateCompleted                  RentState = "completed"
	RentStateCancelled                  RentState = "cancelled"
)

type RentCancelReason string

const (
	RentCancelReasonApprovalTimeout       RentCancelReason = "approval_timeout"
	RentCancelReasonOwnerRejected         RentCancelReason = "owner_rejected"
	RentCancelReasonInitialPaymentTimeout RentCancelReason = "initial_payment_timeout"
	RentCancelReasonOwnerCancelled        RentCancelReason = "owner_cancelled"
	RentCancelReasonUserCancelled         RentCancelReason = "user_cancelled"
)

// TODO: Price, Product Snapshot?, Payment?
type Rent struct {
	gorm.Model
	ProductID     uint
	UserAccountID uint
	State         RentState
	StartDate     datatypes.Date
	EndDate       datatypes.Date
	Quantity      int
	ApprovedAt    *time.Time
	CancelReason  *RentCancelReason
}

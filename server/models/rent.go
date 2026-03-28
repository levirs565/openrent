package models

import (
	"time"

	"github.com/restayway/gogis"
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
	RentStateAwaitingHandover           RentState = "handover_pending"
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

type RentAddressSnapshot struct {
	Province      string      `json:"province"`
	Regency       string      `json:"regency"`
	District      string      `json:"district"`
	AddressDetail string      `json:"detail"`
	Location      gogis.Point `json:"location"`
}

type RentProductDetailsSnapshot struct {
	Description string              `json:"description"`
	UserAddress RentAddressSnapshot `json:"address"`
}

type RentProductSnapshot struct {
	Name          string
	PricePerDay   int
	LateFeePerDay int
	Details       datatypes.JSONType[RentProductDetailsSnapshot]
}

// TODO: Price, Payment?, Log?
type Rent struct {
	gorm.Model
	ProductID          uint
	Product            Product
	UserAccountID      uint
	UserAccount        UserAccount
	Review             *Review
	ProductSnapshot    RentProductSnapshot `gorm:"embedded;embeddedPrefix:product_snapshot_"`
	RenterSnapshotName string
	OwnerSnapshotName  string
	State              RentState
	StartDate          datatypes.Date
	EndDate            datatypes.Date
	Quantity           int
	ApprovedAt         *time.Time
	CancelReason       *RentCancelReason
	CancelReasonNote   *string
}

package core

import "openrent-server/models"

type RentCancellationDto struct {
	Reason models.RentCancelReason `json:"reason"`
	Note   string                  `json:"note"`
}

func RentCancellationFromModel(model models.Rent) *RentCancellationDto {
	var cancellation *RentCancellationDto
	if model.CancelReason != nil {
		cancellation = &RentCancellationDto{
			Reason: *model.CancelReason,
		}
		if model.CancelReasonNote != nil {
			cancellation.Note = *model.CancelReasonNote
		}
	}
	return cancellation
}

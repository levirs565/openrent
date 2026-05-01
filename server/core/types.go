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

type UserData struct {
	ID   uint   `json:"id"`
	Name string `json:"name"`
}

type ReviewDetail struct {
	ID      uint     `json:"id"`
	User    UserData `json:"user"`
	Rating  uint     `json:"rating"`
	Content string   `json:"content"`
}

func ReviewDetailFromModel(item models.Review) ReviewDetail {
	return ReviewDetail{
		ID: item.ID,
		User: UserData{
			ID:   item.Rent.UserAccountID,
			Name: item.Rent.RenterSnapshotName,
		},
		Rating:  item.Rating,
		Content: item.Content,
	}
}

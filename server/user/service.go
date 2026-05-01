package user

import (
	"context"
	"errors"
	"openrent-server/core"
	"openrent-server/models"

	"github.com/aws/aws-sdk-go-v2/service/s3"
	"gorm.io/gorm"
	"gorm.io/gorm/clause"
)

var ErrNotFound = errors.New("user not found")

type Service struct {
	db       *gorm.DB
	s3       *s3.Client
	s3Bucket string
}

func NewService(db *gorm.DB, s3 *s3.Client, s3Bucket string) *Service {
	return &Service{
		db:       db,
		s3:       s3,
		s3Bucket: s3Bucket,
	}
}

func (s *Service) GetUser(ctx context.Context, id uint) (*ResponseShort, error) {
	model, err := gorm.G[models.UserAccount](s.db).
		Select("account_id", "avatar_name").
		Joins(
			clause.JoinTarget{Association: "Account"},
			func(db gorm.JoinBuilder, joinTable, curTable clause.Table) error {
				db.Select("name")
				return nil
			},
		).
		Where("account_id = ?", id).
		First(ctx)
	if err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return nil, ErrNotFound
		}
		return nil, err
	}

	return &ResponseShort{
		ID:        model.AccountID,
		Name:      model.Account.Name,
		AvatarURL: core.FormatUserAvatarUrl(s.s3, s.s3Bucket, id, model.AvatarName),
	}, nil
}

package auth

import (
	"context"
	"errors"
	"fmt"
	"strings"
	"time"

	"openrent-server/models"

	"github.com/alexedwards/argon2id"
	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/aws/aws-sdk-go-v2/service/s3"
	"github.com/google/uuid"
	"gorm.io/gorm"
	"gorm.io/gorm/clause"
)

var ErrEmailDuplicated = errors.New("email already exists")
var ErrEmailNotFound = errors.New("email not found")
var ErrPasswordNotMatch = errors.New("password not match")
var ErrUserNotFound = errors.New("user not found")
var ErrInvalidContentType = errors.New("invalid content type")
var ErrAvatarSizeExceedLimit = errors.New("avatar size exceeds limits")
var ErrAvatarNotFound = errors.New("avatar not found")
var ErrFCMTokenNotFound = errors.New("fcm token not found")

type Service struct {
	db       *gorm.DB
	s3       *s3.Client
	s3Bucket string
}

func NewService(db *gorm.DB, s3Client *s3.Client, s3Bucket string) *Service {
	return &Service{
		db:       db,
		s3:       s3Client,
		s3Bucket: s3Bucket,
	}
}

type CreateUserInput struct {
	Email    string
	Name     string
	Password string
}

var argon2idParams = argon2id.Params{
	Memory:      64 * 1024,
	Iterations:  3,
	Parallelism: 2,
	SaltLength:  16,
	KeyLength:   32,
}

func (s *Service) CreateUserAccount(ctx context.Context, input CreateUserInput) error {
	passwordHash, err := argon2id.CreateHash(input.Password, &argon2idParams)
	if err != nil {
		return err
	}

	err = gorm.G[models.Account](s.db).Create(ctx, &models.Account{
		Email:        input.Email,
		Name:         input.Name,
		PasswordHash: passwordHash,
		Role:         string(models.AccountRoleUser),
		User:         &models.UserAccount{},
	})

	if err != nil {
		if errors.Is(err, gorm.ErrDuplicatedKey) {
			return ErrEmailDuplicated
		}
	}
	return err
}

type LoginResult struct {
	ID   uint
	Role string
}

func (s *Service) Login(ctx context.Context, email string, password string) (LoginResult, error) {
	account, err := gorm.G[models.Account](s.db).Select(
		"ID", "PasswordHash", "Email", "Role").Where(&models.Account{Email: email}).First(ctx)

	if err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return LoginResult{}, ErrEmailNotFound
		}
		return LoginResult{}, err
	}

	match, err := argon2id.ComparePasswordAndHash(password, account.PasswordHash)

	if err != nil {
		return LoginResult{}, err
	}

	if !match {
		return LoginResult{}, ErrPasswordNotMatch
	}

	return LoginResult{
		ID:   account.ID,
		Role: account.Role,
	}, nil
}

// TODO: Is it bettet to expose ID?
type UserStateReponse struct {
	ID        uint    `json:"id"`
	Email     string  `json:"email"`
	Name      string  `json:"name"`
	Role      string  `json:"role"`
	AvatarURL *string `json:"avatar_url"`
}

func (s *Service) GetUserState(ctx context.Context, id uint) (UserStateReponse, error) {
	account, err := gorm.G[models.Account](s.db).Select(
		"accounts.id", "accounts.email", "accounts.role", "accounts.name",
	).Joins(
		clause.JoinTarget{Association: "User", Type: clause.LeftJoin},
		func(db gorm.JoinBuilder, joinTable, curTable clause.Table) error {
			db.Select("AvatarName")
			return nil
		},
	).Where(&models.Account{ID: id}, "ID").First(ctx)
	if err != nil {
		return UserStateReponse{}, err
	}

	var avatarURL *string
	if account.User != nil && account.User.AvatarName != "" {
		url := fmt.Sprintf(
			"%s/%s/%s",
			*s.s3.Options().BaseEndpoint,
			s.s3Bucket,
			formatAvatarKey(id, account.User.AvatarName, false),
		)
		avatarURL = &url
	}

	return UserStateReponse{
		ID:        account.ID,
		Email:     account.Email,
		Name:      account.Name,
		Role:      account.Role,
		AvatarURL: avatarURL,
	}, nil
}

type AvatarPresignResponse struct {
	Name    string              `json:"name"`
	URL     string              `json:"url"`
	Method  string              `json:"method"`
	Headers map[string][]string `json:"headers"`
}

func formatAvatarKey(userId uint, name string, temp bool) string {
	if temp {
		return fmt.Sprintf("temp/user/%d/avatar/%s", userId, name)
	}
	return fmt.Sprintf("public/user/%d/avatar/%s", userId, name)
}

func (s *Service) GetUserAvatarPresignedURL(ctx context.Context, userId uint, fileSize int64, contentType string) (AvatarPresignResponse, error) {
	name := uuid.NewString()
	key := formatAvatarKey(userId, name, true)
	presignClient := s3.NewPresignClient(s.s3)

	const maxSizeBytes int64 = 5 * 1024 * 1024 // 5 MB

	if fileSize > maxSizeBytes {
		return AvatarPresignResponse{}, ErrAvatarSizeExceedLimit
	}

	if !strings.HasPrefix(contentType, "image/") {
		return AvatarPresignResponse{}, ErrInvalidContentType
	}

	req, err := presignClient.PresignPutObject(ctx, &s3.PutObjectInput{
		Bucket:        aws.String(s.s3Bucket),
		Key:           aws.String(key),
		ContentLength: aws.Int64(fileSize),
		ContentType:   &contentType,
	}, s3.WithPresignExpires(60*time.Minute))

	if err != nil {
		return AvatarPresignResponse{}, err
	}

	return AvatarPresignResponse{
		Name:    name,
		URL:     req.URL,
		Method:  req.Method,
		Headers: req.SignedHeader,
	}, nil
}

func (s *Service) ConfirmUserAvatar(ctx context.Context, userId uint, name string) error {
	model, err := gorm.G[models.UserAccount](s.db).Select("avatar_name").Where("account_id = ?", userId).First(ctx)

	if err != nil {
		return err
	}

	tempKey := formatAvatarKey(userId, name, true)

	head, err := s.s3.HeadObject(ctx, &s3.HeadObjectInput{
		Bucket: aws.String(s.s3Bucket),
		Key:    aws.String(tempKey),
	})

	if err != nil {
		return err
	}

	if head.ContentLength == nil {
		return ErrAvatarNotFound
	}

	finalKey := formatAvatarKey(userId, name, false)

	_, err = s.s3.CopyObject(ctx, &s3.CopyObjectInput{
		Bucket:      aws.String(s.s3Bucket),
		Key:         aws.String(finalKey),
		CopySource:  aws.String(fmt.Sprintf("%s/%s", s.s3Bucket, tempKey)),
		ContentType: head.ContentType,
	})

	if err != nil {
		return err
	}

	rows, err := gorm.G[models.UserAccount](s.db).Where("account_id = ?", userId).Update(ctx, "avatar_name", name)

	if rows == 0 {
		return ErrUserNotFound
	}

	if err != nil {
		return err
	}

	if model.AvatarName != "" {
		_, err = s.s3.DeleteObject(ctx, &s3.DeleteObjectInput{
			Bucket: aws.String(s.s3Bucket),
			Key:    aws.String(formatAvatarKey(userId, model.AvatarName, false)),
		})

		if err != nil {
			return err
		}
	}

	return nil
}

type AddFCMResponse struct {
	ID uint `json:"id"`
}

func (s *Service) AddFCMToken(ctx context.Context, userId uint, token string) (AddFCMResponse, error) {
	model := models.FCMToken{
		UserAccountID: userId,
		Token:         token,
	}
	err := gorm.G[models.FCMToken](s.db).Create(ctx, &model)

	if err != nil {
		if errors.Is(err, gorm.ErrDuplicatedKey) {
			rows, err := gorm.G[models.FCMToken](s.db).Where("token = ?", token).Update(ctx, "user_account_id", userId)
			if err != nil {
				return AddFCMResponse{}, err
			}
			if rows == 0 {
				return AddFCMResponse{}, ErrFCMTokenNotFound
			}
			model, err = gorm.G[models.FCMToken](s.db).Where("token = ?", token).First(ctx)
			if err != nil {
				return AddFCMResponse{}, ErrFCMTokenNotFound
			}
		} else {
			return AddFCMResponse{}, err
		}
	}

	return AddFCMResponse{
		ID: model.ID,
	}, nil
}

func (s *Service) RemoveFCMToken(ctx context.Context, userId uint, id uint) error {
	rows, err := gorm.G[models.FCMToken](s.db).
		Where("user_account_id = ? AND id = ?", userId, id).
		Delete(ctx)

	if rows == 0 {
		return ErrFCMTokenNotFound
	}

	if err != nil {
		return err
	}

	return nil
}

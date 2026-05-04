package auth

import (
	"context"
	"errors"
	"fmt"
	"strings"
	"time"

	"openrent-server/core"
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
var ErrInvalidRefreshToken = errors.New("invalid refresh token")

type Service struct {
	db          *gorm.DB
	s3          *s3.Client
	s3Bucket    string
	tokenHelper *core.TokenHelper
}

func NewService(db *gorm.DB, s3Client *s3.Client, s3Bucket string, tokenHelper *core.TokenHelper) *Service {
	return &Service{
		db:          db,
		s3:          s3Client,
		s3Bucket:    s3Bucket,
		tokenHelper: tokenHelper,
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
	ID                    uint      `json:"id"`
	Role                  string    `json:"role"`
	RefreshToken          string    `json:"refresh_token"`
	RefreshTokenExpiresAt time.Time `json:"refresh_token_expires_at"`
	AccessToken           string    `json:"access_token"`
	AccessTokenExpiresAt  time.Time `json:"access_token_expires_at"`
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

	token, err := s.tokenHelper.GenerateToken(account.ID, models.AccountRole(account.Role))

	if err != nil {
		return LoginResult{}, err
	}

	err = gorm.G[models.RefreshToken](s.db).Create(ctx, &models.RefreshToken{
		AccountID: account.ID,
		TokenHash: token.RefreshTokenHash,
		ExpiresAt: token.RefreshTokenExpiresAt,
	})

	if err != nil {
		return LoginResult{}, err
	}

	return LoginResult{
		ID:                    account.ID,
		Role:                  account.Role,
		RefreshToken:          token.RefreshToken,
		RefreshTokenExpiresAt: token.RefreshTokenExpiresAt,
		AccessToken:           token.AccessToken,
		AccessTokenExpiresAt:  token.AccessTokenExpiresAt,
	}, nil
}

func (s *Service) Logout(ctx context.Context, refreshToken string) error {
	tokenHash := s.tokenHelper.HashToken(refreshToken)
	rowsAffected, err := gorm.G[models.RefreshToken](s.db).
		Where("token_hash = ?", tokenHash).
		Delete(ctx)
	if err != nil {
		return err
	}
	if rowsAffected == 0 {
		return ErrInvalidRefreshToken
	}
	return nil
}

type RefreshTokenResult struct {
	RefreshToken          string    `json:"refresh_token"`
	RefreshTokenExpiresAt time.Time `json:"refresh_token_expires_at"`
	AccessToken           string    `json:"access_token"`
	AccessTokenExpiresAt  time.Time `json:"access_token_expires_at"`
}

func (s *Service) RefreshToken(ctx context.Context, refreshToken string) (RefreshTokenResult, error) {
	tokenHash := s.tokenHelper.HashToken(refreshToken)
	var tokenResult *core.TokenResult

	err := s.db.Transaction(func(tx *gorm.DB) error {
		tokenModel := models.RefreshToken{}
		err := tx.WithContext(ctx).
			Model(&tokenModel).
			Clauses(clause.Locking{Strength: "UPDATE"}).
			Select("id", "expires_at", "account_id", "replaced_by_id").
			Where("token_hash = ?", tokenHash).
			First(&tokenModel).Error
		if err != nil {
			if errors.Is(err, gorm.ErrRecordNotFound) {
				return ErrInvalidRefreshToken
			}
			return err
		}

		if time.Now().After(tokenModel.ExpiresAt) {
			return ErrInvalidRefreshToken
		}

		// TODO: After token is deleted, query never return deleted token
		if tokenModel.ReplacedByID != nil {
			return ErrInvalidRefreshToken
		}

		userModel, err := gorm.G[models.Account](tx).
			Select("Role").
			Where("id = ?", tokenModel.AccountID).
			First(ctx)

		if err != nil {
			return err
		}

		newToken, err := s.tokenHelper.GenerateToken(tokenModel.AccountID, models.AccountRole(userModel.Role))
		if err != nil {
			return err
		}

		tokenResult = newToken

		newTokenModel := models.RefreshToken{
			AccountID: tokenModel.AccountID,
			TokenHash: newToken.RefreshTokenHash,
			ExpiresAt: newToken.RefreshTokenExpiresAt,
		}

		err = gorm.G[models.RefreshToken](tx).
			Create(ctx, &newTokenModel)

		if err != nil {
			return err
		}

		_, err = gorm.G[models.RefreshToken](tx).
			Where("id = ?", tokenModel.ID).
			Update(ctx, "replaced_by_id", newTokenModel.ID)
		if err != nil {
			return err
		}

		_, err = gorm.G[models.RefreshToken](tx).
			Where("id = ?", tokenModel.ID).
			Delete(ctx)
		if err != nil {
			return err
		}
		return nil
	})

	if err != nil {
		return RefreshTokenResult{}, err
	}
	return RefreshTokenResult{
		RefreshToken:          tokenResult.RefreshToken,
		RefreshTokenExpiresAt: tokenResult.RefreshTokenExpiresAt,
		AccessToken:           tokenResult.AccessToken,
		AccessTokenExpiresAt:  tokenResult.AccessTokenExpiresAt,
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

	var avatarName string
	if account.User != nil {
		avatarName = account.User.AvatarName
	}

	return UserStateReponse{
		ID:        account.ID,
		Email:     account.Email,
		Name:      account.Name,
		Role:      account.Role,
		AvatarURL: core.FormatUserAvatarUrl(s.s3, s.s3Bucket, id, avatarName),
	}, nil
}

type AvatarPresignResponse struct {
	Name    string              `json:"name"`
	URL     string              `json:"url"`
	Method  string              `json:"method"`
	Headers map[string][]string `json:"headers"`
}

func (s *Service) GetUserAvatarPresignedURL(ctx context.Context, userId uint, fileSize int64, contentType string) (AvatarPresignResponse, error) {
	name := uuid.NewString()
	key := core.FormatUserAvatarKey(userId, name, true)
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

	tempKey := core.FormatUserAvatarKey(userId, name, true)

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

	finalKey := core.FormatUserAvatarKey(userId, name, false)

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

	if err != nil {
		return err
	}

	if rows == 0 {
		return ErrUserNotFound
	}

	if model.AvatarName != "" {
		_, err = s.s3.DeleteObject(ctx, &s3.DeleteObjectInput{
			Bucket: aws.String(s.s3Bucket),
			Key:    aws.String(core.FormatUserAvatarKey(userId, model.AvatarName, false)),
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

	if err != nil {
		return err
	}

	if rows == 0 {
		return ErrFCMTokenNotFound
	}

	return nil
}

package auth

import (
	"context"
	"errors"
	"openrent-server/models"

	"github.com/alexedwards/argon2id"
	"gorm.io/gorm"
)

var ErrEmailDuplicated = errors.New("email already exists")
var ErrEmailNotFound = errors.New("email not found")
var ErrPasswordNotMatch = errors.New("password not match")

type Service struct {
	db *gorm.DB
}

func NewService(db *gorm.DB) *Service {
	return &Service{
		db: db,
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

type UserStateReponse struct {
	Email string `json:"email"`
	Name  string `json:"name"`
	Role  string `json:"role"`
}

func (s *Service) GetUserState(ctx context.Context, id uint) (UserStateReponse, error) {
	account, err := gorm.G[models.Account](s.db).Select(
		"Email", "Role", "Name").Where(&models.Account{ID: id}, "ID").First(ctx)
	if err != nil {
		return UserStateReponse{}, err
	}

	return UserStateReponse{
		Email: account.Email,
		Name:  account.Name,
		Role:  account.Role,
	}, nil
}

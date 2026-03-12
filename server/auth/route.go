package auth

import (
	"errors"
	"net/http"
	"openrent-server/core"
	"openrent-server/models"

	"github.com/labstack/echo/v5"
	"gorm.io/gorm"
)

type RegisterUserRequest struct {
	Email    string `json:"email" validate:"required,email"`
	Name     string `json:"name" validate:"required"`
	Password string `json:"password" validate:"required"`
}

func RegisterRoutes(e *echo.Echo) {
	g := e.Group("/auth")

	g.POST("/", func(c *echo.Context) error {
		payload := RegisterUserRequest{}

		if err := c.Bind(&payload); err != nil {
			return err
		}

		if err := c.Validate(payload); err != nil {
			return err
		}

		appCtx, err := core.GetAppContext(c)
		if err != nil {
			return err
		}

		err = gorm.G[models.Account](appCtx.DB).Create(c.Request().Context(), &models.Account{
			Email:        payload.Email,
			Name:         payload.Name,
			PasswordHash: payload.Password,
			User:         &models.UserAccount{},
		})

		if err != nil {
			if errors.Is(err, gorm.ErrDuplicatedKey) {
				return echo.NewHTTPError(http.StatusBadRequest, "email already exists")
			}
			return err
		}

		return c.JSON(200, core.CreateActionResponse(true))
	})
}

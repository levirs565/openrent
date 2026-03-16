package auth

import (
	"errors"
	"net/http"
	"openrent-server/core"

	"github.com/labstack/echo/v5"
)

type registerUserRequest struct {
	Email    string `json:"email" validate:"required,email"`
	Name     string `json:"name" validate:"required"`
	Password string `json:"password" validate:"required"`
}

type loginUserRequest struct {
	Email    string `json:"email" validate:"required,email"`
	Password string `json:"password" validate:"required"`
}

func RegisterRoutes(e *echo.Echo, s *Service) {
	g := e.Group("/auth")

	g.POST("/register", func(c *echo.Context) error {
		payload := registerUserRequest{}

		if err := c.Bind(&payload); err != nil {
			return err
		}

		if err := c.Validate(payload); err != nil {
			return err
		}

		err := s.CreateUserAccount(c.Request().Context(), CreateUserInput{
			Email:    payload.Email,
			Name:     payload.Name,
			Password: payload.Password,
		})

		if err != nil {
			if errors.Is(err, ErrEmailDuplicated) {
				return echo.NewHTTPError(http.StatusBadRequest, err.Error())
			}
			return err
		}

		return c.JSON(200, core.CreateActionResponse(true))
	})

	g.POST("/login", func(c *echo.Context) error {
		payload := loginUserRequest{}

		if err := c.Bind(&payload); err != nil {
			return err
		}

		if err := c.Validate(payload); err != nil {
			return err
		}

		session, err := core.GetSession(c)
		if err != nil {
			return err
		}

		if _, hasUserId := session.Values["user_id"]; hasUserId {
			return echo.NewHTTPError(http.StatusForbidden, "you are logged in")
		}

		result, err := s.Login(c.Request().Context(), payload.Email, payload.Password)

		if err != nil {
			if errors.Is(err, ErrEmailNotFound) || errors.Is(err, ErrPasswordNotMatch) {
				return echo.NewHTTPError(http.StatusBadRequest, err.Error())
			}
			return err
		}

		session.Values["user_id"] = result.ID
		session.Values["user_role"] = result.Role
		if err := session.Save(c.Request(), c.Response()); err != nil {
			return err
		}

		return c.JSON(200, core.CreateActionResponse(true))
	})

	g.GET("/state", func(c *echo.Context) error {
		session, err := core.GetSession(c)
		if err != nil {
			return err
		}

		userId, hasUserId := session.Values["user_id"].(uint)
		if !hasUserId {
			return c.JSON(200, nil)
		}

		response, err := s.GetUserState(c.Request().Context(), userId)

		return c.JSON(200, response)
	})

	g.POST("/logout", func(c *echo.Context) error {
		session, err := core.GetSession(c)
		if err != nil {
			return err
		}

		if _, hasUserId := session.Values["user_id"]; !hasUserId {
			return echo.NewHTTPError(http.StatusForbidden, "you are not logged in")
		}

		clear(session.Values)

		if err := session.Save(c.Request(), c.Response()); err != nil {
			return err
		}

		return c.JSON(200, core.CreateActionResponse(true))
	})
}

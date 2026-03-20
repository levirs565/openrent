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

type Controller struct {
	service *Service
}

func NewController(s *Service) *Controller {
	return &Controller{
		service: s,
	}
}

func (ct *Controller) register(c *echo.Context) error {
	payload := registerUserRequest{}

	if err := core.BindAndValidate(c, &payload); err != nil {
		return err
	}

	err := ct.service.CreateUserAccount(c.Request().Context(), CreateUserInput{
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
}

func (ct *Controller) login(c *echo.Context) error {
	payload := loginUserRequest{}

	if err := core.BindAndValidate(c, &payload); err != nil {
		return err
	}

	session := core.GetSession(c)
	result, err := ct.service.Login(c.Request().Context(), payload.Email, payload.Password)

	if err != nil {
		if errors.Is(err, ErrEmailNotFound) || errors.Is(err, ErrPasswordNotMatch) {
			return echo.NewHTTPError(http.StatusBadRequest, err.Error())
		}
		return err
	}

	core.SetUserSession(session, core.UserSession{
		ID:   result.ID,
		Role: result.Role,
	})

	if err := session.Save(c.Request(), c.Response()); err != nil {
		return err
	}

	return c.JSON(200, core.CreateActionResponse(true))
}

func (ct *Controller) getState(c *echo.Context) error {
	user := core.GetUserSession(c)
	if !user.IsLoggedIn {
		return c.JSON(200, nil)
	}

	response, err := ct.service.GetUserState(c.Request().Context(), user.ID)
	if err != nil {
		return err
	}

	return c.JSON(200, response)
}

func (ct *Controller) logout(c *echo.Context) error {
	session := core.GetSession(c)
	clear(session.Values)

	if err := session.Save(c.Request(), c.Response()); err != nil {
		return err
	}

	return c.JSON(200, core.CreateActionResponse(true))
}

func RegisterRoutes(e *echo.Echo, ct *Controller) {
	g := e.Group("/auth")

	g.POST("/register", ct.register, core.NewGuardRoleMiddleware(core.GuardRoleNotLoggedIn))
	g.POST("/login", ct.login, core.NewGuardRoleMiddleware(core.GuardRoleNotLoggedIn))
	g.GET("/state", ct.getState)
	g.POST("/logout", ct.logout, core.NewGuardRoleMiddleware(core.GuardRoleLoggedIn))
}

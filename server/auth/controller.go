package auth

import (
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

type avatarPresignedRequest struct {
	Size        int64  `json:"size" validate:"required,min=1"`
	ContentType string `json:"content_type" validate:"required"`
}

type avatarConfirmRequest struct {
	Name string `json:"name" validate:"required"`
}

type addFCMTokenRequest struct {
	Token string `json:"token" validate:"required"`
}

type removeFCMTokenRequest struct {
	ID uint `param:"id"`
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

	err := ct.service.CreateUserAccount(c.Request().Context(), CreateUserInput(payload))

	if err != nil {
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

func (ct *Controller) avatarPresignedURL(c *echo.Context) error {
	user := core.GetUserSession(c)
	payload := avatarPresignedRequest{}

	if err := core.BindAndValidate(c, &payload); err != nil {
		return err
	}

	response, err := ct.service.GetUserAvatarPresignedURL(
		c.Request().Context(), user.ID, payload.Size, payload.ContentType,
	)
	if err != nil {
		return err
	}

	return c.JSON(200, response)
}

func (ct *Controller) avatarConfirm(c *echo.Context) error {
	user := core.GetUserSession(c)
	payload := avatarConfirmRequest{}

	if err := core.BindAndValidate(c, &payload); err != nil {
		return err
	}
	err := ct.service.ConfirmUserAvatar(c.Request().Context(), user.ID, payload.Name)
	if err != nil {
		return err
	}

	return c.JSON(200, core.CreateActionResponse(true))
}

func (ct *Controller) addFCMToken(c *echo.Context) error {
	user := core.GetUserSession(c)
	payload := addFCMTokenRequest{}

	if err := core.BindAndValidate(c, &payload); err != nil {
		return err
	}

	response, err := ct.service.AddFCMToken(c.Request().Context(), user.ID, payload.Token)
	if err != nil {
		return err
	}

	return c.JSON(200, response)
}

func (ct *Controller) removeFCMToken(c *echo.Context) error {
	user := core.GetUserSession(c)
	payload := removeFCMTokenRequest{}

	if err := core.BindAndValidate(c, &payload); err != nil {
		return err
	}

	err := ct.service.RemoveFCMToken(c.Request().Context(), user.ID, payload.ID)
	if err != nil {
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
	g.POST("/avatar/presigned-url", ct.avatarPresignedURL, core.NewGuardRoleMiddleware(core.GuardRoleLoggedIn))
	g.POST("/avatar/confirm", ct.avatarConfirm, core.NewGuardRoleMiddleware(core.GuardRoleLoggedIn))
	g.POST("/me/fcm", ct.addFCMToken, core.NewGuardRoleMiddleware(core.GuardRoleLoggedIn))
	g.DELETE("/me/fcm/:id", ct.removeFCMToken, core.NewGuardRoleMiddleware(core.GuardRoleLoggedIn))
}

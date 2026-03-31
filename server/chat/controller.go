package chat

import (
	"openrent-server/core"

	"github.com/labstack/echo/v5"
)

type Controller struct {
	service *Service
}

func NewController(s *Service) *Controller {
	return &Controller{
		service: s,
	}
}

func (ct *Controller) send(c *echo.Context) error {
	payload := SendMessageRequest{}
	if err := core.BindAndValidate(c, &payload); err != nil {
		return err
	}

	userId := core.GetUserSession(c).ID
	err := ct.service.Send(c.Request().Context(), userId, payload)
	if err != nil {
		return err
	}
	return c.JSON(200, core.CreateActionResponse(true))
}

func (ct *Controller) listParticipants(c *echo.Context) error {
	userId := core.GetUserSession(c).ID
	result, err := ct.service.ListChats(c.Request().Context(), userId)
	if err != nil {
		return err
	}
	return c.JSON(200, result)
}

func (ct *Controller) list(c *echo.Context) error {
	payload := ListMessagesRequest{}
	if err := core.BindAndValidate(c, &payload); err != nil {
		return err
	}

	userId := core.GetUserSession(c).ID
	result, err := ct.service.ListMessages(c.Request().Context(), userId, payload.ID)
	if err != nil {
		return err
	}
	return c.JSON(200, result)
}

func (ct *Controller) RegisterRoutes(g *echo.Group) {
	g.Use(core.NewGuardRoleMiddleware(core.GuardRoleUser))

	g.GET("", ct.listParticipants)
	g.GET("/:id", ct.list)
	g.POST("/:id", ct.send)
}

package owner_rent

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

func (ct *Controller) list(c *echo.Context) error {
	userId := core.GetUserSession(c).ID
	result, err := ct.service.list(c.Request().Context(), userId)
	if err != nil {
		return err
	}
	return c.JSON(200, result)
}

func (ct *Controller) getById(c *echo.Context) error {
	payload := GetByIdRequest{}
	if err := core.BindAndValidate(c, &payload); err != nil {
		return err
	}

	userId := core.GetUserSession(c).ID
	result, err := ct.service.getById(c.Request().Context(), userId, payload.ID)
	if err != nil {
		return err
	}
	return c.JSON(200, result)
}

func (ct *Controller) approve(c *echo.Context) error {
	payload := ApproveRequest{}
	if err := core.BindAndValidate(c, &payload); err != nil {
		return err
	}

	userId := core.GetUserSession(c).ID
	err := ct.service.approve(c.Request().Context(), userId, payload.ID)
	if err != nil {
		return err
	}
	return c.JSON(200, core.CreateActionResponse(true))
}

func (ct *Controller) reject(c *echo.Context) error {
	payload := RejectRequest{}
	if err := core.BindAndValidate(c, &payload); err != nil {
		return err
	}

	userId := core.GetUserSession(c).ID
	err := ct.service.reject(c.Request().Context(), userId, payload)
	if err != nil {
		return err
	}
	return c.JSON(200, core.CreateActionResponse(true))
}

func (ct *Controller) cancel(c *echo.Context) error {
	payload := CancelRequest{}
	if err := core.BindAndValidate(c, &payload); err != nil {
		return err
	}

	userId := core.GetUserSession(c).ID
	err := ct.service.cancel(c.Request().Context(), userId, payload)
	if err != nil {
		return err
	}
	return c.JSON(200, core.CreateActionResponse(true))
}

func (ct *Controller) handover(c *echo.Context) error {
	payload := HandoverRequest{}
	if err := core.BindAndValidate(c, &payload); err != nil {
		return err
	}

	userId := core.GetUserSession(c).ID
	err := ct.service.handover(c.Request().Context(), userId, payload)
	if err != nil {
		return err
	}
	return c.JSON(200, core.CreateActionResponse(true))
}

func (ct *Controller) confirmReturn(c *echo.Context) error {
	payload := ConfirmReturnRequest{}
	if err := core.BindAndValidate(c, &payload); err != nil {
		return err
	}

	userId := core.GetUserSession(c).ID
	err := ct.service.confirmReturn(c.Request().Context(), userId, payload)
	if err != nil {
		return err
	}
	return c.JSON(200, core.CreateActionResponse(true))
}

func (ct *Controller) RegisterRoutes(g *echo.Group) {
	g.Use(core.NewGuardRoleMiddleware(core.GuardRoleUser))

	g.GET("", ct.list)
	g.GET("/:id", ct.getById)
	g.POST("/:id/approve", ct.approve)
	g.POST("/:id/reject", ct.reject)
	g.POST("/:id/cancel", ct.cancel)
	g.POST("/:id/handover", ct.handover)
	g.POST("/:id/confirm_return", ct.confirmReturn)
}

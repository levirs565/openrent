package my_product

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

func (ct *Controller) add(c *echo.Context) error {
	payload := AddRequest{}
	if err := core.BindAndValidate(c, &payload); err != nil {
		return err
	}

	user := core.GetUserSession(c)
	result, err := ct.service.Add(c.Request().Context(), user.ID, payload)
	if err != nil {
		return err
	}

	return c.JSON(200, result)
}

func (ct *Controller) update(c *echo.Context) error {
	payload := UpdateRequest{}
	if err := core.BindAndValidate(c, &payload); err != nil {
		return err
	}

	user := core.GetUserSession(c)
	result, err := ct.service.Update(c.Request().Context(), user.ID, payload)
	if err != nil {
		return err
	}

	return c.JSON(200, result)
}

func (ct *Controller) delete(c *echo.Context) error {
	payload := DeleteRequest{}
	if err := core.BindAndValidate(c, &payload); err != nil {
		return err
	}

	user := core.GetUserSession(c)
	err := ct.service.Delete(c.Request().Context(), user.ID, payload.ID)
	if err != nil {
		return err
	}

	return c.JSON(200, core.CreateActionResponse(true))
}

func (ct *Controller) RegisterRoutes(g *echo.Group) {
	g.Use(core.NewGuardRoleMiddleware(core.GuardRoleUser))

	g.POST("", ct.add)
	g.PUT("/:id", ct.update)
	g.DELETE("/:id", ct.delete)
}

package address

import (
	"context"
	"openrent-server/core"

	"github.com/labstack/echo/v5"
)

type Controller struct {
	service *Service
}

func NewController(service *Service) *Controller {
	return &Controller{
		service: service,
	}
}

func (ct *Controller) getAll(c *echo.Context) error {
	user := core.GetUserSession(c)

	result, err := ct.service.List(context.Background(), user.ID)
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

	user := core.GetUserSession(c)

	result, err := ct.service.Get(context.Background(), user.ID, payload.ID)
	if err != nil {
		return err
	}

	return c.JSON(200, result)
}

func (ct *Controller) add(c *echo.Context) error {
	payload := AddRequest{}

	if err := core.BindAndValidate(c, &payload); err != nil {
		return err
	}

	user := core.GetUserSession(c)

	result, err := ct.service.Add(context.Background(), user.ID, payload)
	if err != nil {
		return err
	}

	return c.JSON(201, result)
}

func (ct *Controller) update(c *echo.Context) error {
	payload := UpdateRequest{}

	if err := core.BindAndValidate(c, &payload); err != nil {
		return err
	}

	user := core.GetUserSession(c)

	result, err := ct.service.Update(context.Background(), user.ID, payload.ID, payload.AddRequest)
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

	err := ct.service.Delete(context.Background(), user.ID, payload.ID)
	if err != nil {
		return err
	}

	return c.JSON(200, core.CreateActionResponse(true))
}

func (ct *Controller) RegisterRoutes(g *echo.Group) {
	g.Use(core.NewGuardRoleMiddleware(core.GuardRoleUser))

	g.GET("", ct.getAll)
	g.GET("/:id", ct.getById)
	g.POST("", ct.add)
	g.PUT("/:id", ct.update)
	g.DELETE("/:id", ct.delete)
}

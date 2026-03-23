package product

import (
	"errors"
	"net/http"
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

func (ct *Controller) mapError(err error) error {
	if errors.Is(err, ErrNotFound) {
		return echo.NewHTTPError(http.StatusNotFound, err.Error())
	}
	return err
}

func (ct *Controller) list(c *echo.Context) error {
	user := core.GetUserSession(c)

	payload := ListRequest{}
	if err := core.BindAndValidate(c, &payload); err != nil {
		return err
	}

	result, err := ct.service.List(c.Request().Context(), user.ID, payload)
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

	result, err := ct.service.GetById(c.Request().Context(), payload.ID)
	if err != nil {
		return ct.mapError(err)
	}

	return c.JSON(200, result)
}

func (ct *Controller) add(c *echo.Context) error {
	payload := AddRequest{}
	if err := core.BindAndValidate(c, &payload); err != nil {
		return err
	}

	user := core.GetUserSession(c)
	result, err := ct.service.Add(c.Request().Context(), user.ID, payload)
	if err != nil {
		return ct.mapError(err)
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
		return ct.mapError(err)
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
		return ct.mapError(err)
	}

	return c.JSON(200, core.CreateActionResponse(true))
}

func RegisterRoutes(e *echo.Echo, ct *Controller) {
	g := e.Group("/products")

	g.Use(core.NewGuardRoleMiddleware(core.GuardRoleUser))

	g.GET("", ct.list)
	g.POST("", ct.add)
	g.GET("/:id", ct.getById)
	g.PUT("/:id", ct.update)
	g.DELETE("/:id", ct.delete)
}

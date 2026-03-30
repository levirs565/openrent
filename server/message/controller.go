package message

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

func (ct *Controller) update(c *echo.Context) error {
	payload := UpdateRequest{}
	if err := core.BindAndValidate(c, &payload); err != nil {
		return err
	}

	userId := core.GetUserSession(c).ID
	err := ct.service.Update(c.Request().Context(), userId, payload)
	if err != nil {
		return ct.mapError(err)
	}
	return c.JSON(200, core.CreateActionResponse(true))
}

func (ct *Controller) delete(c *echo.Context) error {
	payload := DeleteRequest{}
	if err := core.BindAndValidate(c, &payload); err != nil {
		return err
	}

	userId := core.GetUserSession(c).ID
	err := ct.service.Delete(c.Request().Context(), userId, payload.ID)
	if err != nil {
		return ct.mapError(err)
	}
	return c.JSON(200, core.CreateActionResponse(true))
}

func (ct *Controller) RegisterRoutes(g *echo.Group) {
	g.Use(core.NewGuardRoleMiddleware(core.GuardRoleUser))

	g.PUT("/:id", ct.update)
	g.DELETE("/:id", ct.delete)
}

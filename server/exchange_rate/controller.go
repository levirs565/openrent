package exchange_rate

import (
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

func (ct *Controller) get(c *echo.Context) error {
	user, err := ct.service.Get(c.Request().Context())
	if err != nil {
		return err
	}
	return c.JSON(200, user)
}

func (ct *Controller) RegisterRoutes(g *echo.Group) {
	g.Use(core.NewGuardRoleMiddleware(core.GuardRoleUser))

	g.GET("", ct.get)
}

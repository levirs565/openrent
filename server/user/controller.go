package user

import (
	"openrent-server/core"

	"github.com/labstack/echo/v5"
)

type Controller struct {
	service *Service
}

func NewController(service *Service) *Controller {
	return &Controller{service: service}
}

func (ct *Controller) getById(c *echo.Context) error {
	payload := GetByIDRequest{}
	if err := core.BindAndValidate(c, &payload); err != nil {
		return err
	}

	user, err := ct.service.GetUser(c.Request().Context(), payload.ID)
	if err != nil {
		return err
	}
	return c.JSON(200, user)
}

func (ct *Controller) RegisterRoutes(g *echo.Group) {
	g.Use(core.NewGuardRoleMiddleware(core.GuardRoleUser))

	g.GET("/:id", ct.getById)
}

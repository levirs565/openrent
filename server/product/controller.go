package product

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
		return err
	}

	return c.JSON(200, result)
}

func (ct *Controller) rent(c *echo.Context) error {
	payload := RentRequest{}
	if err := core.BindAndValidate(c, &payload); err != nil {
		return err
	}

	user := core.GetUserSession(c)
	err := ct.service.Rent(c.Request().Context(), user.ID, payload)
	if err != nil {
		return err
	}

	return c.JSON(200, core.CreateActionResponse(true))
}

func (ct *Controller) listReview(c *echo.Context) error {
	payload := ListReviewRequest{}
	if err := core.BindAndValidate(c, &payload); err != nil {
		return err
	}

	user := core.GetUserSession(c)
	result, err := ct.service.ListReview(c.Request().Context(), user.ID, payload)
	if err != nil {
		return err
	}

	return c.JSON(200, result)
}

func (ct *Controller) RegisterRoutes(g *echo.Group) {
	g.Use(core.NewGuardRoleMiddleware(core.GuardRoleUser))

	g.GET("", ct.list)
	g.GET("/:id", ct.getById)
	g.POST("/:id/rent", ct.rent)
	g.GET("/:id/reviews", ct.listReview)
}

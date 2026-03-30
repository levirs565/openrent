package rents

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
	if errors.Is(err, ErrNotReady) || errors.Is(err, ErrNotActive) ||
		errors.Is(err, ErrNotCompleted) || errors.Is(err, ErrReviewDuplicated) {
		return echo.NewHTTPError(http.StatusConflict, err.Error())
	}
	return err
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
		return ct.mapError(err)
	}
	return c.JSON(200, result)
}

func (ct *Controller) receive(c *echo.Context) error {
	payload := ReceiveRequest{}
	if err := core.BindAndValidate(c, &payload); err != nil {
		return err
	}

	userId := core.GetUserSession(c).ID
	err := ct.service.receive(c.Request().Context(), userId, payload.ID)
	if err != nil {
		return ct.mapError(err)
	}
	return c.JSON(200, core.CreateActionResponse(true))
}

func (ct *Controller) requestReturn(c *echo.Context) error {
	payload := RequestReturnRequest{}
	if err := core.BindAndValidate(c, &payload); err != nil {
		return err
	}

	userId := core.GetUserSession(c).ID
	err := ct.service.requestReturn(c.Request().Context(), userId, payload.ID)
	if err != nil {
		return ct.mapError(err)
	}
	return c.JSON(200, core.CreateActionResponse(true))
}

func (ct *Controller) addReview(c *echo.Context) error {
	payload := AddReviewRequest{}
	if err := core.BindAndValidate(c, &payload); err != nil {
		return err
	}

	userId := core.GetUserSession(c).ID
	err := ct.service.addReview(c.Request().Context(), userId, payload)
	if err != nil {
		return ct.mapError(err)
	}
	return c.JSON(200, core.CreateActionResponse(true))
}

func (ct *Controller) RegisterRoutes(g *echo.Group) {
	g.Use(core.NewGuardRoleMiddleware(core.GuardRoleUser))

	g.GET("", ct.list)
	g.GET("/:id", ct.getById)
	g.POST("/:id/receive", ct.receive)
	g.POST("/:id/return", ct.requestReturn)
	g.POST("/:id/review", ct.addReview)
}

package core

import (
	"net/http"

	"github.com/go-playground/validator/v10"
	"github.com/labstack/echo/v5"
)

type Validator struct {
	Validator *validator.Validate
}

func (v *Validator) Validate(i any) error {
	if err := v.Validator.Struct(i); err != nil {
		// TODO: Better message
		return echo.NewHTTPError(http.StatusBadRequest, err.Error())
	}
	return nil
}

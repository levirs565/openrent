package core

import "github.com/labstack/echo/v5"

func BindAndValidate(c *echo.Context, payload any) error {
	if err := c.Bind(payload); err != nil {
		return err
	}

	if err := c.Validate(payload); err != nil {
		return err
	}

	return nil
}

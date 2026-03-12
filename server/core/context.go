package core

import (
	"fmt"

	"github.com/labstack/echo/v5"
	"gorm.io/gorm"
)

type AppContext struct {
	DB *gorm.DB
}

const appContextKey = "appContext"

func GetAppContext(c *echo.Context) (*AppContext, error) {
	s := c.Get(appContextKey)
	if s == nil {
		return nil, fmt.Errorf("AppContext is not set")
	}

	appContext := s.(*AppContext)
	return appContext, nil
}

func RegisterAppContext(appContext *AppContext) echo.MiddlewareFunc {
	return func(next echo.HandlerFunc) echo.HandlerFunc {
		return func(c *echo.Context) error {
			c.Set(appContextKey, appContext)
			return next(c)
		}
	}
}

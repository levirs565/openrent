package main

import (
	"github.com/go-playground/validator/v10"
	"github.com/labstack/echo/v5"
	"github.com/labstack/echo/v5/middleware"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"

	"openrent-server/auth"
	"openrent-server/core"
	"openrent-server/models"
)

func main() {
	db, err := gorm.Open(postgres.Open("postgres://postgres:root@localhost:5432/openrent"), &gorm.Config{
		TranslateError: true,
	})

	if err != nil {
		panic("cannot connect to database")
	}

	db.AutoMigrate(&models.AdminAccount{}, &models.UserAccount{}, &models.Account{})

	e := echo.New()
	e.Use(middleware.RequestLogger())
	e.Use(core.RegisterAppContext(&core.AppContext{
		DB: db,
	}))
	e.Validator = &core.Validator{
		Validator: validator.New(),
	}

	auth.RegisterRoutes(e)

	if err := e.Start(":1323"); err != nil {
		e.Logger.Error("failed to start server", "error", err)
	}
}

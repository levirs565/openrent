package main

import (
	"time"

	"github.com/go-playground/validator/v10"
	"github.com/labstack/echo/v5"
	"github.com/labstack/echo/v5/middleware"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"

	"openrent-server/address"
	"openrent-server/auth"
	"openrent-server/core"
	"openrent-server/models"

	"github.com/wader/gormstore/v2"
)

func main() {
	db, err := gorm.Open(postgres.Open("postgres://postgres:root@localhost:5432/openrent"), &gorm.Config{
		TranslateError: true,
	})

	if err != nil {
		panic("cannot connect to database")
	}

	db.AutoMigrate(&models.AdminAccount{}, &models.UserAccount{}, &models.Account{}, &models.UserAddress{})

	store := gormstore.New(db, []byte("secret"))
	quit := make(chan struct{})
	go store.PeriodicCleanup(1*time.Hour, quit)

	e := echo.New()
	e.Pre(middleware.AddTrailingSlash())
	e.Use(middleware.RequestLogger())
	e.Use(core.NewSessionMiddleware(store))

	e.Validator = &core.Validator{
		Validator: validator.New(),
	}

	authService := auth.NewService(db)
	addressService := address.NewService(db)

	authController := auth.NewController(authService)
	auth.RegisterRoutes(e, authController)

	addressController := address.NewController(addressService)
	address.RegisterRoutes(e, addressController)

	if err := e.Start(":1323"); err != nil {
		e.Logger.Error("failed to start server", "error", err)
	}
}

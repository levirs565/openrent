package main

import (
	"log"
	"os"
	"time"

	"github.com/go-playground/validator/v10"
	"github.com/joho/godotenv"
	"github.com/labstack/echo/v5"
	"github.com/labstack/echo/v5/middleware"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"

	"openrent-server/address"
	"openrent-server/auth"
	"openrent-server/core"
	"openrent-server/embedding"
	"openrent-server/models"
	"openrent-server/owner_rents"
	"openrent-server/product"
	"openrent-server/rents"

	"github.com/wader/gormstore/v2"
)

func main() {
	err := godotenv.Load()
	if err != nil {
		log.Print("Cannot load dotenv", err)
	}

	db, err := gorm.Open(postgres.Open(os.Getenv("DB_URL")), &gorm.Config{
		TranslateError: true,
	})

	if err != nil {
		panic("cannot connect to database")
	}

	db.AutoMigrate(
		&models.AdminAccount{}, &models.UserAccount{}, &models.Account{},
		&models.UserAddress{},
		&models.Product{},
		&models.Rent{},
		&models.Review{},
	)

	store := gormstore.New(db, []byte("secret"))
	quit := make(chan struct{})
	go store.PeriodicCleanup(1*time.Hour, quit)

	embedder, err := embedding.NewGeminiEmbedder("gemini-embedding-001")
	if err != nil {
		log.Panic("Cannot create embedder", err)
	}

	e := echo.New()
	e.Pre(middleware.RemoveTrailingSlash())
	e.Use(middleware.RequestLogger())
	e.Use(core.NewSessionMiddleware(store))

	e.Validator = &core.Validator{
		Validator: validator.New(),
	}

	authService := auth.NewService(db)
	addressService := address.NewService(db)
	productService := product.NewService(db, embedder)
	ownerRentsService := owner_rents.NewService(db)
	rentsService := rents.NewService(db)

	authController := auth.NewController(authService)
	auth.RegisterRoutes(e, authController)

	addressController := address.NewController(addressService)
	address.RegisterRoutes(e, addressController)

	productController := product.NewController(productService)
	product.RegisterRoutes(e, productController)

	ownerRentsController := owner_rents.NewController(ownerRentsService)
	owner_rents.RegisterRoutes(e, ownerRentsController)

	rentsController := rents.NewController(rentsService)
	rents.RegisterRoutes(e, rentsController)

	if err := e.Start(":1323"); err != nil {
		e.Logger.Error("failed to start server", "error", err)
	}
}

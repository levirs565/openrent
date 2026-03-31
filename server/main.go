package main

import (
	"log"
	"os"
	"time"

	"github.com/joho/godotenv"
	"github.com/labstack/echo/v5"
	"github.com/labstack/echo/v5/middleware"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"

	"openrent-server/address"
	"openrent-server/auth"
	"openrent-server/chat"
	"openrent-server/core"
	"openrent-server/embedding"
	"openrent-server/message"
	"openrent-server/models"
	"openrent-server/owner_rent"
	"openrent-server/product"
	"openrent-server/rent"
	"openrent-server/review"

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

	err = db.AutoMigrate(
		&models.AdminAccount{}, &models.UserAccount{}, &models.Account{},
		&models.UserAddress{},
		&models.Product{},
		&models.Rent{},
		&models.Review{},
		&models.Message{},
	)
	if err != nil {
		log.Panic("Cannot auto migrate", err)
	}

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

	e.Validator = core.NewValidator()

	authService := auth.NewService(db)
	addressService := address.NewService(db)
	productService := product.NewService(db, embedder)
	ownerRentsService := owner_rent.NewService(db)
	rentsService := rent.NewService(db)
	reviwsService := review.NewService(db)
	chatService := chat.NewService(db)
	messageService := message.NewService(db)

	authController := auth.NewController(authService)
	auth.RegisterRoutes(e, authController)

	addressController := address.NewController(addressService)
	addressController.RegisterRoutes(e.Group("/addresses"))

	productController := product.NewController(productService)
	productController.RegisterRoutes(e.Group("/products"))

	ownerRentController := owner_rent.NewController(ownerRentsService)
	ownerRentController.RegisterRoutes(e.Group("/owner/rents"))

	rentController := rent.NewController(rentsService)
	rentController.RegisterRoutes(e.Group("/rents"))

	reviewController := review.NewController(reviwsService)
	reviewController.RegisterRoutes(e.Group("/reviews"))

	chatController := chat.NewController(chatService)
	chatController.RegisterRoutes(e.Group("/chats"))

	messageController := message.NewController(messageService)
	messageController.RegisterRoutes(e.Group("/messages"))

	if err := e.Start(":1323"); err != nil {
		e.Logger.Error("failed to start server", "error", err)
	}
}

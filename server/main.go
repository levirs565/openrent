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
	"openrent-server/chat"
	"openrent-server/core"
	"openrent-server/embedding"
	"openrent-server/message"
	"openrent-server/models"
	"openrent-server/owner_rents"
	"openrent-server/product"
	"openrent-server/rents"
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

	e.Validator = &core.Validator{
		Validator: validator.New(),
	}

	authService := auth.NewService(db)
	addressService := address.NewService(db)
	productService := product.NewService(db, embedder)
	ownerRentsService := owner_rents.NewService(db)
	rentsService := rents.NewService(db)
	reviwsService := review.NewService(db)
	chatService := chat.NewService(db)
	messageService := message.NewService(db)

	authController := auth.NewController(authService)
	auth.RegisterRoutes(e, authController)

	addressController := address.NewController(addressService)
	addressController.RegisterRoutes(e.Group("/addresses"))

	productController := product.NewController(productService)
	product.RegisterRoutes(e, productController)

	ownerRentsController := owner_rents.NewController(ownerRentsService)
	owner_rents.RegisterRoutes(e, ownerRentsController)

	rentsController := rents.NewController(rentsService)
	rents.RegisterRoutes(e, rentsController)

	reivewController := review.NewController(reviwsService)
	review.RegisterRoutes(e, reivewController)

	chatController := chat.NewController(chatService)
	chat.RegisterRoutes(e.Group("/chats"), chatController)

	messageController := message.NewController(messageService)
	message.RegisterRoutes(e.Group("/messages"), messageController)

	if err := e.Start(":1323"); err != nil {
		e.Logger.Error("failed to start server", "error", err)
	}
}

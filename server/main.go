package main

import (
	"context"
	"encoding/json"
	"fmt"
	"log"
	"os"
	"time"

	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/aws/aws-sdk-go-v2/credentials"
	"github.com/aws/aws-sdk-go-v2/service/s3"
	"github.com/aws/aws-sdk-go-v2/service/s3/types"
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

	s3Region := os.Getenv("S3_REGION")
	s3AccessKeyId := os.Getenv("S3_ACCESS_KEY_ID")
	s3SecretAccessKey := os.Getenv("S3_SECRET_ACCESS_KEY")
	s3Endpoint := os.Getenv("S3_ENDPOINT_URL")
	s3Bucket := os.Getenv("S3_BUCKET")

	if s3AccessKeyId == "" || s3SecretAccessKey == "" || s3Region == "" || s3Endpoint == "" || s3Bucket == "" {
		log.Fatal("missing the env: S3_REGION / S3_ACCESS_KEY_ID / S3_SECRET_ACCESS_KEY / S3_ENDPOINT_URL / S3_BUCKET")
	}

	s3AwsConfig := aws.Config{
		Region:      s3Region,
		Credentials: aws.NewCredentialsCache(credentials.NewStaticCredentialsProvider(s3AccessKeyId, s3SecretAccessKey, "")),
	}

	s3Client := s3.NewFromConfig(s3AwsConfig, func(o *s3.Options) {
		o.BaseEndpoint = &s3Endpoint
		o.UsePathStyle = true
	})

	_, err = s3Client.PutBucketLifecycleConfiguration(context.Background(), &s3.PutBucketLifecycleConfigurationInput{
		Bucket: &s3Bucket,
		LifecycleConfiguration: &types.BucketLifecycleConfiguration{
			Rules: []types.LifecycleRule{
				{
					ID:     aws.String("cleanup-temp"),
					Status: types.ExpirationStatusEnabled,
					Filter: &types.LifecycleRuleFilter{
						Prefix: aws.String("temp/"),
					},
					Expiration: &types.LifecycleExpiration{
						Days: aws.Int32(1),
					},
				},
			},
		},
	})

	if err != nil {
		log.Panic("Cannot put bucket lifecycle configuration", err)
	}

	policy := map[string]any{
		"Version": "2012-10-17",
		"Statement": []map[string]any{
			{
				"Sid":    "PublicReadPrefix",
				"Effect": "Allow",
				"Principal": map[string]any{
					"AWS": []string{"*"},
				},
				"Action":   []string{"s3:GetObject"},
				"Resource": []string{fmt.Sprintf("arn:aws:s3:::%s/public/*", s3Bucket)},
			},
		},
	}

	policyJSON, err := json.Marshal(policy)
	if err != nil {
		log.Panic("Cannot marshal bucket policy", err)
	}

	_, err = s3Client.PutBucketPolicy(context.Background(), &s3.PutBucketPolicyInput{
		Bucket: aws.String(s3Bucket),
		Policy: aws.String(string(policyJSON)),
	})

	if err != nil {
		log.Panic("Cannot put bucket policy", err)
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
	e.Use(middleware.CORSWithConfig(middleware.CORSConfig{
		AllowOrigins:     []string{"http://localhost:8080"},
		AllowCredentials: true,
	}))
	e.Use(middleware.RequestLogger())
	e.Use(core.NewSessionMiddleware(store))

	e.HTTPErrorHandler = NewErrorHandler()
	e.Validator = core.NewValidator()

	authService := auth.NewService(db, s3Client, s3Bucket)
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

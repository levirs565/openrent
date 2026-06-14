package testutils

import (
	"context"
	"fmt"
	"log"
	"math/rand"
	"openrent-server/models"
	"os"
	"testing"
	"time"

	"github.com/pgvector/pgvector-go"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
	"gorm.io/gorm/logger"
)

type TestDb struct {
	RootDb *gorm.DB
	DbName string
	Db     *gorm.DB
}

func InitTestDb(t *testing.T, dest *TestDb) bool {
	dbUrl := os.Getenv("TEST_PG_CONN")

	newLogger := logger.New(
		log.New(os.Stdout, "\r\n", log.LstdFlags),
		logger.Config{
			SlowThreshold:             999 * time.Hour,
			LogLevel:                  logger.Error,
			IgnoreRecordNotFoundError: true,
			Colorful:                  true,
		},
	)

	rootDb, err := gorm.Open(postgres.Open(dbUrl), &gorm.Config{
		Logger: newLogger,
	})
	if err != nil {
		t.Error("Cannot open root connection", err)
		return false
	}
	dest.RootDb = rootDb

	// TODO check if exists
	dbName := fmt.Sprintf("openrent_test_%d", rand.Intn(1000000))
	result := rootDb.Exec(fmt.Sprintf("CREATE DATABASE %s;", dbName))
	if result.Error != nil {
		t.Error("Cannot create database", result.Error)
		return false
	}
	dest.DbName = dbName

	db, err := gorm.Open(postgres.Open(fmt.Sprintf("%s/%s", dbUrl, dbName)), &gorm.Config{
		TranslateError: true,
		Logger:         newLogger,
	})
	dest.Db = db

	if err != nil {
		t.Error("Cannot open database", err)
		return false
	}

	result = db.Exec("CREATE EXTENSION IF NOT EXISTS postgis;")
	if result.Error != nil {
		t.Error("Cannot create extension postgis", result.Error)
		return false
	}

	result = db.Exec("CREATE EXTENSION IF NOT EXISTS vector;")
	if result.Error != nil {
		t.Error("Cannot create extension vector", result.Error)
		return false
	}

	err = db.AutoMigrate(
		&models.AdminAccount{}, &models.UserAccount{}, &models.Account{},
		&models.UserAddress{},
		&models.Product{},
		&models.Rent{},
		&models.Review{},
		&models.RefreshToken{},
		&models.FCMToken{},
		&models.Message{},
	)
	if err != nil {
		t.Error("Cannot AutoMigrate models", err)
		return false
	}

	return true
}

func CleanupTestDb(t *testing.T, src *TestDb) {
	closeDb := func(db *gorm.DB) {
		if db == nil {
			return
		}
		sqlDB, err := db.DB()
		if err != nil {
			t.Error("Cannot close DB", err)
			return
		}
		err = sqlDB.Close()
		if err != nil {
			t.Log("Cannot close DB", err)
		}
	}

	defer closeDb(src.RootDb)

	defer func() {
		if len(src.DbName) == 0 {
			return
		}

		dropResult := src.RootDb.Exec(fmt.Sprintf("DROP DATABASE %s", src.DbName))
		if dropResult.Error != nil {
			t.Error("Cannot drop database", dropResult.Error)
		}
	}()

	defer closeDb(src.Db)
}

func CreateAccount(db *gorm.DB, id uint, name string) error {
	return gorm.G[models.Account](db).Create(context.Background(), &models.Account{
		ID:           id,
		Email:        fmt.Sprintf("user%d@test.com", id),
		Name:         name,
		PasswordHash: "noop",
		Role:         string(models.AccountRoleUser),
		User: &models.UserAccount{
			AccountID: id,
		},
	})
}

func CreateAddress(db *gorm.DB, id uint, ownerID uint, name string) error {
	return gorm.G[models.UserAddress](db).Create(context.Background(), &models.UserAddress{
		ID:            id,
		UserAccountID: ownerID,
		Name:          name,
		Province:      "Province",
		Regency:       "Regency",
		District:      "District",
		AddressDetail: "Detail",
	})
}

func CreateProduct(db *gorm.DB, id uint, ownerID uint, addressID uint, name string, stock int) error {
	var embeddings [768]float32
	return gorm.G[models.Product](db).Create(context.Background(), &models.Product{
		Model:               gorm.Model{ID: id},
		UserAccountID:       ownerID,
		UserAddressID:       addressID,
		Name:                name,
		Stock:               stock,
		PricePerDay:         10000,
		LateFeePerDay:       1000,
		Embedding:           pgvector.NewVector(embeddings[:]),
		EmbeddingSimilarity: pgvector.NewVector(embeddings[:]),
	})
}

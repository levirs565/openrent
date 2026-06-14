package testutils

import (
	"fmt"
	"log"
	"math/rand"
	"openrent-server/models"
	"os"
	"testing"
	"time"

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

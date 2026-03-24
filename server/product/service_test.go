package product

import (
	"context"
	"fmt"
	"math/rand"
	"openrent-server/embedding"
	"openrent-server/models"
	"os"
	"sync"
	"sync/atomic"
	"testing"
	"time"

	"github.com/pgvector/pgvector-go"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
)

type testDb struct {
	rootDb *gorm.DB
	dbName string
	db     *gorm.DB
}

func initTestDb(t *testing.T, dest *testDb) bool {
	dbUrl := os.Getenv("TEST_PG_CONN")

	rootDb, err := gorm.Open(postgres.Open(dbUrl))
	if err != nil {
		t.Error("Cannot open root connection", err)
		return false
	}
	dest.rootDb = rootDb

	// TODO check if exists
	dbName := fmt.Sprintf("openrent_test_%d", rand.Intn(1000000))
	result := rootDb.Exec(fmt.Sprintf("CREATE DATABASE %s;", dbName))
	if result.Error != nil {
		t.Error("Cannot create database", result.Error)
		return false
	}
	dest.dbName = dbName

	db, err := gorm.Open(postgres.Open(fmt.Sprintf("%s/%s", dbUrl, dbName)), &gorm.Config{
		TranslateError: true,
	})
	dest.db = db

	if err != nil {
		t.Error("Cannot open database", err)
		return false
	}

	result = db.Exec("CREATE EXTENSION postgis;")
	if result.Error != nil {
		t.Error("Cannot create extension postgis", result.Error)
		return false
	}

	result = db.Exec("CREATE EXTENSION vector;")
	if result.Error != nil {
		t.Error("Cannot create extension vector", result.Error)
		return false
	}

	err = db.AutoMigrate(
		&models.AdminAccount{}, &models.UserAccount{}, &models.Account{},
		&models.UserAddress{},
		&models.Product{},
		&models.Rent{},
	)
	if err != nil {
		t.Error("Cannot AutoMigrate models", err)
		return false
	}

	return true
}

func cleanupTestDb(t *testing.T, src *testDb) {
	closeDb := func(db *gorm.DB) {
		if db == nil {
			return
		}
		sqlDB, err := db.DB()
		if err != nil {
			t.Error("Cannot close DB", err)
		} else {
			sqlDB.Close()
		}
	}

	defer closeDb(src.rootDb)

	defer func() {
		if len(src.dbName) == 0 {
			return
		}

		dropResult := src.rootDb.Exec(fmt.Sprintf("DROP DATABASE %s", src.dbName))
		if dropResult.Error != nil {
			t.Error("Cannot drop database", dropResult.Error)
		}
	}()

	defer closeDb(src.db)
}

func TestRentRace(t *testing.T) {
	db := testDb{}
	defer cleanupTestDb(t, &db)
	if !initTestDb(t, &db) {
		return
	}

	sqlDB, _ := db.db.DB()
	sqlDB.SetMaxOpenConns(1)

	err := gorm.G[models.Account](db.db).Create(context.Background(), &models.Account{
		ID:           1,
		Email:        "user@rent.com",
		Name:         "User",
		PasswordHash: "has-no-password",
		Role:         string(models.AccountRoleUser),
		User: &models.UserAccount{
			UserAddresses: []models.UserAddress{
				models.UserAddress{
					ID: 1,
				},
			},
		},
	})
	if err != nil {
		t.Error("Cannot create User", err)
		return
	}
	var embeddings [768]float32
	var stock int32 = 5
	err = gorm.G[models.Product](db.db).Create(context.Background(), &models.Product{
		Model: gorm.Model{
			ID: 1,
		},
		UserAccountID: 1,
		UserAddressID: 1,
		Stock:         int(stock),
		Embedding:     pgvector.NewVector(embeddings[:]),
	})
	if err != nil {
		t.Error("Cannot create Product", err)
		return
	}

	service := NewService(db.db, embedding.NewNoopEmbedder())

	var wg sync.WaitGroup
	start := make(chan struct{})
	requestCount := 100
	var usedStock int32 = 0

	endDate := time.Now()
	startDate := endDate.AddDate(0, 0, -6)

	for i := 1; i <= requestCount; i++ {
		wg.Go(func() {
			<-start
			err := service.Rent(context.Background(), 1, RentRequest{
				StartDate: startDate,
				EndDate:   endDate,
				ID:        1,
				Quantity:  1,
			})
			if err == nil {
				atomic.AddInt32(&usedStock, 1)
			}
		})
	}

	close(start)
	wg.Wait()

	if usedStock > stock {
		t.Errorf("Error used stock, Expected: less than or equal %d, Actual: %d", stock, usedStock)
		return
	}
}

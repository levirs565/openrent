package models

import (
	"time"

	"gorm.io/gorm"
)

type RefreshToken struct {
	gorm.Model
	AccountID    uint `gorm:"not null;index"`
	Account      Account
	TokenHash    string `gorm:"not null;index"`
	ReplacedByID *uint
	ReplacedBy   *RefreshToken `gorm:"foreignKey:ReplacedByID"`
	ExpiresAt    time.Time     `gorm:"not null"`
}

package models

import "time"

type FCMToken struct {
	ID            uint `gorm:"primarykey"`
	CreatedAt     time.Time
	UpdatedAt     time.Time
	UserAccountID uint `gorm:"not null"`
	UserAccount   UserAccount
	Token         string `gorm:"not null;uniqueIndex"`
}

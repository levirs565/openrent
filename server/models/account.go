package models

import "gorm.io/datatypes"

type Account struct {
	ID           uint   `gorm:"primaryKey"`
	Email        string `gorm:"uniqueIndex"`
	Name         string
	PasswordHash string

	User  *UserAccount
	Admin *AdminAccount
}

type UserAccount struct {
	AccountID uint `gorm:"primaryKey"`
	Account   Account

	BirthDate  datatypes.Date `gorm:"not null"`
	BirthPlace string         `gorm:"not null"`
	NIK        string         `gorm:"not null"`
}

type AdminAccount struct {
	AccountID uint `gorm:"primaryKey"`
	Account   Account
}

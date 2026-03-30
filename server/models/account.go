package models

import "gorm.io/datatypes"

type AccountRole string

const (
	AccountRoleUser  AccountRole = "user"
	AccountRoleAdmin AccountRole = "admin"
)

type Account struct {
	ID           uint   `gorm:"primaryKey"`
	Email        string `gorm:"uniqueIndex"`
	Name         string
	PasswordHash string
	Role         string `gorm:"not null"`

	User  *UserAccount
	Admin *AdminAccount
}

// TODO: Image, Rating, JoinAt, Verification, Name != LegalName
type UserAccount struct {
	AccountID uint `gorm:"primaryKey"`
	Account   *Account

	BirthDate  datatypes.Date `gorm:"not null"`
	BirthPlace string         `gorm:"not null"`
	NIK        string         `gorm:"not null"`

	UserAddresses []UserAddress
	Product       []Product
	Rent          []Rent
	ChatSent      []Chat `gorm:"foreignKey:SenderID"`
	ChatReceived  []Chat `gorm:"foreignKey:ReceiverID"`
}

type AdminAccount struct {
	AccountID uint `gorm:"primaryKey"`
	Account   *Account
}

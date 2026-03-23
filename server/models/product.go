package models

import (
	"github.com/pgvector/pgvector-go"
	"gorm.io/gorm"
)

// TODO: Support more currency
type Product struct {
	gorm.Model
	UserAccountID uint
	UserAccount   UserAccount
	UserAddressID uint
	UserAddress   UserAddress `gorm:"foreignKey:UserAddressID,UserAccountID;references:ID,UserAccountID"`
	Name          string
	PricePerDay   int
	LateFeePerDay int
	Stock         int
	Description   string
	Embedding     pgvector.Vector `gorm:"type:vector(768)"`
}

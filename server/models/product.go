package models

import "gorm.io/gorm"

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
}

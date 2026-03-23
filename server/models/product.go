package models

import "gorm.io/gorm"

// TODO: Support more currency
type Product struct {
	gorm.Model
	UserAccountID uint
	UserAccount   UserAccount
	Name          string
	PricePerDay   int
	LateFeePerDay int
	Stock         int
	Description   string
}

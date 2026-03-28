package models

import "gorm.io/gorm"

type Review struct {
	gorm.Model
	RentID  uint `gorm:"uniqueIndex"`
	Rent    Rent
	Rating  uint
	Content string
}

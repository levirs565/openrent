package models

import (
	"github.com/restayway/gogis"
	"gorm.io/gorm"
)

type UserAddress struct {
	gorm.Model
	UserAccountID uint
	Name          string
	Province      string
	Regency       string
	District      string
	AddressDetail string
	Location      gogis.Point `gorm:"type:geometry(Point,4326)"`
}

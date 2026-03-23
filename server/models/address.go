package models

import (
	"time"

	"github.com/restayway/gogis"
	"gorm.io/gorm"
)

// TODO: Primary address
type UserAddress struct {
	ID            uint `gorm:"primarykey;index:idx_address,unique"`
	UserAccountID uint `gorm:"index:idx_address,unique"`
	CreatedAt     time.Time
	UpdatedAt     time.Time
	DeletedAt     gorm.DeletedAt `gorm:"index"`
	Name          string
	Province      string
	Regency       string
	District      string
	AddressDetail string
	Location      gogis.Point `gorm:"type:geometry(Point,4326)"`
}

package core

import (
	"time"

	"gorm.io/datatypes"
)

// WARNING: Assume db timezone == app timezone
func ConvertDateToTime(date datatypes.Date) time.Time {
	y, m, d := time.Time(date).Date()
	return time.Date(y, m, d, 0, 0, 0, 0, time.Local)
}

func ConvertDateToTimeForEnd(date datatypes.Date) time.Time {
	return ConvertDateToTime(date).Add(24 * time.Hour).Add(-1 * time.Nanosecond)
}

func ConvertTimeToDate(t time.Time) datatypes.Date {
	return datatypes.Date(t.In(time.Local))
}

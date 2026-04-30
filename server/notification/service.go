package notification

import (
	"context"

	"firebase.google.com/go/v4/messaging"
)

type Notification struct {
	Data         map[string]string
	Notification *messaging.Notification
	Android      *messaging.AndroidConfig
	Webpush      *messaging.WebpushConfig
	APNS         *messaging.APNSConfig
	FCMOptions   *messaging.FCMOptions
}

type Service interface {
	SendNotification(ctx context.Context, userId uint, notification Notification) error
}

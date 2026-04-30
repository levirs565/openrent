package notification

import "context"

type noopService struct{}

func NewNoopService() Service {
	return &noopService{}
}

var _ Service = (*fcmService)(nil)

func (s *noopService) SendNotification(ctx context.Context, userId uint, notification Notification) error {
	return nil
}

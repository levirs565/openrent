package core

import (
	"fmt"

	"github.com/aws/aws-sdk-go-v2/service/s3"
)

func FormatProductImageKey(productId uint, name string, temp bool) string {
	if temp {
		return fmt.Sprintf("temp/product/%d/image/%s", productId, name)
	}
	return fmt.Sprintf("public/product/%d/image/%s", productId, name)
}

func FormatProductImageUrl(client *s3.Client, bucketName string, productId uint, name string) *string {
	if name == "" {
		return nil
	}
	result := FormatS3PublicUrl(client, bucketName, FormatProductImageKey(productId, name, false))
	return &result
}

func FormatS3PublicUrl(client *s3.Client, bucketName string, key string) string {
	return fmt.Sprintf(
		"%s/%s/%s",
		*client.Options().BaseEndpoint,
		bucketName,
		key,
	)
}

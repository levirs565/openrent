package ai

import (
	"context"
	"errors"
)

const ExpectedSize = 768

var ErrSizeNotMatch = errors.New("embedding size not match")

type AIEmbedder interface {
	EmbedSearchDocument(ctx context.Context, title, content string) ([]float32, error)
	EmbedSearchQuery(ctx context.Context, text string) ([]float32, error)
	EmbedSimmiliarity(ctx context.Context, text string) ([]float32, error)
}

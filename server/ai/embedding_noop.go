package ai

import (
	"context"
)

type noopEmbedder struct{}

func NewNoopEmbedder() AIEmbedder {
	return &noopEmbedder{}
}

var _ AIEmbedder = (*noopEmbedder)(nil)

// EmbedSearchDocument implements [AIEmbedder].
func (n *noopEmbedder) EmbedSearchDocument(ctx context.Context, title string, content string) ([]float32, error) {
	return make([]float32, ExpectedSize), nil
}

// EmbedSearchQuery implements [AIEmbedder].
func (n *noopEmbedder) EmbedSearchQuery(ctx context.Context, text string) ([]float32, error) {
	return make([]float32, ExpectedSize), nil
}

// EmbedSimmiliarity implements [AIEmbedder].
func (n *noopEmbedder) EmbedSimmiliarity(ctx context.Context, text string) ([]float32, error) {
	return make([]float32, ExpectedSize), nil
}

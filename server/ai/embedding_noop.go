package ai

import (
	"context"
	"errors"
)

type noopEmbedder struct{}

func NewNoopEmbedder() AIEmbedder {
	return &noopEmbedder{}
}

var _ AIEmbedder = (*noopEmbedder)(nil)

// Embed implements [AIEmbedder].
func (n *noopEmbedder) Embed(ctx context.Context, text string) ([]float32, error) {
	return []float32{}, errors.New("unimplemented")
}

package embedding

import (
	"context"
	"errors"
)

const ExpectedSize = 768

var ErrSizeNotMatch = errors.New("embedding size not match")

type AIEmbedder interface {
	Embed(ctx context.Context, text string) ([]float32, error)
}

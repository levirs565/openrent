package ai

import (
	"context"

	"google.golang.org/genai"
)

type geminiEmbedder struct {
	client      *genai.Client
	model       string
	outputSize  int32
	embedConfig *genai.EmbedContentConfig
}

var _ AIEmbedder = (*geminiEmbedder)(nil)

func NewGeminiEmbedder(client *genai.Client, model string) AIEmbedder {
	result := &geminiEmbedder{
		client:     client,
		model:      model,
		outputSize: ExpectedSize,
	}
	result.embedConfig = &genai.EmbedContentConfig{
		OutputDimensionality: &result.outputSize,
	}
	return result
}

// Embed implements [AIEmbedder].
func (g *geminiEmbedder) Embed(ctx context.Context, text string) ([]float32, error) {
	contents := []*genai.Content{
		genai.NewContentFromText(text, genai.RoleUser),
	}

	result, err := g.client.Models.EmbedContent(ctx, g.model, contents, g.embedConfig)
	if err != nil {
		return []float32{}, err
	}

	if len(result.Embeddings) == 0 {
		return []float32{}, ErrSizeNotMatch
	}

	vector := result.Embeddings[0].Values
	if len(vector) != ExpectedSize {
		return []float32{}, ErrSizeNotMatch
	}

	return vector, nil
}

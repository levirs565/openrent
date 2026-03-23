package embedding

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

func NewGeminiEmbedder(model string) (AIEmbedder, error) {
	client, err := genai.NewClient(context.Background(), nil)
	if err != nil {
		return nil, err
	}

	result := &geminiEmbedder{
		client:     client,
		model:      model,
		outputSize: ExpectedSize,
	}
	result.embedConfig = &genai.EmbedContentConfig{
		OutputDimensionality: &result.outputSize,
	}
	return result, nil
}

// Embed implements [AIEmbedder].
func (g *geminiEmbedder) Embed(ctx context.Context, text string) ([]float32, error) {
	contents := []*genai.Content{
		genai.NewContentFromText(text, genai.RoleUser),
	}

	result, err := g.client.Models.EmbedContent(ctx, g.model, contents, g.embedConfig)
	if err != nil {
		return []float32{}, nil
	}

	vector := result.Embeddings[0].Values
	if len(vector) != ExpectedSize {
		return []float32{}, ErrSizeNotMatch
	}

	return vector, nil
}

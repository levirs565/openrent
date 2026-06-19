package ai

import (
	"context"
	"fmt"

	"google.golang.org/genai"
)

type geminiEmbedder struct {
	client     *genai.Client
	model      string
	outputSize int32
}

var _ AIEmbedder = (*geminiEmbedder)(nil)

func NewGeminiEmbedder(client *genai.Client, model string) AIEmbedder {
	result := &geminiEmbedder{
		client:     client,
		model:      model,
		outputSize: ExpectedSize,
	}
	return result
}

func (g *geminiEmbedder) Embed(ctx context.Context, taskType, title, content string) ([]float32, error) {
	contents := []*genai.Content{
		genai.NewContentFromText(content, genai.RoleUser),
	}

	fmt.Printf(`Task %s, title: "%s", content: "%s"\n`, taskType, title, content)

	result, err := g.client.Models.EmbedContent(ctx, g.model, contents, &genai.EmbedContentConfig{
		OutputDimensionality: &g.outputSize,
		Title:                title,
		TaskType:             taskType,
	})
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

// EmbedSearchDocument implements [AIEmbedder].
func (g *geminiEmbedder) EmbedSearchDocument(ctx context.Context, title string, content string) ([]float32, error) {
	return g.Embed(ctx, "RETRIEVAL_DOCUMENT", title, content)
}

// EmbedSearchQuery implements [AIEmbedder].
func (g *geminiEmbedder) EmbedSearchQuery(ctx context.Context, text string) ([]float32, error) {
	return g.Embed(ctx, "RETRIEVAL_QUERY", "", text)
}

// EmbedSimmiliarity implements [AIEmbedder].
func (g *geminiEmbedder) EmbedSimmiliarity(ctx context.Context, text string) ([]float32, error) {
	return g.Embed(ctx, "SEMANTIC_SIMILARITY", "", text)
}

package ai

import (
	"context"

	"google.golang.org/genai"
)

type geminiGenerative struct {
	client *genai.Client
	model  string
}

var _ AIGenerative = (*geminiGenerative)(nil)

func NewGeminiGenerative(client *genai.Client, model string) AIGenerative {
	return &geminiGenerative{
		client: client,
		model:  model,
	}
}

// Generate implements [AIGenerative].
func (g *geminiGenerative) Generate(ctx context.Context, systemInstruction, content, resposneMimeType string) (string, error) {
	contents := []*genai.Content{
		genai.NewContentFromText(content, genai.RoleUser),
	}
	systemInstructions := genai.NewContentFromText(systemInstruction, genai.RoleModel)

	result, err := g.client.Models.GenerateContent(
		ctx,
		g.model,
		contents,
		&genai.GenerateContentConfig{
			SystemInstruction: systemInstructions,
			ResponseMIMEType:  resposneMimeType,
		},
	)

	if err != nil {
		return "", err
	}

	return result.Candidates[0].Content.Parts[0].Text, nil
}

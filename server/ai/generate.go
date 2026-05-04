package ai

import "context"

type AIGenerative interface {
	Generate(ctx context.Context, systemInstruction, content, resposneMimeType string) (string, error)
}

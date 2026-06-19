package ai

import "context"

type noopGenerative struct{}

func NewNoopAIGenerative() AIGenerative {
	return &noopGenerative{}
}

func (n *noopGenerative) Generate(ctx context.Context, systemInstruction, content, resposneMimeType string) (string, error) {
	return "{}", nil
}

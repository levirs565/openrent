package exchange_rate

import (
	"context"
	"encoding/json"
	"fmt"
	"net/http"
	"time"
)

type Service struct {
	apiKey       string
	lastResponse *exchangeRateApiResponse
	baseCode     string
}

type exchangeRateApiResponse struct {
	Result             string              `json:"result"`
	ErrorType          *string             `json:"error-type"`
	TimeLastUpdateUnix *int64              `json:"time_last_update_unix"`
	TimeNextUpdateUnix *int64              `json:"time_next_update_unix"`
	BaseCode           *string             `json:"base_code"`
	ConversionRates    *map[string]float64 `json:"conversion_rates"`
}

func NewService(apiKey string) *Service {
	return &Service{
		apiKey:   apiKey,
		baseCode: "IDR",
	}
}

func (s *Service) Get(ctx context.Context) (ExchangeRateDto, error) {
	if s.lastResponse == nil || (*s.lastResponse.TimeNextUpdateUnix < time.Now().Unix()) {
		resp, err := http.Get(fmt.Sprintf("https://v6.exchangerate-api.com/v6/%s/latest/%s", s.apiKey, s.baseCode))
		if err != nil {
			return ExchangeRateDto{}, err
		}
		defer resp.Body.Close()

		var result exchangeRateApiResponse
		err = json.NewDecoder(resp.Body).Decode(&result)
		if err != nil {
			return ExchangeRateDto{}, err
		}

		if result.Result != "success" {
			return ExchangeRateDto{}, fmt.Errorf("unexpected result: %s", *result.ErrorType)
		}

		s.lastResponse = &result
	}

	return ExchangeRateDto{
		BaseCode:        *s.lastResponse.BaseCode,
		ConversionRates: *s.lastResponse.ConversionRates,
		LastUpdate:      time.Unix(*s.lastResponse.TimeLastUpdateUnix, 0),
		NextUpdate:      time.Unix(*s.lastResponse.TimeNextUpdateUnix, 0),
	}, nil
}

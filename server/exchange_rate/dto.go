package exchange_rate

import "time"

type ExchangeRateDto struct {
	BaseCode        string             `json:"base_code"`
	ConversionRates map[string]float64 `json:"conversion_rates"`
	LastUpdate      time.Time          `json:"last_update"`
	NextUpdate      time.Time          `json:"next_update"`
}

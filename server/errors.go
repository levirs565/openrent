package main

import (
	"errors"
	"net/http"
	"openrent-server/address"
	"openrent-server/auth"
	"openrent-server/chat"
	"openrent-server/message"
	"openrent-server/owner_rent"
	"openrent-server/product"
	"openrent-server/rent"
	"openrent-server/review"

	"github.com/labstack/echo/v5"
)

// TODO: Error code
var error_codes map[error]int = map[error]int{
	address.ErrNotFound: http.StatusNotFound,

	auth.ErrEmailDuplicated:  http.StatusConflict,
	auth.ErrEmailNotFound:    http.StatusNotFound,
	auth.ErrPasswordNotMatch: http.StatusUnauthorized,

	chat.ErrCannotSendToSelf: http.StatusConflict,

	message.ErrNotFound: http.StatusNotFound,

	owner_rent.ErrNotFound:           http.StatusNotFound,
	owner_rent.ErrNotPending:         http.StatusConflict,
	owner_rent.ErrNotReady:           http.StatusConflict,
	owner_rent.ErrCannotHandover:     http.StatusConflict,
	owner_rent.ErrReturnNotRequested: http.StatusConflict,

	product.ErrNotFound:               http.StatusNotFound,
	product.ErrStockUnavailable:       http.StatusConflict,
	product.ErrCannotRentOwnedProduct: http.StatusConflict,

	rent.ErrNotFound:         http.StatusNotFound,
	rent.ErrNotReady:         http.StatusConflict,
	rent.ErrNotActive:        http.StatusConflict,
	rent.ErrNotCompleted:     http.StatusConflict,
	rent.ErrReviewDuplicated: http.StatusConflict,

	review.ErrNotFound: http.StatusNotFound,
}

func mapError(err error) error {
	for e, code := range error_codes {
		if errors.Is(err, e) {
			return echo.NewHTTPError(code, err.Error())
		}
	}
	return err
}

func NewErrorHandler() echo.HTTPErrorHandler {
	defaultHandler := echo.DefaultHTTPErrorHandler(false)
	return func(c *echo.Context, err error) {
		defaultHandler(c, mapError(err))
	}
}

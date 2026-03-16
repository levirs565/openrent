package core

import (
	"github.com/gorilla/sessions"
	"github.com/labstack/echo/v5"
)

func NewSessionMiddleware(store sessions.Store) echo.MiddlewareFunc {
	return func(next echo.HandlerFunc) echo.HandlerFunc {
		return func(c *echo.Context) error {
			c.Set("_session_store", store)
			return next(c)
		}
	}
}

func GetSession(c *echo.Context) (*sessions.Session, error) {
	store, err := echo.ContextGet[sessions.Store](c, "_session_store")
	if err != nil {
		return nil, err
	}
	return store.Get(c.Request(), "session")
}

type UserSession struct {
	ID   uint
	Role string
}

const (
	userIdKey   = "user_id"
	userRoleKey = "user_role"
)

func SetUserSession(session *sessions.Session, user UserSession) {
	session.Values[userIdKey] = user.ID
	session.Values[userRoleKey] = user.Role
}

func GetUserSession(session *sessions.Session) (UserSession, bool) {
	id, hasId := session.Values[userIdKey].(uint)
	role, hasRole := session.Values[userRoleKey].(string)
	return UserSession{
		ID:   id,
		Role: role,
	}, hasId && hasRole
}

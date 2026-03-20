package core

import (
	"net/http"
	"openrent-server/models"

	"github.com/gorilla/sessions"
	"github.com/labstack/echo/v5"
)

const (
	rawSessionKey  string = "session"
	userSessionKey string = "user_session"
)

func NewSessionMiddleware(store sessions.Store) echo.MiddlewareFunc {
	return func(next echo.HandlerFunc) echo.HandlerFunc {
		return func(c *echo.Context) error {
			session, err := store.Get(c.Request(), "session")
			if err != nil {
				return err
			}

			userSession := GetUserSessionFromSession(session)

			c.Set(rawSessionKey, session)
			c.Set(userSessionKey, userSession)

			return next(c)
		}
	}
}

func GetSession(c *echo.Context) *sessions.Session {
	session, err := echo.ContextGet[*sessions.Session](c, rawSessionKey)
	if err != nil {
		panic("SessionMiddleware is not registerd")
	}
	return session
}

func GetUserSession(c *echo.Context) UserSession {
	session, err := echo.ContextGet[UserSession](c, userSessionKey)
	if err != nil {
		panic("SessionMiddleware is not registerd")
	}
	return session
}

func SetUserSession(session *sessions.Session, user UserSession) {
	session.Values[userIdKey] = user.ID
	session.Values[userRoleKey] = user.Role
}

type UserSession struct {
	IsLoggedIn bool
	ID         uint
	Role       string
}

const (
	userIdKey   = "user_id"
	userRoleKey = "user_role"
)

func GetUserSessionFromSession(session *sessions.Session) UserSession {
	id, hasId := session.Values[userIdKey].(uint)
	role, hasRole := session.Values[userRoleKey].(string)
	return UserSession{
		ID:         id,
		Role:       role,
		IsLoggedIn: hasId && hasRole,
	}
}

type GuardRoleRule string

const (
	GuardRoleNotLoggedIn GuardRoleRule = ""
	GuardRoleLoggedIn    GuardRoleRule = "logged-in"
	GuardRoleAdmin       GuardRoleRule = GuardRoleRule(models.AccountRoleAdmin)
	GuardRoleUser        GuardRoleRule = GuardRoleRule(models.AccountRoleUser)
)

func GuardRole(session UserSession, rule GuardRoleRule) error {
	if rule == GuardRoleNotLoggedIn {
		if session.IsLoggedIn {
			return echo.NewHTTPError(http.StatusForbidden, "you are logged in")
		}
		return nil
	}

	if !session.IsLoggedIn {
		return echo.NewHTTPError(http.StatusForbidden, "you are not logged in")
	}

	if rule == GuardRoleLoggedIn {
		return nil
	}
	if session.Role == string(rule) {
		return nil
	}

	return echo.NewHTTPError(http.StatusForbidden, "role do not match")
}

func NewGuardRoleMiddleware(rule GuardRoleRule) echo.MiddlewareFunc {
	return func(next echo.HandlerFunc) echo.HandlerFunc {
		return func(c *echo.Context) error {
			session := GetUserSession(c)
			err := GuardRole(session, rule)
			if err != nil {
				return err
			}

			return next(c)
		}
	}
}

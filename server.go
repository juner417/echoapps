package main

import (
	"encoding/json"
	"log"
	"net/http"

	"github.com/labstack/echo/v4"
	"github.com/zcalusic/sysinfo"
)

// handler
func hello(c echo.Context) error {
	return c.String(http.StatusOK, "Hello world")
}

func info(c echo.Context) error {
	var si sysinfo.SysInfo
	si.GetSysInfo()

	data, err := json.MarshalIndent(&si, "", " ")
	if err != nil {
		log.Fatal(err)
	}
	return c.String(http.StatusOK, string(data))
}

func healthz(c echo.Context) error {
	return c.String(http.StatusOK, "OK")
}

func main() {
	e := echo.New()
	//route
	e.GET("/hello", hello)
	e.GET("/info", info)
	e.GET("/heatlz", healthz)
	e.Logger.Fatal(e.Start(":1234"))
}

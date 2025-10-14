package main

import (
	"fmt"
	"github.com/gofiber/fiber/v2"
	"log"
	"time"
)


func main() {
  app := fiber.New()
  
  app.Get("/uses", func(c *fiber.Ctx) error {
		return c.SendString("GET uses:\n\t/\n\t/hello\n\t/uses")
  })

  app.Get("/hello", func(c *fiber.Ctx) error {
  	return c.SendString("Hello, World!")
  })

  app.Get("/", func(c *fiber.Ctx) error {
		currentTime := time.Now()
		unixTime := currentTime.Unix()
		routeResponse := fmt.Sprintf("{\"message\":\"%s\",\"timestamp\":%d}","My name is Zach Boggs",unixTime)
		return c.SendString(routeResponse)
  })
  
  log.Fatal(app.Listen(":80"))
}

package main

import (
	"encoding/json"
	"fmt"
	"io"
	"log"
	"net/http"
	"os"

	"github.com/joho/godotenv"
	"golang.org/x/text/cases"
	"golang.org/x/text/language"
)

func main() {
	err := godotenv.Load()
	if err != nil {
		log.Fatal("Error loading .env file")
	}
	api_key := os.Getenv("API_KEY")
	city := os.Getenv("CITY")

	url := fmt.Sprintf(
		"https://www.meteosource.com/api/v1/free/point?place_id=%s&sections=all&timezone=UTC&language=en&units=metric&key=%s",
		city, api_key)

	resp, err := http.Get(url)
	if err != nil {
		log.Fatal(err)
	}
	defer resp.Body.Close()

	body, err := io.ReadAll(resp.Body)
	if err != nil {
		log.Fatal(err)
	}

	if resp.StatusCode != 200 {
		panic(fmt.Sprintf("Error HTTP: %d", resp.StatusCode))
	}

	var data WeatherResponse
	if err := json.Unmarshal(body, &data); err != nil {
		log.Fatal(err)
	}

	temp := data.Current.Temperature
	desc := data.Current.Summary

	desc = cases.Title(language.English).String(desc)

	block := TextBar{
		FullText: fmt.Sprintf("%s: <span foreground='%s'>%.1f°C</span>", desc, setColor(temp), temp),
	}

	b, _ := json.Marshal(block)
	fmt.Println(string(b))
}

func setColor(temp float64) string {
	switch {
	case temp >= 31.0:
		return "#FF0000"
	case temp >= 26.0:
		return "#FFA500"
	case temp >= 20.0:
		return "#FFFF00"
	case temp >= 15:
		return "#32CD32"
	case temp >= 10.0:
		return "#66CCFF"
	case temp >= 0.0:
		return "#0000FF"
	default:
		return "#00008B"
	}
}

type WeatherResponse struct {
	Current struct {
		Temperature float64 `json:"temperature"`
		Summary     string  `json:"summary"`
	} `json:"current"`
}

type TextBar struct {
	FullText string `json:"full_text"`
}

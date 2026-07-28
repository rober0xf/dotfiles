package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
	"strconv"
	"strings"

	"github.com/PuerkitoBio/goquery"
	"github.com/joho/godotenv"
)

var colors = map[string]string{
	"#FF0000": "red",
	"#FFA500": "orange",
	"#FFFF00": "yellow",
	"#00FF00": "limegreen",
	"#66CCFF": "skyblue",
	"#00A2E8": "cyan-blue",
	"#1A1AC6": "darkblue",
}

var translate = map[string]string{
	"Soleado":             "Sunny",
	"Tormenta":            "Storm",
	"Lluvia":              "Rain",
	"Lluvia débil":        "Light Rain",
	"Lluvia moderada":     "Moderate Rain",
	"Parcialmente nuboso": "Partly Cloudy",
	"Nublado":             "Cloudy",
	"Cubierto":            "Overcast",
	"Despejado":           "Clear",
	"Cielo despejado":     "Mostly Clear",
	"Nubes y claros":      "Cloudy Intervals",
	"Niebla":              "Fog",
}

func setColor(temp int) string {
	switch {
	case temp >= 31:
		return "#FF0000"
	case temp >= 26:
		return "#FFA500"
	case temp >= 20:
		return "#FFFF00"
	case temp >= 15:
		return "#00FF00"
	case temp >= 10:
		return "#66CCFF"
	case temp >= 0:
		return "#00A2E8"
	default:
		return "#1A1AC6"
	}
}

func main() {
	home, _ := os.UserHomeDir()
	err := godotenv.Load(home + "/.config/i3blocks/weather/.env")
	if err != nil {
		log.Fatal("Error loading .env file")
	}

	url := os.Getenv("URL")
	if url == "" {
		fmt.Fprintln(os.Stderr, "URL is broken")
		os.Exit(1)
	}

	req, err := http.NewRequest("GET", url, nil)
	if err != nil {
		fmt.Fprintln(os.Stderr, err)
		os.Exit(1)
	}
	req.Header.Set("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64)")

	client := &http.Client{}
	resp, err := client.Do(req)
	if err != nil {
		fmt.Fprintln(os.Stderr, err)
		os.Exit(1)
	}
	defer resp.Body.Close()

	if resp.StatusCode >= 400 {
		fmt.Fprintf(os.Stderr, "HTTP error: %s\n", resp.Status)
		os.Exit(1)
	}

	doc, err := goquery.NewDocumentFromReader(resp.Body)
	if err != nil {
		fmt.Fprintln(os.Stderr, err)
		os.Exit(1)
	}

	tempTag := doc.Find("span.dato-temperatura.changeUnitT").First()
	descTag := doc.Find("span.descripcion").First()

	if tempTag.Length() > 0 && descTag.Length() > 0 {
		tempStr := strings.ReplaceAll(tempTag.Text(), "°", "")
		tempStr = strings.TrimSpace(tempStr)

		temp, err := strconv.Atoi(tempStr)
		if err != nil {
			fmt.Fprintln(os.Stderr, "invalid temperature:", err)
			os.Exit(1)
		}

		description := strings.TrimSpace(descTag.Text())
		colorHex := setColor(temp)

		desc, ok := translate[description]
		if !ok {
			desc = description
		}

		fmt.Printf(`%s: <span foreground="%s">%d°</span>`+"\n", desc, colorHex, temp)
	}
}

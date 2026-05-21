package main

import (
	"fmt"
	"os"
	"time"

	"github.com/distatus/battery"
	"github.com/shirou/gopsutil/v4/cpu"
	"github.com/shirou/gopsutil/v4/mem"
)

type BatteryInfo struct {
	Percentage int
	Color      string
	Status     string
}

func cpuStat() (float64, error) {
	percent, err := cpu.Percent(200*time.Millisecond, false)
	if err != nil {
		return 0, err
	}

	return percent[0], nil
}

func ramStat() (float64, error) {
	percent, err := mem.VirtualMemory()
	if err != nil {
		return 0, err
	}

	return percent.UsedPercent, nil
}

func batStat() (*BatteryInfo, error) {
	batteries, err := battery.GetAll()
	if err != nil {
		return nil, err
	}

	if len(batteries) == 0 {
		return nil, fmt.Errorf("no battery")
	}

	bat := batteries[0]
	percentage := int((bat.Current / bat.Full) * 100)

	var color string
	switch {
	case percentage <= 10:
		color = "#ff0000" // red
	case percentage <= 30:
		color = "#ff8800" // orange
	case percentage <= 70:
		color = "#ffff00" // yellow
	default:
		color = "#00ff00" // green
	}

	var status string
	switch bat.State.String() {
	case "Charging":
		status = "CHR"
	case "Discharging":
		status = "DIS"
	case "Full":
		status = "FULL"
	default:
		status = "UNK"
	}

	return &BatteryInfo{
		Percentage: percentage,
		Color:      color,
		Status:     status,
	}, nil
}

func main() {
	if len(os.Args) < 2 {
		fmt.Println("args: cpu | ram | bat")
		os.Exit(1)
	}

	switch os.Args[1] {
	case "cpu":
		cpu, err := cpuStat()
		if err != nil {
			panic(err)
		}
		fmt.Printf("CPU: %.2f%%\n", cpu)

	case "ram":
		ram, err := ramStat()
		if err != nil {
			panic(err)
		}
		fmt.Printf("RAM: %.2f%%\n", ram)

	case "bat":
		bat, err := batStat()
		if err != nil {
			panic(err)
		}
		fmt.Printf(
			"<span foreground=\"%s\">BAT %d%% %s</span>\n",
			bat.Color,
			bat.Percentage,
			bat.Status,
		)
	}
}

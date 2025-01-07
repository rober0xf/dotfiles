#!/bin/bash

wifi_signal=$(iw dev wlan0 link | grep signal | awk '{print $2}')

if [ -z "$wifi_signal" ]; then
    wifi_signal="0" 
fi

if [ "$wifi_signal" -ge -50 ]; then
    percent=100
elif [ "$wifi_signal" -le -100 ]; then
    percent=0
else
    percent=$(( (100 - ($wifi_signal + 100)) * 50 / 50 ))
fi

echo "WiFi: $percent%"

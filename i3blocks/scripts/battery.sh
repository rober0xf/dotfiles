#!/bin/bash

battery_info=$(acpi -b | grep -oP '\d+%' | head -n 1)

echo "BAT: $battery_info"

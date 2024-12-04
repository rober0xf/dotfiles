#!/bin/bash

battery_info=$(acpi | awk -F', ' '{print $2 " (" $3 ")"}')
cpu_info=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')

echo "Battery: $battery_info | CPU: $cpu_info% | $(date '+%Y-%m-%d %H:%M:%S')"


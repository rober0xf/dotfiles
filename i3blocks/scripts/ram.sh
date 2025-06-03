#!/bin/sh


ram_info=$(free -h | awk '/Mem:/ {gsub("i","",$2); gsub("i","",$3); print $3 "/" $2}')

echo "RAM: $ram_info"

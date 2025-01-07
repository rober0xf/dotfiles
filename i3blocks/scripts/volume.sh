#!/bin/bash

volume=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -n 1)

echo "VOL: $volume"

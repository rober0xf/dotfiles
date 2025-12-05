#!/usr/bin/env bash

state_file="/tmp/i3blocks-time-state"

if [[ $BLOCK_BUTTON == 1 ]]; then
  [[ -f $state_file && $(cat $state_file) == "date" ]] && echo "time" > $state_file || echo "date" > $state_file
fi

[[ -f $state_file && $(cat $state_file) == "date" ]] && date '+%H:%M ' || date '+%d/%m/%Y '

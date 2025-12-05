#!/usr/bin/env bash

bat=${BAT_NUMBER:-0}
label="BAT: "

line=$(acpi -b 2>/dev/null | grep "Battery $bat") || exit 0
[[ $line =~ :\ ([A-Za-z]+),\ ([0-9]+)% ]] || exit 0

st=${BASH_REMATCH[1]}
p=${BASH_REMATCH[2]}
txt="$label$p% "

case $st in
  Discharging) txt+="DIS" ;;
  Charging)    txt+="CHR" ;;
  Full)        txt+="FULL" ;;
esac

printf "%s\n%s\n" "$txt" "$txt"

if [[ $st == "Discharging" && $p -lt 85 ]]; then
  if   ((p < 20)); then printf "#FF0000\n"
  elif ((p < 40)); then printf "#FFAE00\n"
  elif ((p < 60)); then printf "#FFF600\n"
  else                  printf "#A8FF00\n"
  fi
  ((p < 5)) && exit 33
fi

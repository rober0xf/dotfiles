#!/usr/bin/env bash

# INTERFACE="${INTERFACE:-${BLOCK_INSTANCE:-wlp0s20f3}}"
INTERFACE="wlp0s20f3"

COLOR_GE80=${COLOR_GE80:-#00FF00}
COLOR_GE60=${COLOR_GE60:-#FFF600}
COLOR_GE40=${COLOR_GE40:-#FFAE00}
COLOR_LOWR=${COLOR_LOWR:-#FF0000}
COLOR_DOWN=${COLOR_DOWN:-#FF0000}

[[ ! -d "/sys/class/net/${INTERFACE}/wireless" ]] && exit

if [[ "$(cat "/sys/class/net/$INTERFACE/operstate")" = "down" ]]; then
    echo "WiFi Down"       
    echo "Down"           
    echo "$COLOR_DOWN"   
    exit
fi

CONN_INFO=$(nmcli -t -f ACTIVE,SSID,SIGNAL dev wifi | grep "^yes")

if [[ -z "$CONN_INFO" ]]; then
    echo "No Connection"
    echo "NC"          
    echo "$COLOR_DOWN"
    exit
fi

SSID=$(echo "$CONN_INFO" | cut -d':' -f2)
SIGNAL=$(echo "$CONN_INFO" | cut -d':' -f3)

if (( SIGNAL >= 80 )); then
    COLOR="$COLOR_GE80"
elif (( SIGNAL >= 60 )); then
    COLOR="$COLOR_GE60"
elif (( SIGNAL >= 40 )); then
    COLOR="$COLOR_GE40"
else
    COLOR="$COLOR_LOWR"
fi

echo "$SSID $ICON ${SIGNAL}%"  
echo "${SIGNAL}%"             
echo "$COLOR"                

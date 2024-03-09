#!/usr/bin/env bash

# Battery information
status="$(cat /sys/class/power_supply/BAT1/status)"
capacity="$(cat /sys/class/power_supply/BAT1/capacity)"
battery_background="#1b3a5b"
battery_foreground="white"

if [[ $status == "Discharging" ]]; then
    battery_foreground="#0d1017"

    [[ $capacity -ge 50 ]] && battery_background="#aad94c"
    [[ $capacity -lt 50 && $capacity -gt 20 ]] && battery_background="#ff8f40"
    [[ $capacity -le 20 ]] && battery_background="#f26d78"
fi

echo "#[bg=${battery_background},fg=${battery_foreground}] $capacity "

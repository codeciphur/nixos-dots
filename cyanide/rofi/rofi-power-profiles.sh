#!/usr/bin/env bash

# Fetch current profile to display as a hint
current_profile=$(powerprofilesctl get)

# Menu entries with pretty icons
perf="  Performance"
balanced="  Balanced"
powersave="  Power Saver"
cancel="  Cancel"

options="$perf\n$balanced\n$powersave\n$cancel"

# Call Rofi (using Wayland-compatible dmenu mode)
chosen=$(echo -e "$options" | rofi -dmenu -i -p "Power Profile" -mesg "Active: $current_profile" -theme-str 'window {width: 300px;}')

case "$chosen" in
    "$perf")
        powerprofilesctl set performance
        notify-send -i "power-profile-performance" "Power Mode" "Switched to Performance"
        ;;
    "$balanced")
        powerprofilesctl set balanced
        notify-send -i "power-profile-balanced" "Power Mode" "Switched to Balanced"
        ;;
    "$powersave")
        powerprofilesctl set power-saver
        notify-send -i "power-profile-power-saver" "Power Mode" "Switched to Power Saver"
        ;;
    *)
        exit 0
        ;;
esac

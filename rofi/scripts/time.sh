#!/bin/bash

rofi_command="rofi -theme themes/time.rasi"

## Get time and date
TIME="$(date +"%A, %R")"
DAY="$(date +"%d")"
MONTH="$(date +"%m")"
YEAR="$(date +"%Y")"

options="$DAY\n$MONTH\n$YEAR"

## Main
chosen="$(echo -e "$options" | $rofi_command -p "$TIME" -dmenu -selected-row 1)"

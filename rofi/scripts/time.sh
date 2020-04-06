#!/bin/bash

rofi_command="rofi -theme themes/time.rasi"

## Get time and date
TIME_DATE="$(date +"%a %d, %R")"
DAY="$(date +"%d" | tr -d '0')"

calendar="$(cal -m | sed '/^[[:space:]]*$/d')"

options="$calendar"

## Main
chosen="$(echo -e "$options" | $rofi_command -p "$TIME_DATE" -dmenu -selected-row 1)"

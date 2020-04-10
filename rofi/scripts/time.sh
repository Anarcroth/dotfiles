#!/bin/bash

rofi_command="rofi -theme themes/time.rasi"

## Get time and date
TIME_DATE="$(date +"%a %d, %R")"
DAY="$(date +"%d" | tr -d '0')"

month_num="$(date +"%m" | tr -d '0')"
month_num=$(( ($month_num - 1) * 8 + 1 ))

calendar=""
months=("jan" "feb" "mar" "apr" "may" "jun" "jul" "aug" "sep" "oct" "nov" "dec")
for m in "${months[@]}"
do
    curr_month="$(cal -m $m | sed '/^[[:space:]]*$/d')"
    month_lines="$(cal -m $m | sed '/^[[:space:]]*$/d' | wc -l)"
    # In order for the view to be even through the year calendar, on month that have 8 lines of text,
    # they should have only one additional new-line at the end.
    if (( $month_lines > 7 ))
    then
	calendar="$calendar$curr_month\n"
    else
	calendar="$calendar$curr_month\n\n"
    fi
done

options="$calendar"

## Main
chosen="$(echo -e "$options" | $rofi_command -p "$TIME_DATE" -dmenu -selected-row $month_num)"

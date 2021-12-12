#!/bin/bash

rofi_command="rofi -theme $HOME/dotfiles/rofi/themes/time.rasi"

## Get time and date
TIME_DATE="$(date +"%a %d, %R")"
DAY="$(date +"%d" | tr -d '0')"

calendar=""
months=("jan" "feb" "mar" "apr" "may" "jun" "jul" "aug" "sep" "oct" "nov" "dec")
function month_population {
    for m in "${months[@]}"
    do
	curr_month="$(cal -m $m $1 | sed '/^[[:space:]]*$/d')"
	month_lines="$(cal -m $m $1 | sed '/^[[:space:]]*$/d' | wc -l)"
	# $month_lines calculates how many lines the current month takes up in terms vertical space.
	# This can range anywhere between 6 to 8 lines.
	# In order for the view to be even through the year calendar, on months that have 6 lines of text,
	# they should have three additional new-line at the end.
	# For months with 7 lines of text, the trailing new lines have to be 2 more.
	# For months with 8 lines of text, only add one new line.
	if (( $month_lines == 6 ))
	then
	    calendar="$calendar$curr_month\n\n\n"
	elif (( $month_lines == 7 ))
	then
	    calendar="$calendar$curr_month\n\n"
	else
	    calendar="$calendar$curr_month\n"
	fi
    done
}

# This calculates on which month should the selected row be placed
# The initial offset is to go through the first 3 previous years. 8 means the row numbers per month, 3 is the number of years, 12 is the number of months.
initial_3y_offset=$(( 8 * 3 * 12 ))
# This calculates the initial offset with the current month that has to be selected. The last +1 means to select the week days (to be pretty)
month_num=$(( $initial_3y_offset + ($(date +"%m") - 1) * 8 + 1))

# Populate the calendar up to three previous years
for i in {3..1}
do
    curr_year=$(date +"%Y")
    prev_year=$(($curr_year - $i))
    month_population $prev_year
done

# Populate the calendar with the current year and up to three coming years
for i in {0..3}
do
    curr_year=$(date +"%Y")
    next_year=$(( $curr_year + $i ))
    month_population $next_year
done

options="$calendar"

## Main
chosen="$(echo -e "$options" | $rofi_command -p "$TIME_DATE" -dmenu -selected-row $month_num)"

#!/bin/bash

rofi_command="rofi -theme themes/screenshot.rasi"

# Options
screen=""
area=""
window=""

# Variable passed to rofi
options="$screen\n$area\n$window"

chosen="$(echo -e "$options" | $rofi_command -p '' -dmenu -selected-row 1)"
case $chosen in
    $screen)
        scrot 'Screenshot_%Y-%m-%d-%S_$wx$h.png' -e 'mv $f /home/anarcroth/Pictures/ ; nomacs /home/anarcroth/Pictures/$f'
        ;;
    $area)
        scrot -s 'Screenshot_%Y-%m-%d-%S_$wx$h.png' -e 'mv $f /home/anarcroth/Pictures/ ; nomacs /home/anarcroth/Pictures/$f'
        ;;
    $window)
        scrot -u 'Screenshot_%Y-%m-%d-%S_$wx$h.png' -e 'mv $f /home/anarcroth/Pictures/ ; nomacs /home/anarcroth/Pictures/$f'
        ;;
esac

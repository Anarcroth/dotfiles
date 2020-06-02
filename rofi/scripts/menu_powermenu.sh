#!/bin/bash

rofi_command="rofi -theme themes/menu/powermenu.rasi"
uptime=$(uptime -p | sed -e 's/up //g')

# Options
shutdown="襤"
reboot="ﰇ"
lock=""
suspend="鈴"
logout=""

# Variable passed to rofi
options="$shutdown\n$reboot\n$lock\n$suspend\n$logout"

chosen="$(echo -e "$options" | $rofi_command -p "祥 $uptime uptime" -dmenu -selected-row 2)"
case $chosen in
    $shutdown)
        poweroff
        ;;
    $reboot)
        reboot
        ;;
    $lock)
        bash lock
        ;;
    $suspend)
        amixer set Master mute
        systemctl suspend
        ;;
    $logout)
        exit i3
        ;;
esac

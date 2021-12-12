#!/bin/bash

rofi_command="rofi -theme $HOME/dotfiles/rofi/themes/menu/powermenu.rasi"
uptime=$(uptime -p | sed -e 's/up //g' | sed -e 's/ minutes/ min/g')

# Options
shutdown="襤"
reboot="ﰇ"
lock=""
suspend="鈴"
logout=""

# Variable passed to rofi
options="$shutdown\n$reboot\n$lock\n$suspend\n$logout"

chosen="$(echo -e "$options" | $rofi_command -p "$uptime up" -dmenu -selected-row 2)"
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

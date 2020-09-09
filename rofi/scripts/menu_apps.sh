#!/bin/bash

rofi_command="rofi -theme themes/menu/apps.rasi"

# Links
editor=""
keepassxc=""
terminal=""
browser=""
slack=""

# Variable passed to rofi
options="$slack\n$keepassxc\n$editor\n$browser\n$terminal"

chosen="$(echo -e "$options" | $rofi_command -p "Most Used" -dmenu -selected-row 2)"
case $chosen in
    $terminal)
        xterm &
        ;;
    $slack)
        slack &
        ;;
    $editor)
        emacs &
        ;;
    $browser)
        firefox &
        ;;
    $keepassxc)
        keepassxc &
        ;;
esac

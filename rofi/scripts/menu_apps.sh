#!/bin/bash

rofi_command="rofi -theme themes/menu/apps.rasi"

# Links
editor=""
keepassxc=""
terminal=""
browser=""
slack=""

# Variable passed to rofi
options="$editor\n$keepassxc\n$slack\n$terminal\n$browser"

chosen="$(echo -e "$options" | $rofi_command -p "Most Used" -dmenu -selected-row 0)"
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

#!/bin/bash

rofi_command="rofi -theme themes/menu/apps.rasi"

# Links
editor=""
keepassxc=""
terminal=""
browser=""
files="ﱮ"

# Variable passed to rofi
options="$editor\n$keepassxc\n$terminal\n$browser\n$files"

chosen="$(echo -e "$options" | $rofi_command -p "Most Used" -dmenu -selected-row 0)"
case $chosen in
    $terminal)
        xterm &
        ;;
    $files)
        qtfm &
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

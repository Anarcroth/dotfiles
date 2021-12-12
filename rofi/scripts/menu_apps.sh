#!/bin/bash

rofi_command="rofi -theme $HOME/dotfiles/rofi/themes/menu/apps.rasi"

# Links
editor=""
keepassxc=""
spotify=""
browser=""
slack=""

# Variable passed to rofi
options="$slack\n$keepassxc\n$editor\n$browser\n$spotify"

chosen="$(echo -e "$options" | $rofi_command -p "Most Used" -dmenu -selected-row 2)"
case $chosen in
    $spotify)
        spotify &
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

#!/bin/bash

## Author : Aditya Shakya (adi1090x)
## Mail : adi1090x@gmail.com
## browser : @adi1090x
## music : @adi1090x

rofi_command="rofi -theme themes/apps.rasi"

# Links
editor=""
terminal=""
browser=""
files="ﱮ"
music=""

# Variable passed to rofi
options="$editor\n$terminal\n$browser\n$files\n$music"

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
    $music)
        lxmusic &
        ;;
esac

#!/bin/bash

rofi_command="rofi -theme $HOME/dotfiles/rofi/themes/network.rasi"

## Get info
IFACE="$(nmcli | grep -i interface | awk '/interface/ {print $2}')"
SSID="$(iwgetid -r)"
STATUS="$(nmcli radio wifi)"

active=""
urgent=""

if (ping -c 1 archlinux.org || ping -c 1 github.com) &>/dev/null; then
    if [[ $STATUS == *"enable"* ]]; then
        if [[ $IFACE == e* ]]; then
            connected=""
        else
            connected="直"
        fi
	active="-a 0"
	MSG="﬉ $SSID"
	PIP="$(dig +short myip.opendns.com @resolver1.opendns.com )"
	fi
else
    urgent="-u 0"
    MSG="Offline"
    PIP="Not Available"
    connected="睊"
fi

## Icons
bmon="龍"
launch="歷"

options="$connected\n$bmon\n$launch"

## Main
chosen="$(echo -e "$options" | $rofi_command -p "$MSG" -dmenu $active $urgent -selected-row 1)"
case $chosen in
    $connected)
	if [[ $STATUS == *"enable"* ]]; then
	    nmcli radio wifi off
	else
	    nmcli radio wifi on
	fi
        ;;
    $bmon)
        xterm -e bmon
        ;;
    $launch)
        nm-connection-editor
        ;;
esac

#!/bin/bash

# Setup status-bar (polybar)
echo "Updating polybar"
# Update monitor variables
DP_MONITOR=$(xrandr --query | grep -m 1 "^DP.* connected" | awk '{ print $1 }')
EDP_MONITOR=$(xrandr --query | grep -m 1 "^eDP.* connected" | awk '{ print $1 }')
HDMI_MONITOR=$(xrandr --query | grep -m 1 "^HDMI.* connected" | awk '{ print $1 }')

if [ "$DP_MONITOR" ]; then
    echo "Updating DP [$DP_MONITOR] monitor (middle)"
    sed -i 's/\(middle = \).*/\1'"$DP_MONITOR"'/' ~/dotfiles/polybar/one-dark.conf
fi

if [ "$EDP_MONITOR" ]; then
    echo "Updating eDP [$EDP_MONITOR] monitor (right)"
    sed -i 's/\(right = \).*/\1'"$EDP_MONITOR"'/' ~/dotfiles/polybar/one-dark.conf
fi

if [ "$HDMI_MONITOR" ]; then
    echo "Updating HDMI [$HDMI_MONITOR] monitor (left)"
    sed -i 's/\(left = \).*/\1'"$HDMI_MONITOR"'/' ~/dotfiles/polybar/one-dark.conf
fi

# Update ethernet/wifi interfaces
ETH_INTERFACE=$(nmcli device status | grep -m 1 "ethernet " | awk '{ print $1 }')
WIFI_INTERFACE=$(nmcli device status | grep -m 1 "wifi " | awk '{ print $1 }')

if [ "$ETH_INTERFACE" ]; then
    echo "Updating ethernet interface [$ETH_INTERFACE]"
    sed -i 's/ETH_HOLDER/'"$ETH_INTERFACE"'/' ~/dotfiles/polybar/one-dark.conf
fi

if [ "$WIFI_INTERFACE" ]; then
    echo "Updating wifi interface [$WIFI_INTERFACE]"
    sed -i 's/WIFI_HOLDER/'"$WIFI_INTERFACE"'/' ~/dotfiles/polybar/one-dark.conf
fi

# Setup i3
if pactl set-default-sink 0 > /dev/null 2>&1; then
    echo "Updating volume sink to 0"
    sed -i 's/\(set $sink_num\).*/\1 0/' ~/.config/i3/config
else
    echo "Updating volume sink to 1"
    sed -i 's/\(set $sink_num\).*/\1 1/' ~/.config/i3/config
fi

# Setup rofi
echo "Updating rofi"
cp -r ~/dotfiles/rofi/ ~/.config/rofi/

# Update git
echo "Updating global gitconfig"
cp ~/dotfiles/git/gitconfig ~/.gitconfig

# Copy custom scripts
echo "Copying scripts"
sudo cp -u ~/dotfiles/scripts/* /usr/local/bin/

#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

if xrandr --query | grep "HDMI-0 connected";
then
  polybar -r -q -c $HOME/.config/polybar/one-dark topL &
  polybar -r -q -c $HOME/.config/polybar/one-dark bottomL &
fi

if xrandr --query | grep "eDP-1-1 connected";
then
  polybar -r -q -c $HOME/.config/polybar/one-dark topR &
  polybar -r -q -c $HOME/.config/polybar/one-dark bottomR &
fi

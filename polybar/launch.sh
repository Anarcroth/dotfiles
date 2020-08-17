#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

if xrandr --query | grep "^HDMI.* connected";
then
  polybar -r -q -c $HOME/dotfiles/polybar/one-dark.conf bottomL &
fi

if xrandr --query | grep "^eDP.* connected";
then
  polybar -r -q -c $HOME/dotfiles/polybar/one-dark.conf bottomR &
fi

if xrandr --query | grep "^DP.* connected";
then
  polybar -r -q -c $HOME/dotfiles/polybar/one-dark.conf bottomM &
fi

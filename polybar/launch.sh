#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar -r -q -c $HOME/.config/polybar/penguin top &
    MONITOR=$m polybar -r -q -c $HOME/.config/polybar/penguin bottom
  done
else
  MONITOR=$m polybar -r -q -c $HOME/.config/polybar/penguin top &
  MONITOR=$m polybar -r -q -c $HOME/.config/polybar/penguin bottom
fi

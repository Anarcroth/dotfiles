#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Restart polybar from file quietly
polybar -r -q -c $HOME/.config/polybar/penguin top &
polybar -r -q -c $HOME/.config/polybar/penguin bottom

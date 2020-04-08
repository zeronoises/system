#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2 for bspwm
polybar -r -c $HOME/.config/polybar/bspwm bar1 &
polybar -r -c $HOME/.config/polybar/bspwm bar2 &

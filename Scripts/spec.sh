#!/bin/bash

## for tdm session

xrandr --auto --output HDMI-0 --mode 1920x1080 --right-of DVI-D-0
# picom -b &
xmodmap ~/.Xmodmap &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
soundcard2 &
dpms_off &
xdotool key --clearmodifiers Num_Lock &
cadence-session-start -s &
dunst &
udiskie -t &
dropbox &
clipmenud &
~/.fehbg &
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.cache/wal/colors.Xresources
exec spectrwm -c ~/.config/spectrwm/spectrwm.conf

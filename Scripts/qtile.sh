#!/bin/bash

## for tdm session

xrandr --output DVI-D-0 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VGA-0 --off --output HDMI-0 --mode 1920x1080 --pos 1920x0 --rotate normal &
xmodmap ~/.Xmodmap &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
soundcard2 &
dpms_off &
xdotool key --clearmodifiers Num_Lock &
picom -b &
cadence-session-start -s &
dunst &
udiskie -t &
nm-applet &
dropbox &
clipmenud &
~/.fehbg &
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.cache/wal/colors.Xresources
exec qtile start

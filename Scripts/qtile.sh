#!/bin/bash

## for tdm session

picom -b --experimental-backends &
cadence-session-start -s &
dunst &
udiskie -t &
nm-applet &
dropbox &
clipmenud &
~/.fehbg &
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.cache/wal/colors.Xresources
exec qtile start

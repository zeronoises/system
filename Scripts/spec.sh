#!/bin/bash

## for tdm session

picom -b --experimental-backend --xinerama-shadow-crop &
dunst &
udiskie -t &
dropbox &
clipmenud &
~/.fehbg &
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.cache/wal/colors.Xresources
exec spectrwm -c ~/.config/spectrwm/spectrwm.conf

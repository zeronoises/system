#!/bin/bash

## for tdm session

picom -b --experimental-backend &
dunst &
udiskie &
dropbox &
clipmenud &
nitrogen --restore &
exec spectrwm -c ~/.config/spectrwm/spectrwm.conf
#!/bin/bash

## for tdm session

picom -b --experimental-backend &
udiskie &
dropbox &
nitrogen --restore &
dunst &
clipmenud &

exec herbstluftwm --locked

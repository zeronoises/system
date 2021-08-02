#!/bin/bash

WLPDIR="/mnt/Gog/Papers/"
files=($WLPDIR*)
wlpfile=${files[RANDOM % ${#files[@]}]}

feh --bg-fill --no-xinerama "$wlpfile"

wpg -n -s "$wlpfile"

qtile cmd-obj -o cmd -f restart

sample="$HOME/.config/wpg/samples/${wlpfile:16}_wal_sample.png"
cp "$sample" "$HOME/.config/wpg/current_sample.png"
yad --no-buttons --center --image "$HOME/.config/wpg/current_sample.png"
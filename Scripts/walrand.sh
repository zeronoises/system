#!/bin/bash

WLPDIR="/mnt/Gog/Papers/"

files=($WLPDIR*)
wlpfile=${files[RANDOM % ${#files[@]}]}

wpg -n -s "$wlpfile"
qtile cmd-obj -o cmd -f restart
feh --bg-fill --no-xinerama "$wlpfile"
notify-send -i "$wlpfile" "New Colourscheme..."
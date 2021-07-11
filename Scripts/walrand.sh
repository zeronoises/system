#!/bin/bash

WLPDIR="/mnt/Gog/Papers/"

files=($WLPDIR*)
wlpfile=${files[RANDOM % ${#files[@]}]}

wpg -n -s "$wlpfile"
feh --bg-fill --no-xinerama "$wlpfile"

#!/bin/bash

WLPDIR="/mnt/Gog/Papers/"

files=($WLPDIR*)
wlpfile=${files[RANDOM % ${#files[@]}]}
# printf "Setting wallpaper to %s\n" "$wlpfile"
wal -n -i "$wlpfile"
feh --bg-fill --no-xinerama "$wlpfile"
sh /mnt/Gog/repos/system/Scripts/dunstwal.sh
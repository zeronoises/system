#!/bin/bash

. "${HOME}/.cache/wal/colors.sh"


grep bind /mnt/Gog/repos/system/spectrwm.conf | tail -n +3 | sed 's/.....//;s/\]//' | column -t | dmenu -fn 'Droid Sans Mono-14' -nb "$color0" -nf "$color15" -sb "$color1" -sf "$color15" -c -i -l 12 -bw 2
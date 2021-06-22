#!/bin/bash

. "${HOME}/.cache/wal/colors.sh"

column -t < /mnt/Gog/updates.txt | dmenu -fn 'Droid Sans Mono-14' -nb "$color0" -nf "$color15" -sb "$color1" -sf "$color15" -c -i -l 12 -bw 2
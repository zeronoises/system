#!/bin/bash

. "${HOME}/.cache/wal/colors.sh"

j4-dmenu-desktop --dmenu="dmenu -i -bw 2 -c -l 15 -nb '$color0' -nf '$color15' -sb '$color1' -sf '$color15' -fn 'Droid Sans Mono-14'" --term="kitty" --use-xdg-de --no-generic --display-binary --usage-log="${HOME}/.cache/j4log"

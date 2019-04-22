#!/bin/sh

cd /mnt/Gog/Scripts || return

convert -size 2000x2000 xc:"#929292" -font "Inconsolata-g" -pointsize 13 \
    -fill "#000000" -annotate +10+12 @keys.txt -trim -bordercolor "#929292" -border 20 +repage keys.png

feh -x --no-menus --on-last-slide quit --title "cheat" keys.png

rm keys.png

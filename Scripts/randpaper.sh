#! /bin/bash

find /mnt/Gog/Papers -type f \( -name '*.jpg' -o -name '*.png' \) -print0 | shuf -n1 -z | xargs -0 feh --bg-fill --no-xinerama

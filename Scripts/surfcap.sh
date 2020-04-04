#!/bin/bash
cd /mnt/Gog/Temp
kitty --title SurfaceNoise &
sleep 1
xdotool key --window $(xdotool search --name SurfaceNoise) ctrl+l
xdotool type --window $(xdotool search --name SurfaceNoise) 'sncapture sn'

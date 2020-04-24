#!/bin/bash

picom -b &
killall greenclip
greenclip daemon &
sxhkd &
killall thunderbird
thunderbird &
killall carla
carla-jack-multi /mnt/Magog/Audio_Projects/carla patches/carla_default.carxp &
killall megasync
megasync &
polybspwm &

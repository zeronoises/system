#!/bin/bash

picom -b --experimental-backend &
killall clipmenud
clipmenud &
sxhkd &
killall thunderbird
thunderbird &
killall carla
carla-jack-multi &
polybspwm &
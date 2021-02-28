#!/bin/bash

killall clipmenud
clipmenud &
sxhkd &
killall thunderbird
thunderbird &
killall carla
carla-jack-multi &
polybspwm &
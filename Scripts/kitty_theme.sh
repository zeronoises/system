#!/bin/bash

choice=$(ls /home/zero/.config/kitty/themes | dmenu -c -l 12 -i -bw 2 -sb '#4586A6' -fn "Droid Sans Mono-14")

ln -sf ~/.config/kitty/themes/$choice ~/.config/kitty/theme.conf

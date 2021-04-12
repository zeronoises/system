#!/bin/bash

grep bind /mnt/Gog/repos/system/spectrwm.conf | tail -n +3 | sed 's/.....//;s/\]//' | column -t | dmenu -fn 'Droid Sans Mono-14' -sb "#4586A6" -c -i -l 12 -bw 2
#!/bin/bash

tac /tmp/notification.log | dmenu -i -sb '#4586A6' -bw 2 -c -l 15 -fn "Droid Sans Mono-14" | while read noti; do sed -i "/$noti/d" /tmp/notification.log ; done
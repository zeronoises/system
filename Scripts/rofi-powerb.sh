#!/bin/bash

res=$(echo "lock|logout|reboot|shutdown" | rofi -sep "|" -dmenu -i -p 'power menu')

case $res in
lock)
    dm-tool lock
    ;;
logout)
    bspc quit
    ;;
reboot)
    systemctl reboot
    ;;
shutdown)
    systemctl poweroff
    ;;
esac

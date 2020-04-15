#!/bin/bash

res=$(echo "lock|logout|reboot|shutdown" | rofi -sep "|" -dmenu -i -p 'power menu')

case $res in
lock)
    lock_dpms
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

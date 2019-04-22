#!/bin/bash

res=$(echo "lock|logout|reboot|shutdown" | rofi -sep "|" -dmenu -i -p 'power menu')

case $res in
lock)
    /mnt/Gog/Scripts/lock_dpms.sh
    ;;
logout)
    i3-msg exit
    ;;
reboot)
    systemctl reboot
    ;;
shutdown)
    systemctl poweroff
    ;;
esac

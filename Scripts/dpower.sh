#!/bin/bash

. "${HOME}/.cache/wal/colors.sh"

    gxmessage "                                               ﰸ " -fn 'Arimo Nerd Font 20' -buttons "LockScr:100","LogOut:101","Reboot:102","PowerOff:103","Cancel:104" -default "Cancel" -bg $color6 -fg $color7
    case $? in
    100) sflock -h -d
        sleep 5 &&
        xset dpms force off
        ;;
    101) killall spectrwm || qtile cmd-obj -o cmd -f shutdown
        ;;
    102) systemctl reboot
        ;;
    103) systemctl poweroff
        ;;
    104) exit 0
        ;;
    *) exit 0
        ;;
    esac
    exit 0

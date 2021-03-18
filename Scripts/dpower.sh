#!/bin/bash

    choice=$(printf "LockScreen\nKillX\nLogOut\nReBoot\nPowerOff" | dmenu -p Power -i -sb '#4586A6' -fn "Droid Sans Mono-14")
    case "$choice" in
    LockScreen) slock  
        ;;
    KillX) pkill -15 -t tty"$XDG_VTNR" Xorg
        ;;
    LogOut) loginctl terminate-session ${XDG_SESSION_ID-}
        ;;
    ReBoot) systemctl reboot
        ;;
    PowerOff) systemctl poweroff
        ;;
    esac
    exit 0

#!/bin/bash

    gxmessage "              戀                                        ﰸ" -fn 'NotoSans Nerd Font 24' -buttons "LockScr:100","KillX:101","LogOut:102","Reboot:103","PowerOff:104","Cancel:105" -default "Cancel"
    case $? in
    100) slock  
        ;;
    101) pkill -15 -t tty"$XDG_VTNR" Xorg
        ;;
    102) loginctl terminate-session ${XDG_SESSION_ID-}
        ;;
    103) systemctl reboot
        ;;
    104) systemctl poweroff
        ;;
    105) exit 0
        ;;
    *) exit 0
        ;;
    esac
    exit 0




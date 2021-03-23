#!/bin/bash

    gxmessage "                                            ﰸ" -fn 'NotoSans Nerd Font 24' -buttons "LockScr:100","LogOut:101","Reboot:102","PowerOff:103","Cancel:104" -default "Cancel" -bg red
    case $? in
    100) slock  
        ;;
    101) loginctl terminate-session ${XDG_SESSION_ID-}
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

#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

picom -b --experimental-backend &
xmodmap ~/.Xmodmap
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
soundcard2
dpms_off
xdotool key --clearmodifiers Num_Lock
dunst &
udiskie &
dropbox &
clipmenud &
sh /home/zero/.fehbg &
exec spectrwm

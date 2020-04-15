#!/bin/bash

xpad_index=7
xpad_name=Xpad

desk=$(wmctrl -lx | grep $1 | awk '{print $2;}')
node_id=$(wmctrl -lx | grep $1 | awk '{print $1;}')

if [ ! $desk -eq $xpad_index ] ; then
	bspc node $node_id -d $xpad_name
else
	bspc node $node_id -d focused
fi

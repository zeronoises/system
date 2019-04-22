#!/bin/bash

notify-send -i gtk-harddisk -h string:fgcolor:#FFFFFF "$1" "$(df -h -l --output=size,used,avail $1)"

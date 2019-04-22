#!/bin/bash

revert() {
    xset s off -dpms
}
trap revert HUP INT TERM
xset +dpms dpms 300 300 300
/mnt/Gog/Scripts/fancylock.sh -n -b=0x6
revert

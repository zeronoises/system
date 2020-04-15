#!/bin/bash

revert() {
    xset s off -dpms
}
trap revert HUP INT TERM
xset +dpms dpms 300 300 300
physlock -p DISCORDIA
revert

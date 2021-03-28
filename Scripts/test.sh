#!/bin/bash


while true; do

if ps aux | grep scrcpy > /dev/null
then
    continue
elseif
    lsusb | grep Spreadtrum
then
    scrcpy
else
    continue
fi
    sleep 10
done

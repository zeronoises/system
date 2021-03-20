#!/bin/bash

killal dunst
dunst &
notify-send "Test message" "critical test" -u critical
sleep 2
notify-send "Test message" "normal test" -u normal
sleep 2
notify-send "Test message" "low test" -u low



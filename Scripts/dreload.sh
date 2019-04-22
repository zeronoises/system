#!/bin/bash

pkill dunst
dunst -config ~/.config/dunst/dunstrc &

notify-send -u critical "Test message: critical test 1"
notify-send -u critical "Test message: critical test 2"
notify-send -u critical "Test message: critical test 3"
notify-send -u normal "Test message: normal test 1"
notify-send -u normal "Test message: normal test 2"
notify-send -u normal "Test message: normal test 3"
notify-send -u low "Test message: low test 1"
notify-send -u low "Test message: low test 2"
notify-send -u low "Test message: low test 3"

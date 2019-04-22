#!/bin/bash

notify-send -h string:fgcolor:#FFFFFF "CPU Usage" "$(ps -eo comm,%cpu --sort=-%cpu | head -n 6)"

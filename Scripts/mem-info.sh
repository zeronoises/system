#!/bin/bash

notify-send -h string:fgcolor:#FFFFFF "Memory Usage" "$(ps -eo comm,%mem --sort=-%mem | head -n 6)"

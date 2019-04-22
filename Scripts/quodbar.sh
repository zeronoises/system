#!/bin/bash

case "$BLOCK_BUTTON" in
1)
    quodlibet --play-pause
    ;;
3)
    quodlibet --toggle-window
    ;;
8)
    quodlibet --force-previous
    ;;
9)
    quodlibet --next
    ;;
*) ;;
esac

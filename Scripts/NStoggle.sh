#!/bin/bash

if xdotool search --onlyvisible --name "NetSpeed"; then
        i3-msg [title="NetSpeed"] move scratchpad
else
        i3-msg [title="NetSpeed"] move position mouse, resize set 600 350
        i3-msg [title="NetSpeed"] move down 30
fi

#!/bin/bash

# If xkill is running, it will be killed,
# otherwise chosen application can be killed.

# The advantage is that you can map a key-combo
# and can disable killing hitting it again.
if pidof xkill >/dev/null 2>&1; then
	killall xkill
else
	xkill
fi

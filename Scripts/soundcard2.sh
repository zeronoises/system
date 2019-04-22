#!/bin/bash

alsa_in -j "Decks" -d hw:CODEC 2>&1 1>/dev/null &
alsa_out -j "Monitor" -d hw:CODEC 2>&1 1>/dev/null &

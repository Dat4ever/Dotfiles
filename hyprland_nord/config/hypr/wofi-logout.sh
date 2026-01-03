#!/usr/bin/env bash

chosen=$(printf "Yes\nNo" | \
wofi --dmenu \
     --width 300 \
     --height 800 \
     --lines 2 \
     --prompt "logout?" \
     --allow-markup)

[[ "$chosen" == "Yes" ]] && hyprctl dispatch exit

#!/usr/bin/env bash

# Sources:
# Drivers and config help
# https://github.com/DIGImend/digimend-kernel-drivers#configuring-wacom-xorg-driver
# Reddit Kamvas 13 user
# https://www.reddit.com/r/huion/comments/hiz1u6/my_experience_with_the_kamvas_13_2020_on_linux/
# SO post with boostrap code
# https://askubuntu.com/questions/839161/limit-a-graphics-tablet-to-one-monitor


#Change DVI-I-1 to what monitor you want from running command: xrandr
MONITOR="DP-1"
MONITOR_MAIN="HDMI-0" # Get with xrandr
PAD_NAME="Tablet Monitor Pad pad"
ID_MOUSE=`xinput | grep "G305.*pointer" | cut -f 2 | cut -c 4-5`
ID_STYLUS=`xinput | grep "stylus" | cut -f 2 | cut -c 4-5`

xsetwacom --set "$PAD_NAME" Button 1 "key +ctrl +z -z -ctrl"
xsetwacom --set "$PAD_NAME" Button 2 "key e"
xsetwacom --set "$PAD_NAME" Button 3 "key f"

xsetwacom --set "$PAD_NAME" Button 8 "key shift"
xsetwacom --set "$PAD_NAME" Button 9 "key ctrl"

xsetwacom --set "$PAD_NAME" Button 10 "key x"
xsetwacom --set "$PAD_NAME" Button 11 "key y"
xsetwacom --set "$PAD_NAME" Button 12 "key z"

# Fix the monitors for mouse and stylus
xinput map-to-output $ID_STYLUS $MONITOR
xinput map-to-output $ID_MOUSE $MONITOR_MAIN

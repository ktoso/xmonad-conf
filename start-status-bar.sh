#!/bin/bash

myDzenStyle = " -bg '#000' -fg '#FFFFFF'"

dp4_connected=`xrandr| grep 'DP-4 connected' | wc -l`

if [[ $dp4_connected -eq '1' ]]
then
  conky -c /home/ktoso/.xmonad/.conky_dzen | dzen2  -y '0' -h '24' -ta r -xs 3 $myDzenStyle
fi


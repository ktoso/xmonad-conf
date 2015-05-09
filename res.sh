#!/bin/bash
#Author:  Travis Gibson
#This script requires an argument for the resolution width
#Thanks go out to eCharles for a patch in the comments of this link here: http://blog.echarles.net/2013/10/01/Ubuntu-13.04-On-MacbookPro-Retina
if [ -z "$1" ]; then
	echo "Usage: Res.sh <resolution_width>";
	exit 1;
fi
erg=$( echo "$1")
check=$(xrandr -q | grep DP-2 | cut -d " " -f 4 | cut -d "x" -f 1)
if [ "$erg" -eq  "$check" ]; then
	echo "The screen is already at this resolution"
	exit 1;	
fi

resolution=$(xrandr -q | grep DP-2 | cut -d " " -f 3);

if [ "$resolution" != "2880x1800+0+0" ]; then 
	xrandr --output DP-2 --scale 1x1;
#Necessary to work around an issue where re-scaling 
#only works if the scale is set to 1x1
	sleep 3;
fi
scale_w=$(echo "scale=4; $1/2880" | bc; exit );
arg=$(echo "$scale_w""x""$scale_w")
xrandr --output DP-2 --scale $arg
sleep 1;
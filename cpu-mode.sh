#!/bin/sh
# docs about cpufreq governors https://www.kernel.org/doc/Documentation/cpu-freq/governors.txt

speed0=$((`cpufreq-info -f -c0` / 1000))
speed1=$((`cpufreq-info -f -c1` / 1000))
speed2=$((`cpufreq-info -f -c2` / 1000))
speed3=$((`cpufreq-info -f -c3` / 1000))

current=` cpufreq-info  | grep 'The gov' | head -n1 | awk '{print $3}' | sed 's/"//g'`
all_governors=`cpufreq-info -g | sed 's/ /\n/g'`
governors=`echo "$all_governors" | sed "s/$current/[$current]/g"`


echo $cpuSpeeds
echo $governors

selected=`echo "${speed0} MHz | ${speed1} MHz | ${speed2} MHz | ${speed3} MHz\n$governors" | dmenu`

echo $selected

case "$selected" in
"conservative" | "ondemand" | "userspace" | "powersave" | "performance")
  kdesudo "cpufreq-set -g $selected"
  kdialog --msgbox "CPU freq governor is now: $selected"
  ;;
esac

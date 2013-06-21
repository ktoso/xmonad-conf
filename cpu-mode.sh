#!/bin/sh
# docs about cpufreq governors https://www.kernel.org/doc/Documentation/cpu-freq/governors.txt

speed0=`cpufreq-info -f -c0`
speed1=`cpufreq-info -f -c1`
speed2=`cpufreq-info -f -c2`
speed3=`cpufreq-info -f -c3`

governors=`cpufreq-info -g`

echo $cpuSpeeds
echo "Governors: $governors"

dialog --nocancel \
  --title "Select CPU Freq Scaling Governor" \
  --menu "Current: $speed0 / $speed1 / $speed2 / $speed3 [MHz]" 20 60 14 \
  Conservative "Scale CPU freq. slowly adjusting to load level [recommended]" \
  Batterysave "Keep processors at 800 MHz, always." \
  Performance "Keep processors at 2 GHz, always."
#  Userspace "Allow user apps to use `scaling set speet` C level calls" \
#  Ondemand "Aggressively adjust CPU freq - not recommended for laptops" \


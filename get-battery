#!/bin/bash

# get-volume script returns the percantage of battery load
all=`acpi -b`
stat=`echo $all | head -n1 | awk '{print $4-0}';`

if [[ "$all" == *Discharging* ]] ; then
  echo "-$stat%"
else
  if [[ "$stat" == '100' ]]; then
    echo "=$stat%"
  else
    echo "+$stat%"
  fi
fi

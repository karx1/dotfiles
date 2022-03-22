#!/bin/sh
if [ $(bluetoothctl show | grep "Powered: yes" | wc -c) -eq 0 ]
then
  echo -e "%{F#66ffffff}\uf293"
else
  if [ $(echo info | bluetoothctl | grep 'Device' | wc -c) -eq 0 ]
  then 
    echo -e "\uf293"
  fi
  echo -e "%{F#81a1c1}\uf293"
fi


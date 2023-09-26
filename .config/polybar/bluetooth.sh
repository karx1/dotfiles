#!/bin/sh

if [ $(bluetoothctl show | grep "Powered: yes" | wc -c) -eq 0 ]
then
  echo -e "%{F#66ffffff}\uf293"
elif [ $(echo info | bluetoothctl | grep 'DeviceSet' | wc -c) -eq 0 ]
    then
      BAT=$(bluetoothctl info | grep Percentage | cut -d":" -f 2 | cut -d"(" -f 2 | sed 's/)/%/' | sed 's/^/ /')
      ALIAS=$(bluetoothctl info | grep Alias | cut -d":" -f 2 | xargs echo -n)
      echo -e "%{F#81a1c1}\uf293%{F#ffffff}$BAT ($ALIAS)"
else
    echo -e "\uf293"
fi


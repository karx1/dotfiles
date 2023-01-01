#!/bin/sh


checkIfRunning() {
  if [ $(systemctl --user is-active redshift) == "active" ]; then
    return 0
  else
    return 1
  fi
}

changeModeToggle() {

  if checkIfRunning ; then
    systemctl --user stop redshift
  else
    systemctl --user start redshift
  fi
}



case $1 in 
  toggle)
  changeModeToggle
    ;;
  period)
    if checkIfRunning ; then
      CURRENT_PERIOD=$(systemctl --user status redshift 2> /dev/null  | grep "Period" | sed 's/.*: //')
      echo "$CURRENT_PERIOD"
    else
      echo "off"
    fi
    ;;
esac

#!/sbin/python

import os
import math
from time import strftime
from time import gmtime

def ex(cmd):
    # conf: change this player
    player = "spotify"
    line = "playerctl -p " + player + " " + cmd

    return os.popen(line).read().strip()

status = ex("status 2>&1")
if status == "No players found":
    print("")
    exit(0)
duration = ex("metadata mpris:length")
position = ex("position")

duration = float(duration) / 1000000
position = float(position)
percentage = (position / duration) * 100
bars = math.ceil(percentage / 10)

duration = strftime("%-M:%S", gmtime(duration))
position = strftime("%-M:%S", gmtime(position))
print("|" + "=" * bars + "-" * (10 - bars) + "|", end=" ")
print(position + " / " + duration)

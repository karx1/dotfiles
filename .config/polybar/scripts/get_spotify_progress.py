#!/sbin/python

import os
import math
from time import strftime
from time import gmtime

beginning_bar = "\u2502"
block = "\u2588"
dash = "\u2500"
end_bar = "\u2524"

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
bars = math.floor(percentage / 10)

if bars == 0:
    beginning_bar = "\u251c"

if bars == 10:
    end_bar = beginning_bar

duration = strftime("%-M:%S", gmtime(duration))
position = strftime("%-M:%S", gmtime(position))
print(beginning_bar + block * bars + dash * (10 - bars) + end_bar, end=" ")
print(position + " / " + duration)

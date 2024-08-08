#!/bin/bash

DISK=/dev/nvme0n1p3
df -h $DISK | awk '/^\/dev\/sd[ab]/ { sum+=$5 } END { print sum }' | sed -e "s/$/%/"

#!/bin/bash

choice=$(echo -e "mirror\nextend" | dmenu -i -l 20 -fn Monospace-18)
/home/felix/.scripts/monitor-output/monitor-output $choice

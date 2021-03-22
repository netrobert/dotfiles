#!/bin/sh

# A dwm_bar function to show free memory in GB
# Robert Štojs <robert.stojs@posteo.net>
# GNU GPLv3

# Dependencies: alsa-utils

dwm_mem () {
    MEM=$(free -h | grep '^Mem' | awk '{print "MEM: "$3}' | tr "i" " ")
}

dwm_mem

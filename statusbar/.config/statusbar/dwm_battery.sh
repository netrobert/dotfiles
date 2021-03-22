#!/bin/sh

# A dwm_bar function to show the battery level
# Robert Štojs <robert.stojs@posteo.net>
# GNU GPLv3

# Dependencies: alsa-utils

dwm_bat() {
    BAT=$(acpi | awk '{print "BAT: "$4}' | tr "," " ")
}

dwm_bat

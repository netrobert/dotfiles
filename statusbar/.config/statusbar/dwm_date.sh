#!/bin/sh

# A dwm_bar function to show the date
# Robert Štojs <robert.stojs@posteo.net>
# GNU GPLv3

# Dependencies: alsa-utils

dwm_date () {
    DATE=$(/bin/date +"%a %b %d %H:%M")
}

dwm_date

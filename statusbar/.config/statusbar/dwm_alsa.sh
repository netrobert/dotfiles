#!/bin/sh

# A dwm_bar function to show the master volume of ALSA
# Robert Štojs <robert.stojs@posteo.net>
# GNU GPLv3

# Dependencies: alsa-utils

dwm_alsa () {
	STATUS=$(amixer sget Master | tail -n1 | sed -r "s/.*\[(.*)\]/\1/")
    VOLUME=$( amixer sget Master | grep -e 'Front Left:' | \
    sed 's/[^\[]*\[\([0-9]\{1,3\}%\).*\(on\|off\).*/\2 \1/' | sed 's/off/M/' | sed 's/on //' )
}

dwm_alsa

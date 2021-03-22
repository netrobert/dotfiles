#!/bin/sh

# A modular status bar for dwm
# Robert Štojs <robert.stojs@posteo.net>
# GNU GPLv3

# Dependencies: xorg-xsetroot

# Import functions with "$include /route/to/module"
# It is recommended that you place functions in the subdirectory ./bar-functions and use: . "$DIR/bar-functions/dwm_example.sh"

# Store the directory the script is running from
LOC=$(readlink -f "$0")
DIR=$(dirname "$LOC")

# Change the appearance of the module identifier. if this is set to "unicode", then symbols will be used as identifiers instead of text. E.g. [📪 0] instead of [MAIL 0].
# Requires a font with adequate unicode character support
export IDENTIFIER="unicode"

# Change the charachter(s) used to seperate modules. If two are used, they will be placed at the start and end.

# Import the modules
. "$DIR/dwm_battery.sh"
. "$DIR/dwm_alsa.sh"
. "$DIR/dwm_date.sh"
. "$DIR/dwm_connman.sh"
. "$DIR/dwm_mem.sh"

parallelize() {
    while true
    do
        printf "Running parallel processes\n"
        dwm_connman
        sleep 5
    done
}
parallelize &

# Update dwm status bar every second
while true
do
    # Append results of each func one by one to a string
    dispstr=""
    dispstr="$dispstr$(dwm_battery)"
    dispstr="$dispstr$(dwm_alsa)"
    dispstr="$dispstr$(dwm_mem)"
    dispstr="$dispstr$(dwm_connman)"
    dispstr="$dispstr$(dwm_date)"

    xsetroot -name "$dispstr"
    sleep 1
done

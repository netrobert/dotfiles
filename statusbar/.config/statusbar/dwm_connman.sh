#!/bin/sh

# A dwm_bar function to show the current network connection/SSID using connman
# Robert Štojs <robert.stojs@posteo.net>
# GNU GPLv3

# Dependencies: connman

dwm_connman () {
    SERVICENAME=$(connmanctl services | grep -E "^\*AO|^\*O" | grep -Eo 'wifi_.*|ethernet_.*')

    if [ ! "$SERVICENAME" ]; then
        printf "OFFLINE"
        return
    else
        STRENGTH=$(connmanctl services "$SERVICENAME" | sed -n -e 's/Strength =//p' | tr -d ' ')
        CONNAME=$(connmanctl services "$SERVICENAME" | sed -n -e 's/Name =//p' | tr -d ' ')
    fi
}

dwm_connman

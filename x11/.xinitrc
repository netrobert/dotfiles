setxkbmap -layout si
setxkbmap -option ctrl:nocaps
xrdb -load ~/.Xresources
xbindkeys &
emacs --daemon

#Statusbar loop
#while true; do
# 	xsetroot -name "$( date +"%F %R" )"
# 	sleep 1m
#done&

# Statusbar loop
while true; do
	BATT=$(acpi | awk '{print $4}' | tr "," " ")
	DATE=$(/bin/date +"%a %b %d %H:%M")
	ROOT="$BATT $DATE"
	#echo $ROOT
	xsetroot -name "$ROOT"
	sleep 1m
done&

#exec /home/robert/bin/startdwm
exec dwm

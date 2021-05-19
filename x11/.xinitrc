setxkbmap -layout si
setxkbmap -option ctrl:nocaps
xrdb -load ~/.Xresources
xbindkeys &
emacs --daemon
xautolock -time 10 -locker slock &

#Statusbar loop
#while true; do
# 	xsetroot -name "$( date +"%F %R" )"
# 	sleep 1m
#done&

# Statusbar loop
while true; do
	BATT=$(acpi | awk '{print "BATT: "$4}' | tr "," " ")
    MEM=$(free -h | grep '^Mem' | awk '{print "MEM: "$3}' | tr "i" " ")
	DATE=$(/bin/date +"%a %b %d %H:%M")
	ROOT="$BATT $MEM$DATE"
	#echo $ROOT
	xsetroot -name "$ROOT"
	sleep 20
done&

# Wallpaper loop
while true; do
    feh --bg-fill ~/dotfiles/wallpaper/wallpaper4.jpg
	sleep 30
done&

feh --bg-fill ~/dotfiles/wallpaper/wallpaper4.jpg

#exec /home/robert/bin/startdwm
picom &
exec dwm

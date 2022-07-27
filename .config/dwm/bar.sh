#!/bin/bash

while true; do

	playing=$(pgrep spotify >/dev/null && playerctl metadata -f '{{ artist }} - {{ title }} | ' -p spotify)
	# playing=$(pgrep amberol >/dev/null && playerctl metadata -f ' {{ artist }} - {{ title }} | ' -p io.bassi.Amberol)
	date=$(date '+%H:%M %d.%m')
	usedmem=$(free -h --si | awk '(NR==2){ print $3 }')
	# totalmem=$(free -h --si | awk '(NR==2){ print $2 }')
	# cpu="CPU $(sed 's/000$/°C/' /sys/class/thermal/thermal_zone4/temp) |"
	unset cpu
	[ "$(sed 's/000$//' /sys/class/thermal/thermal_zone0/temp)" -ge 50 ] && cpu="CPU HOT ($(sed 's/000$/°C/' /sys/class/thermal/thermal_zone0/temp)) | "
	# battery=$(cat /sys/class/power_supply/BAT0/capacity || echo no battery ; echo '% battery')
	# battery=$(cat /sys/class/power_supply/BAT0/capacity || echo no battery ; cat /sys/class/power_supply/BAT0/capacity && echo % battery)
	#battery0=$(cat /sys/class/power_supply/BAT0/capacity && printf '% battery | ')
	#battery1=$(cat /sys/class/power_supply/BAT1/capacity && printf '% battery | ')

	xsetroot -name "$cpu$playing$date | $(~/.config/dwm/battery.sh) | $usedmem used"
	#xsetroot -name "$playing $date | $battery0$battery1$usedmem used"
	sleep 1s

done

# while true; do

# 	playing=$(pgrep spotify >/dev/null && playerctl metadata -f '{{ artist }} - {{ title }} |' -p spotify)
# 	sleep 10s

# done &

# while true; do

# 	ram=$(free -h --si | awk '(NR==2){ print $3 }')
# 	sleep 5s



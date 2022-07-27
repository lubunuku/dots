#!/bin/dash

# Prints all batteries, their percentage remaining and an emoji corresponding
# to charge status (🔌 for plugged up, 🔋 for discharging on battery, etc.).

# case $BLOCK_BUTTON in
# 	3) notify-send "🔋 Battery module" "🔋: discharging
# 🛑: not charging
# ♻: stagnant charge
# 🔌: charging
# ⚡: charged
# ❗: battery very low!
# - Scroll to change adjust xbacklight." ;;
# 	4) xbacklight -inc 10 ;;
# 	5) xbacklight -dec 10 ;;
# 	6) "$TERMINAL" -e "$EDITOR" "$0" ;;
# esac

# Loop through all attached batteries and format the info
for battery in /sys/class/power_supply/BAT?*; do
	# If non-first battery, print a space separator.
	[ -n "${capacity+x}" ] && printf " "
	# Sets up the status and capacity
	case "$(cat "$battery/status" 2>&1)" in
		"Full") status="" ;;
		"Discharging") status=" " ;;
		# "Charging") status="⚡ " ;;
		"Charging") status="ﮣ " ;;
		"Not charging") status=" " ;;
		# "Not charging") status=" " ;;
		# "Not charging") status=" " ;;
		"Unknown") status="?" ;;
		*) exit 1 ;;
	esac
	capacity="$(cat "$battery/capacity" 2>&1)"
	# Will make a warn variable if dscharging and low
	# [ "$(cat $battery/status 2>&1)" = "Discharging" ] && [ "$capacity" -le 20 ] && warn="BATTERY LOW "
	# Low battery notification
	# [ "$(cat $battery/status 2>&1)" = "Discharging" ] && [ "$capacity" -le 20 ] && dunstify -r 420 -u critical -i battery-low -t 1000 "battery $(cat $battery/hwmon2/name) is low"
	# [ "$(cat $battery/status 2>&1)" = "Discharging" ] && [ "$capacity" -le 10 ] && dunstify -r 420 -u critical -i battery-low -t 1000 "battery $(cat $battery/hwmon2/name) is very low" "laptop may shut down automatically"
	# Prints the info
	printf "%s%s%d%%" "$status" "$warn" "$capacity"; unset warn
done && printf "\\n"

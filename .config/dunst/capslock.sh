sleep 0.15;        
if [[ $(xset q | grep -oE "00: Caps Lock:[ ]{1,20}o[fn]{1,2}" | grep -oE "o[fn]{1,2}") == "on" ]]; then
# dunstify -i ~/.local/share/icons/Papirus-Dark/16x16/devices/keyboard.svg -t 1000 -u low -r 69 "Caps Lock" "On"
dunstify -r 69 -t 99999 -u low "Caps Lock" "On"
sudo leds mic on
else
# dunstify -i ~/.local/share/icons/Papirus-Dark/16x16/devices/keyboard.svg -t 1000 -u low -r 69 "Caps Lock" "Off";
dunstify -r 69 -t 500 -u low "Caps Lock" "Off"
sudo leds mic off
fi

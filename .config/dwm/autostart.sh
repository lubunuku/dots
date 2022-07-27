#!/bin/dash

killall dunst
dunst &

killall sxhkd
sxhkd &> /dev/null &

pgrep clipnotify || CM_SELECTIONS=clipboard clipmenud &

picom --experimental-backend &

# killall volumeicon
# volumeicon &
pgrep volumeicon || volumeicon &

# killall nm-applet
# nm-applet &
pgrep nm-applet || nm-applet &

# nitrogen --restore
# setwall --restore
~/.fehbg

# killall xfce-polkit
# /usr/lib/xfce-polkit/xfce-polkit &
pgrep xfce-polkit || /usr/lib/xfce-polkit/xfce-polkit &

# pgrep openrgb || openrgb --startminimized -p off &

# killall unclutter
# unclutter -b --timeout 8 &
pgrep unclutter || unclutter -b --timeout 8 &

# brightnessctl s 0
xset r rate 300 50
xset s off -dpms
setxkbmap pl
# xrandr --output HDMI2 --mode 1920x1080 --rate 144
setxkbmap -option caps:super
killall xcape 2>/dev/null ; xcape -e 'Super_L=Escape'
xset -q | grep "Caps Lock:\s*on" && xdotool key Caps_Lock
pgrep xss-lock || xss-lock -- physlock &

sudo leds mic off

# killall xfce4-power-manager
# xfce4-power-manager &

killall fusuma
/home/lubunuku/.local/share/gem/ruby/3.0.0/bin/fusuma &

# killall xclickroot
# xclickroot -r ~/.local/bin/powermenu &
# pgrep xclickroot || xclickroot -r ~/.local/bin/powermenu &

# killall conky
# conky -c ~/.config/conky/conky-day

pkill bar.sh
~/.config/dwm/bar.sh &

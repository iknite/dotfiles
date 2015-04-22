#! /bin/bash

xrandr | awk '/^DP1 connected/ {print $1}' | xargs -i xrandr --output {} --auto --right-of 'eDP1'

feh --bg-scale ~/Pictures/tokyo-27070-3840x2160.jpg

setxkbmap -rules evdev -model evdev -layout us -variant altgr-intl

if [ -s ~/.Xmodmap ]; then 
    xmodmap ~/.Xmodmap
fi

exec i3

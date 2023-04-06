#!/bin/sh
# ---------------------------------------------
#  infoengine1337 UhuruOS i3wm edition
#  polybar launch script for i3wm
#
#  Watasuke
#  Known As: @Watasuke102
#  Email  : Watasuke102@gmail.com
#
#  (c) 1998-2140 team-silencesuzuka
# ---------------------------------------------

killall -q polybar

while pgrep -u $UID -x polybar >/dev/null
	do sleep 1
done

polybar -c ~/.config/polybar/config.ini main &

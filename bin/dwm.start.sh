#!/usr/bin/env bash

#source $HOME/.fehbg

unclutter -root -idle 1 &
xset r rate 250 60

while true; do
	memfreak2=`grep MemFree /proc/meminfo | awk '{ print $2 }'`;
	mem=$((memfreak2 / 1024));
	date=$(date '+%d %b %Y');
	time=$(date '+%H:%M');
	xsetroot -solid darkgrey -name "Mem: $mem MB | D: $date | T: $time"
#	xsetroot -name "Mem: $mem MB | D: $date | T: $time"
	sleep 10
done &

sleep 1

exec $HOME/pkgs/dwm.git/dwm


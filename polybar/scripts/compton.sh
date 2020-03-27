#!/bin/sh

# https://github.com/jaagr/polybar/wiki/User-contributed-modules

if pgrep -x "compton" > /dev/null
then
	echo "ON" #Green
else
	echo "OFF" #Gray
fi

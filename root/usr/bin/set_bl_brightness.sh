#!/bin/bash

if [ -f /sys/class/leds/background/brightness ]
then
	echo $1 > /sys/class/leds/background/brightness
fi

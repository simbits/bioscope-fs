#!/bin/bash

if [ -f /sys/class/leds/background/brightness ]
then
	echo 0 > /sys/class/leds/background/brightness
	sleep 5
fi

if lsmod | grep -q adp8860_bl
then
	rmmod adp8860_bl
fi

if [ -f /sys/class/gpio/gpio23/value ]
then
	echo "0" > /sys/class/gpio/gpio23/value
fi


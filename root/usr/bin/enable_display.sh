#!/bin/bash

if [ ! -d /sys/class/gpio/gpio23 ]
then
	echo "23" > /sys/class/gpio/export
	echo "out" > /sys/class/gpio/gpio23/direction
fi

if lsmod | grep -q adp8860_bl 
then
	rmmod adp8860_bl
fi

if [ -f /sys/class/gpio/gpio23/value ]
then
	echo "1" > /sys/class/gpio/gpio23/value
	modprobe adp8860_bl

#	sleep 1

	if [ -f /sys/class/leds/background/brightness ]
	then
		echo $1 > /sys/class/leds/background/brightness
	fi
fi

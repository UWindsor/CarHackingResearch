#!/bin/bash

sudo ip link set can0 down

#Change the bitrate according to your vehicle
sudo ip link set can0 up type can bitrate 500000

time=$(date +"%FT%H%M%SDodge")

#The timoput value is the amount of time in seconds that you will record the data for, currently set to 60 seconds.
timeout 60 candump can0 > /home/debian/scripts/$time.log

#appends the current time to to the end of the log to double check the timeout period
date +"%FT%H%M%S" >> /home/debian/scripts/$time.log

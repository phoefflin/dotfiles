#!/bin/sh

gov=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor)
echo "CPU Governor: $gov"


#!/bin/bash

echo "======== PI SYSTEM STATUS ========"
echo "IP Address:"
hostname -I
echo ""
echo "CPU Temp:"
vcgencmd measure_temp
echo ""
echo "Disk Usage:"
df -h /
echo ""
echo "Active Interfaces:"
iwconfig 2>/dev/null | grep 'IEEE'

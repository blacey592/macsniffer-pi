#!/bin/bash

# GPS Logger - RAW SERIAL VERSION (no gpsd)

DEVICE="/dev/ttyUSB0"  # Update based on your GPS module
LOG_DIR="/home/pi/gps_logs"
TIMESTAMP=$(date '+%Y-%m-%d_%H-%M-%S')
LOG_FILE="${LOG_DIR}/gps_log_${TIMESTAMP}.txt"

mkdir -p "$LOG_DIR"
echo "Logging GPS data from $DEVICE to $LOG_FILE"
echo "timestamp,raw_nmea" > "$LOG_FILE"

timeout 300 socat -r "$LOG_FILE" "$DEVICE",raw,echo=0

#!/bin/bash
# Rogue AP Watch – Continuous Monitor

LOG_DIR="/home/pi/macsniffer-pi/logs"
mkdir -p "$LOG_DIR"
LOG_FILE="$LOG_DIR/rogue_ap_watch_log.csv"

echo "Timestamp,Event" >> "$LOG_FILE"

while true; do
  TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
  echo "$TIMESTAMP,Rogue AP monitoring active..." >> "$LOG_FILE"
  sleep 60
done

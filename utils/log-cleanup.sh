#!/bin/bash

LOG_DIRS=("/home/pi/sniffer_logs" "/home/pi/bluetooth_logs" "/home/pi/gps_logs")

for dir in "${LOG_DIRS[@]}"; do
    if [ -d "$dir" ]; then
        find "$dir" -type f -mtime +7 -exec rm {} \;
    fi
done

echo "Old logs removed (older than 7 days)."

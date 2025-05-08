#!/bin/bash

LOG_DIR="/home/pi/bluetooth_logs"
TIMESTAMP=$(date '+%Y-%m-%d_%H-%M-%S')
LOG_FILE="${LOG_DIR}/bt_log_${TIMESTAMP}.csv"

# Create log directory if it doesn't exist
mkdir -p "$LOG_DIR"

# Header
echo "timestamp,mac_address,device_name" > "$LOG_FILE"

# Start scanning
for i in {1..10}; do
    echo "Scan $i/10..."
    NOW=$(date '+%Y-%m-%d %H:%M:%S')
    # Run bluetoothctl scan for 5 seconds and parse devices
    bluetoothctl --timeout 5 scan on | grep "Device" | while read -r line; do
        MAC=$(echo "$line" | awk '{print $2}')
        NAME=$(echo "$line" | cut -d ' ' -f 3-)
        echo "$NOW,$MAC,$NAME" >> "$LOG_FILE"
        echo "$NOW $MAC $NAME"
    done
    sleep 30
done

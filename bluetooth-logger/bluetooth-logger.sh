#!/bin/bash

LOG_DIR="/home/pi/bluetooth_logs"
TIMESTAMP=$(date '+%Y-%m-%d_%H-%M-%S')
LOG_FILE="${LOG_DIR}/bt_log_${TIMESTAMP}.csv"

mkdir -p "$LOG_DIR"

# Header
echo "timestamp,device_name,mac_address,signal_strength,rssi_class" > "$LOG_FILE"

# Start scanning
timeout 300 bluetoothctl scan on &

# Parse Bluetooth scan output
timeout 300 stdbuf -oL hcitool lescan --duplicates | while read -r line; do
    NOW=$(date '+%Y-%m-%d %H:%M:%S')
    MAC=$(echo "$line" | awk '{print $1}')
    NAME=$(echo "$line" | cut -d ' ' -f 2-)
    RSSI=$(hcitool rssi "$MAC" 2>/dev/null | grep -oP 'RSSI return value: \K-?[0-9]+')

    if [ -z "$RSSI" ]; then
        continue
    fi

    # Classify signal strength
    if [ "$RSSI" -gt -60 ]; then
        RANGE="STRONG"
    elif [ "$RSSI" -gt -75 ]; then
        RANGE="MEDIUM"
    else
        RANGE="WEAK"
    fi

    echo "$NOW,$NAME,$MAC,$RSSI,$RANGE" >> "$LOG_FILE"
    echo "$NOW $NAME $MAC $RSSI $RANGE"
done

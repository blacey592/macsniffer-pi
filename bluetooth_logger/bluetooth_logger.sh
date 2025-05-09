#!/bin/bash

# Bluetooth Proximity Logger

LOG_DIR="$HOME/bluetooth_logs"
mkdir -p "$LOG_DIR"
DATESTAMP=$(date "+%Y-%m-%d_%H-%M-%S")
LOG_FILE="$LOG_DIR/bt_log_$DATESTAMP.csv"

echo "Timestamp,MAC,Name,RSSI_dBm" > "$LOG_FILE"

echo "[+] Scanning for nearby Bluetooth devices. Press CTRL+C to stop."

# Main loop
while true; do
    SCAN_OUTPUT=$(timeout 10s hcitool scan 2>/dev/null)
    while read -r line; do
        if [[ "$line" =~ ^([[:xdigit:]:]{17})[[:space:]]+(.+)$ ]]; then
            MAC="${BASH_REMATCH[1]}"
            NAME="${BASH_REMATCH[2]}"
            RSSI=$(hcitool rssi "$MAC" 2>/dev/null | awk '{print $NF}')
            [[ "$RSSI" == *"error"* || -z "$RSSI" ]] && RSSI="N/A"
            TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
            echo "$TIMESTAMP,$MAC,$NAME,$RSSI" >> "$LOG_FILE"
            echo "[+] Detected: $MAC ($NAME) RSSI=$RSSI"
        fi
    done <<< "$SCAN_OUTPUT"
done

#!/bin/bash

# Set up variables
INTERFACE="wlan1mon"
LOG_DIR="/home/pi/sniffer_logs"
TIMESTAMP=$(date '+%Y-%m-%d_%H-%M-%S')
LOG_FILE="${LOG_DIR}/sniff_log_${TIMESTAMP}.csv"

# Create log directory if missing
mkdir -p "$LOG_DIR"

# Header
echo "timestamp,mac_address,signal_strength" > "$LOG_FILE"

# Start sniffing
timeout 300 tcpdump -e -i "$INTERFACE" -l type mgt subtype probe-req | \
while read -r line; do
    MAC=$(echo "$line" | awk '{print $2}')
    RSSI=$(echo "$line" | grep -oP 'signal strength \K-?[0-9]+')
    NOW=$(date '+%Y-%m-%d %H:%M:%S')

    if [[ "$MAC" =~ ^([0-9A-Fa-f]{2}:){5}[0-9A-Fa-f]{2}$ ]]; then
        echo "$NOW,$MAC,$RSSI" >> "$LOG_FILE"
        echo "$NOW $MAC $RSSI"
    fi
done

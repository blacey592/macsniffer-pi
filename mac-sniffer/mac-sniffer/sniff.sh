#!/bin/bash

# Set up variables
INTERFACE="wlan1mon"
LOG_DIR="/home/pi/sniffer_logs"
TIMESTAMP=$(date '+%Y-%m-%d_%H-%M-%S')
LOG_FILE="${LOG_DIR}/sniff_log_${TIMESTAMP}.csv"
WATCHLIST="/home/pi/mac-sniffer/watchlist.txt"
ALERT_LOG="/home/pi/mac-sniffer/watchlist_hits.csv"

# Create log directory if missing
mkdir -p "$LOG_DIR"

# Header
echo "timestamp,mac_address,signal_strength,manufacturer" > "$LOG_FILE"
echo "timestamp,mac_address,manufacturer" > "$ALERT_LOG"

# Start sniffing
timeout 300 tcpdump -e -i "$INTERFACE" -l type mgt subtype probe-req 2>/dev/null |
while read -r line; do
    MAC=$(echo "$line" | awk '{print $2}')
    RSSI=$(echo "$line" | grep -oP 'signal strength \K-[0-9]+')
    NOW=$(date '+%Y-%m-%d %H:%M:%S')

    # Look up manufacturer
    OUI=$(echo "$MAC" | cut -c1-8 | tr '[:lower:]' '[:upper:]')
    MANUFACTURER=$(grep -i "$OUI" /usr/share/ieee-data/oui.txt | awk -F"\t" '{print $3}' | head -n 1)
    [[ -z "$MANUFACTURER" ]] && MANUFACTURER="Unknown"

    # Log MAC data
    echo "$NOW,$MAC,$RSSI,$MANUFACTURER" >> "$LOG_FILE"

    # Watchlist check
    if grep -i -q "$(echo ${MAC:0:8} | tr '[:lower:]' '[:upper:]')" "$WATCHLIST"; then
        echo "[!] WATCHLIST HIT: $MAC ($MANUFACTURER)"
        echo "$NOW,$MAC,$MANUFACTURER" >> "$ALERT_LOG"
    fi
done

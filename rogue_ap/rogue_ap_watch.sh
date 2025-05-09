#!/bin/bash

# Rogue AP Detector - Auto Scan & Log Script

LOG_DIR="$HOME/rogue_ap_logs"
mkdir -p "$LOG_DIR"
DATESTAMP=$(date "+%Y-%m-%d_%H-%M-%S")
LOG_FILE="$LOG_DIR/rogue_aps_$DATESTAMP.csv"

IFACE="wlan1"  # Replace with your external Wi-Fi adapter's interface name
sudo ip link set $IFACE down
sudo iw $IFACE set monitor control
sudo ip link set $IFACE up

echo "Timestamp,SSID,BSSID,Channel,Signal_dBm,Encryption" > "$LOG_FILE"

timeout 30s airodump-ng --output-format csv -w /tmp/rogue_scan "$IFACE" > /dev/null 2>&1

CSV_FILE="/tmp/rogue_scan-01.csv"
if [[ -f "$CSV_FILE" ]]; then
    while IFS=',' read -r BSSID FirstSeen LastSeen Channel Speed Privacy Cipher Auth Power Beacons IV LANIP IDLength ESSID Key
    do
        if [[ "$BSSID" == "BSSID" || -z "$BSSID" ]]; then continue; fi
        SIGNAL=${Power//[^0-9\-]/}
        TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
        if [[ "$Privacy" == *"WEP"* || "$Privacy" == *"OPN"* ]]; then
            echo "$TIMESTAMP,$ESSID,$BSSID,$Channel,$SIGNAL,$Privacy" >> "$LOG_FILE"
        fi
    done < "$CSV_FILE"
else
    echo "Scan failed. No CSV found."
fi

sudo ip link set $IFACE down
sudo iw $IFACE set type managed
sudo ip link set $IFACE up

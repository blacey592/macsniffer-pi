#!/bin/bash

# Scan for rogue access points

echo "Scanning for nearby access points..."
timeout 30 iwlist wlan1 scan | grep -E "Address:|ESSID|Channel|Encryption"

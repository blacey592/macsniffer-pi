# MAC Sniffer

This module captures probe request frames from nearby Wi-Fi-enabled devices.
Each detection includes:
- Timestamp (UTC or local)
- MAC address
- Signal strength (RSSI)

Use cases:
- Surveillance of high-traffic areas
- Capturing presence of known or unknown devices
- Mapping dwell times or movement patterns

Make sure to enable monitor mode on your wireless adapter before running `sniff.sh`.

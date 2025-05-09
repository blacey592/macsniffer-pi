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

## Watchlist Enhancer (MAC Sniffer Module)

This upgrade flags MAC addresses during sniffing if they appear in a custom watchlist.

### Features
- Monitors for specific MACs or manufacturer OUIs
- Logs any hits to a separate `watchlist_hits.csv`
- Can be used to flag burner phones, known targets, or suspicious activity
- Silent, passive, and field-deployable

### Watchlist File
Create this file:

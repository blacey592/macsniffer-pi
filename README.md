# MACSniffer-Pi

**Passive Surveillance Suite for Raspberry Pi 5**  
Designed for covert MAC address logging, Bluetooth device detection, rogue access point scanning, and portable USB forensics. Built for law enforcement digital investigations.

## Tools Included
- `sniff.sh` – Passive MAC address logger (Wi-Fi)
- `btlogger.sh` – Bluetooth device logger
- `rogue_ap_detector.sh` – Rogue access point scanner
- `usb_logger.sh` – USB connection logger
- `sd_cloner.sh` – Quick forensic SD card duplicator

## Deployment Setup
1. Flash provided `.img` to SD card.
2. Plug into Raspberry Pi 5 with external Wi-Fi adapter.
3. Boots headless and launches `launcher.sh` menu after 30s of inactivity.
4. Data saved to `/logs/` with timestamped subfolders.

## Field Considerations
- GPS excluded by default (concealment priority).
- Use external battery for covert ops.
- System logs locally only; no exfiltration by design.

## Disclaimer
Law enforcement use only. Ensure legal compliance with local wiretap, tracking, and privacy laws.
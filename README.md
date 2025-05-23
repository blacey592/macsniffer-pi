# MACSniffer-Pi Investigative Toolkit

A modular field intelligence suite for Raspberry Pi deployments, enabling MAC address sniffing, Bluetooth tracking, rogue AP detection, and advanced digital surveillance features.

## Core Functional Modules

**MAC and Bluetooth Tools**
- `sniff.sh`: Main MAC address sniffer script.
- `mac-sniffer-cleaner.py`: Cleans sniffed data for analysis.
- `bluetooth/bluetooth-logger.sh`: Logs nearby Bluetooth devices.

**Surveillance and Mapping Tools**
- `animated_device_tracker.py`: Animates MAC movement across time/location.
- `mac_map_trail.py`: Static trail mapping of MACs.
- `surveillance_heatmap.py`: Generates heatmaps based on MAC density.
- `surveillance_loop_monitor.py`: Continuous monitoring with alert logic.
- `tower_coverage_mapper.py`: Maps estimated cell tower coverage areas.

**Investigative Intelligence Generators**
- `case_dna_generator.py`: Generates unique digital signatures for each case.
- `timeline_synthesizer.py`: Builds investigative timelines from event logs.
- `case_report_generator.py`: Creates prefilled investigative reports.
- `intel_pulse.py`: Condensed intelligence digest from MAC/Bluetooth logs.
- `log_aggregator.py`: Central tool to combine, compress, and review logs.

**Operational Enhancements**
- `launcher-menu.sh`: GUI-free terminal launcher for tool access.
- `tactical_toolkit_menu.py`: Full Python-based menu interface.
- `pi-status.sh`: Quick check script for uptime, disk, and network health.
- `utils/sync-to-usb.sh`: Copies logs to USB for quick extraction.
- `utils/log-cleanup.sh`: Clears logs older than a threshold.

## Specialized Modules

**UC and CSAM Tools**
- `uc_csam_osint_scraper.py`: Isolated OSINT scraper for undercover profiles.
- `uc_profile_manager.py`: Creates and manages UC personas for social platforms.

**Threat and Link Analysis**
- `alias_threat_matrix.py`: Links aliases, usernames, and IDs across platforms.
- `partner_link_beacon.py`: Tracks shared MACs, IPs, or device IDs across suspects.
- `local_hashlist_tracker.py`: Locally checks hashes against known CSAM lists.

## Rogue Network Detection
- `rogue_ap/rogue_ap_watch.sh`: Scans and alerts on rogue access points.

## Event Hooks and Automation
- `usb_logger/usb_event.sh`: Detects and logs USB plug/unplug events.
- `gps-logger.sh`: Logs GPS position when connected.

## Redundancy and Cleanup Recommendations
- Duplicate scripts detected: `sniff.sh`, `launcher-menu.sh` â consolidate.
- Filename error: `sudo nano /home/pi/utils/shutdown-button.py` should be renamed.

## Installation Package
- `fieldpad-phase3_1.0_all.deb`: Debian package for streamlined installation.

## Miscellaneous
- `README.md`, `README.txt`: Contain deployment and usage notes.
- `watchlist.txt`: Predefined MACs or device identifiers of interest.
- `placeholder.txt`, `delete_me.temp`: Likely test or placeholder files.

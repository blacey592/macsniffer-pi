#!/bin/bash
# Cleanup Script for MACSniffer-Pi

echo "[*] Removing duplicate and placeholder files..."
rm -f launcher/launcher-menu.sh
rm -f mac-sniffer/mac-sniffer/sniff.sh
rm -f delete_me.temp
rm -f placeholder.txt

echo "[*] Renaming misnamed shutdown-button file..."
mkdir -p utils
mv "sudo nano /home/pi/utils/shutdown-button.py" utils/shutdown_button.py 2>/dev/null

echo "[*] Done. Please verify manually before pushing to GitHub."
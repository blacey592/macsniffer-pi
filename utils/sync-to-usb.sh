#!/bin/bash

MOUNT_PATH=$(lsblk -o MOUNTPOINT | grep -E "/media/pi|/mnt/usb" | head -n1)
LOG_TYPES=("sniffer_logs" "bluetooth_logs" "gps_logs")
DEST_DIR="${MOUNT_PATH}/macsniffer_backup_$(date '+%Y-%m-%d_%H-%M-%S')"

if [ -z "$MOUNT_PATH" ]; then
    echo "No USB drive detected. Insert one and try again."
    exit 1
fi

mkdir -p "$DEST_DIR"
echo "Backing up logs to $DEST_DIR..."

for dir in "${LOG_TYPES[@]}"; do
    if [ -d "/home/pi/$dir" ]; then
        cp -r "/home/pi/$dir" "$DEST_DIR/"
    fi
done

echo "Backup complete."

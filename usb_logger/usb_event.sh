#!/bin/bash

LOG_DIR="/home/pi/macsniffer-pi/logs"
mkdir -p "$LOG_DIR"
LOG_FILE="$LOG_DIR/usb_events.csv"

ACTION=$(echo "$ACTION")
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

for sysdevpath in $(find /sys/bus/usb/devices/usb*/ -name dev); do
    (
        syspath="${sysdevpath%/dev}"
        devname=$(udevadm info -q name -p "$syspath")
        [[ "$devname" == "bus/"* ]] && continue

        eval "$(udevadm info -q property --export -p "$syspath")"

        echo "$TIMESTAMP,$ACTION,VID:$ID_VENDOR_ID,PID:$ID_MODEL_ID,$ID_MODEL,$ID_SERIAL_SHORT" >> "$LOG_FILE"
    )
done

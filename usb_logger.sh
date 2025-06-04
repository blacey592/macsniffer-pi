#!/bin/bash
mkdir -p /logs/usb_logs /clones
lsblk -o NAME,SERIAL,VENDOR,MODEL > /logs/usb_logs/usb_$(date +%s).txt
# Optional clone (commented out for safety)
# dd if=/dev/sda1 of=/clones/usb_clone_$(date +%Y%m%d_%H%M).img bs=4M status=progress

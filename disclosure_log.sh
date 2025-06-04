#!/bin/bash
mkdir -p /logs/disclosure
logfile="/logs/disclosure/disclosure_$(date +%s).txt"
echo ">> Disclosure session started at $(date)" >> "$logfile"
while true; do
  read -p "Entry: " line
  echo "$(date +%Y-%m-%d %H:%M:%S) - $line" >> "$logfile"
done

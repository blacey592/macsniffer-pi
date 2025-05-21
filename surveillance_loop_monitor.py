#!/usr/bin/env python3
# surveillance_loop_monitor.py
# Alerts if previously seen devices re-enter detection logs

import os
import csv

SEEN_FILE = "seen_devices.txt"
LOG_FILE = "logs/macsniffer_log.csv"

def monitor_loops():
    seen = set()
    if os.path.exists(SEEN_FILE):
        with open(SEEN_FILE, "r") as f:
            seen = set(line.strip() for line in f)

    reentries = []
    with open(LOG_FILE, "r") as f:
        reader = csv.reader(f)
        next(reader)
        for row in reader:
            if len(row) >= 2 and row[1] in seen:
                reentries.append(row[1])

    for mac in reentries:
        print(f"Loop Detected: {mac}")

if __name__ == "__main__":
    monitor_loops()

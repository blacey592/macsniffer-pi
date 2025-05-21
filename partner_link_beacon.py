#!/usr/bin/env python3
# partner_link_beacon.py
# Finds co-occurring device IDs across log files

import os
import csv
from collections import defaultdict

LOG_DIR = "logs"
OUTPUT_FILE = "partner_beacons.csv"

def find_links():
    devices = defaultdict(set)
    for file in os.listdir(LOG_DIR):
        if file.endswith(".csv"):
            with open(os.path.join(LOG_DIR, file), "r") as f:
                reader = csv.reader(f)
                headers = next(reader)
                for row in reader:
                    for value in row:
                        if len(value) >= 8:
                            devices[value].add(file)

    with open(OUTPUT_FILE, "w") as f:
        writer = csv.writer(f)
        writer.writerow(["Device ID", "Seen In Logs"])
        for dev, logs in devices.items():
            if len(logs) > 1:
                writer.writerow([dev, ", ".join(logs)])

if __name__ == "__main__":
    find_links()

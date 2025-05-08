#!/usr/bin/env python3

# Analyze Bluetooth logs and flag frequent devices

import csv
from collections import defaultdict

bt_hits = defaultdict(list)

with open('bt_log.csv') as f:
    reader = csv.DictReader(f)
    for row in reader:
        bt_hits[row['mac_address']].append(row['timestamp'])

print("MAC Address - Appearances")
for mac, timestamps in bt_hits.items():
    print(f"{mac} - {len(timestamps)} times")

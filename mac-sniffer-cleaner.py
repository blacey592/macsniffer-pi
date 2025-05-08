#!/usr/bin/env python3

# Cleans and summarizes MAC sniffer logs

import csv
from collections import Counter

macs = Counter()

with open('sniff_log.csv') as f:
    reader = csv.DictReader(f)
    for row in reader:
        macs[row['mac_address']] += 1

print("MAC Address - Count")
for mac, count in macs.most_common():
    print(f"{mac} - {count}")

#!/usr/bin/env python3
# timeline_synthesizer.py
# Merges multiple log types into a unified timeline

import os
import csv
from glob import glob

LOG_DIR = "logs"
OUTPUT_FILE = "timeline_output.csv"

def load_logs():
    all_entries = []
    for logfile in glob(os.path.join(LOG_DIR, "*.csv")):
        with open(logfile, "r") as f:
            reader = csv.reader(f)
            headers = next(reader)
            for row in reader:
                all_entries.append((row[0], logfile, row))
    return sorted(all_entries, key=lambda x: x[0])

def write_timeline(entries):
    with open(OUTPUT_FILE, "w", newline="") as f:
        writer = csv.writer(f)
        writer.writerow(["Timestamp", "Source Log", "Raw Entry"])
        for e in entries:
            writer.writerow([e[0], os.path.basename(e[1]), " | ".join(e[2])])

if __name__ == "__main__":
    entries = load_logs()
    write_timeline(entries)

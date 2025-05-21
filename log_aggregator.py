#!/usr/bin/env python3
import csv, os
from glob import glob

LOG_DIR = "logs"
OUTPUT_FILE = "aggregated_logs.csv"

def aggregate_logs():
    all_entries = []
    for log in glob(f"{LOG_DIR}/*.csv"):
        with open(log, "r") as f:
            reader = csv.reader(f)
            headers = next(reader)
            for row in reader:
                all_entries.append((row[0], os.path.basename(log), row))
    all_entries.sort(key=lambda x: x[0])
    with open(OUTPUT_FILE, "w", newline="") as out:
        writer = csv.writer(out)
        writer.writerow(["Timestamp", "Source", "Data"])
        for e in all_entries:
            writer.writerow([e[0], e[1], " | ".join(e[2])])
    print(f"Aggregated log saved to: {OUTPUT_FILE}")

if __name__ == "__main__":
    aggregate_logs()

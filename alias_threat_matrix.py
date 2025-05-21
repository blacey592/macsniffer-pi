#!/usr/bin/env python3
# alias_threat_matrix.py
# Links known aliases to captured MAC/Bluetooth/USB devices

import os
import csv

KNOWN_FILE = "known_aliases.csv"
LOG_DIR = "logs"
OUTPUT_FILE = "alias_matrix.csv"

def build_matrix():
    known = set()
    with open(KNOWN_FILE, "r") as f:
        for line in f:
            known.add(line.strip())

    results = {}
    for root, _, files in os.walk(LOG_DIR):
        for file in files:
            if file.endswith(".csv"):
                with open(os.path.join(root, file), "r") as f:
                    reader = csv.reader(f)
                    headers = next(reader)
                    for row in reader:
                        for value in row:
                            if value in known:
                                results.setdefault(value, []).append(file)

    with open(OUTPUT_FILE, "w") as f:
        writer = csv.writer(f)
        writer.writerow(["Alias", "Seen In Logs"])
        for alias, logs in results.items():
            writer.writerow([alias, ", ".join(set(logs))])

if __name__ == "__main__":
    build_matrix()

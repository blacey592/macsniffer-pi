#!/usr/bin/env python3
# heat_bubble_animator.py
# Parses logs and outputs location-based heat maps

import csv
import matplotlib.pyplot as plt
from collections import Counter

LOG_FILE = "logs/macsniffer_log.csv"

def animate_heatmap():
    coords = []
    with open(LOG_FILE, "r") as f:
        reader = csv.reader(f)
        next(reader)
        for row in reader:
            if len(row) >= 3:
                coords.append((row[1], row[2]))  # MAC and RSSI

    counter = Counter(coords)
    rssi = [abs(int(v[1])) for v in counter.keys()]
    hits = [v for v in counter.values()]
    macs = [v[0] for v in counter.keys()]

    plt.scatter(rssi, hits, alpha=0.6)
    plt.title("Device RSSI vs Hit Frequency")
    plt.xlabel("Signal Strength (RSSI, Absolute)")
    plt.ylabel("Frequency")
    plt.grid(True)
    plt.savefig("heatmap_output.png")
    print("Heatmap saved to heatmap_output.png")

if __name__ == "__main__":
    animate_heatmap()

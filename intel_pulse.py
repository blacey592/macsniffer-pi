#!/usr/bin/env python3
# intel_pulse.py
# Evaluates recent logs and assigns situational threat heat levels

import os
from glob import glob

LOG_DIR = "logs"

def assess_heat():
    entries = 0
    for file in glob(os.path.join(LOG_DIR, "*.csv")):
        with open(file, "r") as f:
            count = sum(1 for line in f) - 1  # Exclude header
            entries += count

    if entries < 50:
        level = "Green"
    elif entries < 200:
        level = "Yellow"
    else:
        level = "Red"

    print(f"Intel Pulse Status: {level} ({entries} log entries)")

if __name__ == "__main__":
    assess_heat()

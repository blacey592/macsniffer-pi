#!/usr/bin/env python3
# uc_csam_osint_scraper.py
# Offline text-based scraper for UC intel collection

import os
import csv

INPUT_DIR = "input_profiles"
OUTPUT_FILE = "uc_scraper_output.csv"
KEYWORDS = ["child", "minor", "14", "13", "snap", "meet", "pic", "nude", "dm", "mom", "dad"]

def extract_data(file_path):
    data = {"filename": os.path.basename(file_path), "flags": []}
    with open(file_path, "r", encoding="utf-8", errors="ignore") as f:
        content = f.read().lower()
        for keyword in KEYWORDS:
            if keyword in content:
                data["flags"].append(keyword)
    return data

def run_scraper():
    os.makedirs(INPUT_DIR, exist_ok=True)
    results = []
    for file in os.listdir(INPUT_DIR):
        if file.endswith(".txt"):
            path = os.path.join(INPUT_DIR, file)
            result = extract_data(path)
            results.append(result)

    with open(OUTPUT_FILE, "w", newline="") as csvfile:
        writer = csv.writer(csvfile)
        writer.writerow(["Filename", "Flagged Keywords"])
        for r in results:
            writer.writerow([r["filename"], ", ".join(r["flags"])])

if __name__ == "__main__":
    run_scraper()

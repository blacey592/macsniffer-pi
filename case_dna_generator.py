#!/usr/bin/env python3
# case_dna_generator.py
# Hashes digital artifacts to generate unique case fingerprints

import os
import hashlib
import json

INPUT_DIR = "evidence_files"
OUTPUT_JSON = "case_dna.json"
OUTPUT_CSV = "case_dna.csv"

def sha256sum(filename):
    h = hashlib.sha256()
    with open(filename, "rb") as f:
        while chunk := f.read(8192):
            h.update(chunk)
    return h.hexdigest()

def hash_all_files():
    os.makedirs(INPUT_DIR, exist_ok=True)
    data = {}
    for root, _, files in os.walk(INPUT_DIR):
        for file in files:
            path = os.path.join(root, file)
            digest = sha256sum(path)
            data[file] = digest

    with open(OUTPUT_JSON, "w") as f:
        json.dump(data, f, indent=4)

    with open(OUTPUT_CSV, "w") as f:
        f.write("Filename,SHA256 Hash\n")
        for k, v in data.items():
            f.write(f"{k},{v}\n")

if __name__ == "__main__":
    hash_all_files()

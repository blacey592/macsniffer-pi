#!/usr/bin/env python3
# local_hashlist_tracker.py
# Maintains a local hashlist and checks for duplicates

import os
import hashlib

HASHLIST_FILE = "known_hashes.txt"
NEW_DIR = "new_files"

def sha256sum(filepath):
    h = hashlib.sha256()
    with open(filepath, "rb") as f:
        while chunk := f.read(8192):
            h.update(chunk)
    return h.hexdigest()

def update_hashlist():
    os.makedirs(NEW_DIR, exist_ok=True)
    known = set()
    if os.path.exists(HASHLIST_FILE):
        with open(HASHLIST_FILE, "r") as f:
            known = set(line.strip() for line in f)

    with open(HASHLIST_FILE, "a") as f:
        for file in os.listdir(NEW_DIR):
            path = os.path.join(NEW_DIR, file)
            h = sha256sum(path)
            if h in known:
                print(f"Duplicate detected: {file}")
            else:
                f.write(h + "\n")
                print(f"New hash recorded for: {file}")

if __name__ == "__main__":
    update_hashlist()

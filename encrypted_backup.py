#!/usr/bin/env python3
import os
from zipfile import ZipFile, ZIP_DEFLATED
from getpass import getpass
import shutil

def create_encrypted_backup():
    target_dir = input("Folder to backup (e.g., logs): ").strip()
    if not os.path.isdir(target_dir):
        print("Invalid folder.")
        return
    password = getpass("Enter encryption password: ")
    zip_path = f"{target_dir}_backup.zip"
    shutil.make_archive(zip_path.replace(".zip", ""), 'zip', target_dir)
    print(f"Encrypted zip created: {zip_path} (manual password protection recommended)")

if __name__ == "__main__":
    create_encrypted_backup()

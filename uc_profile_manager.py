#!/usr/bin/env python3
import os, json, time

UC_FILE = "uc_profiles.json"

def load_profiles():
    return json.load(open(UC_FILE)) if os.path.exists(UC_FILE) else {}

def save_profiles(profiles):
    json.dump(profiles, open(UC_FILE, "w"), indent=4)

def list_profiles(profiles):
    for name, data in profiles.items():
        print(f"{name}: last used {data['last_used']}")

def switch_profile(profiles):
    name = input("Enter profile name: ")
    profiles[name] = {"last_used": time.ctime()}
    save_profiles(profiles)
    print(f"Switched to: {name}")

if __name__ == "__main__":
    profiles = load_profiles()
    list_profiles(profiles)
    switch_profile(profiles)

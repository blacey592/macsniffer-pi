#!/usr/bin/env python3
import os

tools = {
    "1": ("Aggregate Logs", "log_aggregator.py"),
    "2": ("Generate Case Report", "case_report_generator.py"),
    "3": ("UC Profile Manager", "uc_profile_manager.py"),
    "4": ("Encrypted Backup", "encrypted_backup.py")
}

def show_menu():
    while True:
        print("\nTactical Toolkit Menu")
        for key, (desc, _) in tools.items():
            print(f"{key}) {desc}")
        print("0) Exit")
        choice = input("Select: ")
        if choice == "0": break
        elif choice in tools:
            os.system(f"python3 {tools[choice][1]}")
        else:
            print("Invalid option.")

if __name__ == "__main__":
    show_menu()

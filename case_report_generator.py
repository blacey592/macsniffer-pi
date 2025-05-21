#!/usr/bin/env python3
import os

LOG_DIR = "logs"
OUTPUT_FILE = "case_report.txt"

def generate_report():
    with open(OUTPUT_FILE, "w") as f_out:
        f_out.write("FIELD INTEL PAD CASE REPORT\n")
        f_out.write("===========================\n\n")
        for file in os.listdir(LOG_DIR):
            if file.endswith(".csv"):
                f_out.write(f"== {file} ==\n")
                with open(os.path.join(LOG_DIR, file), "r") as f_in:
                    f_out.writelines(f_in.readlines()[0:20])
                f_out.write("\n")
    print(f"Case report saved to: {OUTPUT_FILE}")

if __name__ == "__main__":
    generate_report()

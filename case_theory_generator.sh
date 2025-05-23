#!/bin/bash
# Case Theory Synopsis Generator
clear
echo "=== Case Theory Generator ==="
read -p "Enter Case ID: " case_id
read -p "Summarize the Predicate Crime (1 line): " predicate
read -p "What Financial Behavior Suggests a Conspiracy?: " behavior
read -p "What Evidence Supports This?: " evidence

output_dir="./output"
mkdir -p "$output_dir"

output_file="$output_dir/${case_id}_case_theory.txt"
echo "CASE THEORY SYNOPSIS" > "$output_file"
echo "Case ID: $case_id" >> "$output_file"
echo "" >> "$output_file"
echo "Predicate Crime: $predicate" >> "$output_file"
echo "Observed Financial Behavior: $behavior" >> "$output_file"
echo "Supporting Evidence: $evidence" >> "$output_file"
echo "" >> "$output_file"
echo "Timestamp: $(date)" >> "$output_file"

echo "Case theory saved to $output_file"

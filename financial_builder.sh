#!/bin/bash
# Financial Case Builder
clear
echo "=== Financial Case Builder ==="
read -p "Enter Case ID: " case_id
read -p "Enter Suspect Name: " suspect
read -p "Enter Predicate Felony: " felony
read -p "Enter Target App or Bank (e.g., CashApp, Wells Fargo): " target
read -p "Enter Justification (e.g., 'Proceeds from narcotics trafficking'): " justification

output_dir="./output"
mkdir -p "$output_dir"

output_file="$output_dir/${case_id}_financial_builder.txt"
echo "Case ID: $case_id" > "$output_file"
echo "Suspect: $suspect" >> "$output_file"
echo "Predicate Felony: $felony" >> "$output_file"
echo "Targeted Financial Entity: $target" >> "$output_file"
echo "Justification: $justification" >> "$output_file"
echo "Timestamp: $(date)" >> "$output_file"

echo "Saved to $output_file"

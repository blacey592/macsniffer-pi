#!/bin/bash
# Asset Flow Chart Builder
clear
echo "=== Asset Flow Chart Builder ==="
read -p "Enter Case ID: " case_id
read -p "Enter Owner Name: " owner
read -p "Enter Asset Type (e.g., Vehicle, Property, Account): " type
read -p "Enter Asset Description (e.g., 2016 BMW 5 Series, BofA Checking): " description
read -p "Enter Value Estimate: " value

output_dir="./output"
mkdir -p "$output_dir"

output_file="$output_dir/${case_id}_asset_chart.txt"
echo "Owner: $owner" >> "$output_file"
echo "Asset Type: $type" >> "$output_file"
echo "Description: $description" >> "$output_file"
echo "Estimated Value: $value" >> "$output_file"
echo "Timestamp: $(date)" >> "$output_file"

echo "Saved to $output_file"

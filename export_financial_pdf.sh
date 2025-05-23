#!/bin/bash
# Export to PDF (requires lowriter)
clear
echo "=== Export to PDF ==="
read -p "Enter Case ID: " case_id

input_dir="./output"
output_file="${input_dir}/${case_id}_financial_report.pdf"

# Combine all case files into one
combined_txt="${input_dir}/${case_id}_combined.txt"
cat ${input_dir}/${case_id}_*.txt > "$combined_txt"

# Convert to PDF using LibreOffice (offline)
libreoffice --headless --convert-to pdf "$combined_txt" --outdir "$input_dir"

mv "${input_dir}/${case_id}_combined.pdf" "$output_file"
echo "PDF report created at $output_file"

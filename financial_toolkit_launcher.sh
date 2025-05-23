#!/bin/bash

# Financial Intel Toolkit - Interactive Module

clear
echo "========================================"
echo "        💰 Financial Intel Toolkit        "
echo "========================================"
echo ""
echo "Select an option:"
echo "1. Step-by-Step Financial Case Builder"
echo "2. View Financial Investigations Guide (PDF)"
echo "3. Open Warrant Templates Folder"
echo "4. Asset Flow Chart Builder (Text Mode)"
echo "5. Case Theory Synopsis Generator"
echo "6. Export to PDF"
echo "7. Exit"
echo ""

read -p "Enter your choice [1-7]: " choice

case $choice in
  1)
    echo ""
    echo "Starting Step-by-Step Builder..."
    bash ./modules/financial_builder.sh
    ;;
  2)
    echo ""
    echo "Opening Financial Investigations Guide PDF..."
    xdg-open ./guides/Financial_Investigations_Template_E_F.pdf
    ;;
  3)
    echo ""
    echo "Opening warrant templates folder..."
    xdg-open ./warrants/
    ;;
  4)
    echo ""
    echo "Launching Asset Flow Chart Builder..."
    bash ./modules/asset_flow_chart.sh
    ;;
  5)
    echo ""
    echo "Generating Case Theory Synopsis..."
    bash ./modules/case_theory_generator.sh
    ;;
  6)
    echo ""
    echo "Exporting data to PDF..."
    bash ./modules/export_financial_pdf.sh
    ;;
  7)
    echo "Exiting..."
    exit 0
    ;;
  *)
    echo "Invalid option. Please try again."
    ;;
esac

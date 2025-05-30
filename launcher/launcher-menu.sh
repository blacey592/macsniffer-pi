#!/bin/bash

# MACSniffer-Pi Launcher Menu
# Unified field deployment interface

while true; do
    clear
    echo "====== MACSNIFFER-PI TOOL LAUNCHER ======"
    echo " Select a tool to run:"
    echo ""
    echo "  1. Bluetooth Logger"
    echo "  2. Rogue AP Scan"
    echo "  3. Rogue AP Watch"
    echo "  4. USB Event Logger"
    echo "  5. Shutdown"
    echo "  6. Tactical Toolkit (Phase 3)"
    echo "  7. Visual Intelligence Tools (Phase 4)"
    echo ""
    echo "  0. Exit"
    echo "========================================="
    read -p "Enter choice [0-7]: " choice

    case $choice in
        1)
            bash bluetooth/bluetooth-logger.sh
            read -p "Press Enter to return to menu..."
            ;;
        2)
            bash rogue_ap/rogue-ap-scan.sh
            read -p "Press Enter to return to menu..."
            ;;
        3)
            bash rogue_ap/rogue_ap_watch.sh
            read -p "Press Enter to return to menu..."
            ;;
        4)
            bash usb_logger/usb_event.sh
            read -p "Press Enter to return to menu..."
            ;;
        5)
            echo "Shutting down..."
            sudo shutdown now
            ;;
        6)
            while true; do
                clear
                echo "====== TACTICAL TOOLKIT (PHASE 3) ======"
                echo "  1. Aggregate Logs"
                echo "  2. Generate Case Report"
                echo "  3. UC Profile Manager"
                echo "  4. Encrypted Backup"
                echo "  5. CLI Menu (All Tools)"
                echo "  0. Back to Main Menu"
                echo "======================================="
                read -p "Enter choice [0-5]: " tchoice
                case $tchoice in
                    1) python3 /usr/local/bin/log_aggregator.py ;;
                    2) python3 /usr/local/bin/case_report_generator.py ;;
                    3) python3 /usr/local/bin/uc_profile_manager.py ;;
                    4) python3 /usr/local/bin/encrypted_backup.py ;;
                    5) python3 /usr/local/bin/tactical_toolkit_menu.py ;;
                    0) break ;;
                    *) echo "Invalid option."; sleep 1 ;;
                esac
            done
            ;;
        7)
            while true; do
                clear
                echo "====== VISUAL INTELLIGENCE TOOLS (PHASE 4) ======"
                echo "  1. MAC Trail Map"
                echo "  2. Tower Coverage Map"
                echo "  3. Surveillance Heatmap"
                echo "  4. Animated Device Tracker"
                echo "  0. Back to Main Menu"
                echo "================================================="
                read -p "Enter choice [0-4]: " vchoice
                case $vchoice in
                    1) python3 /usr/local/bin/mac_map_trail.py ;;
                    2) python3 /usr/local/bin/tower_coverage_mapper.py ;;
                    3) python3 /usr/local/bin/surveillance_heatmap.py ;;
                    4) python3 /usr/local/bin/animated_device_tracker.py ;;
                    0) break ;;
                    *) echo "Invalid option."; sleep 1 ;;
                esac
            done
            ;;
        0)
            echo "Exiting launcher. Stay sharp."
            exit 0
            ;;
        *)
            echo "Invalid choice."
            sleep 1
            ;;
    esac
done

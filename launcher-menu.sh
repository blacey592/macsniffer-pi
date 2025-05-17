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
    echo ""
    echo "  0. Exit"
    echo "========================================="
    read -p "Enter choice [0-5]: " choice

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

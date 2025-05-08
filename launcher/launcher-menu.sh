#!/bin/bash

clear
echo "========= MACSniffer-Pi Launcher ========="
echo "1. Run MAC Sniffer"
echo "2. Run Bluetooth Logger"
echo "3. Run GPS Logger (Coming Soon)"
echo "4. Exit"
echo ""
echo "Auto-starting MAC Sniffer in 15 seconds..."
echo ""

read -t 15 -p "Enter choice [1-4]: " choice

case "$choice" in
    1|"")
        echo "Launching MAC Sniffer..."
        bash /home/pi/macsniffer-pi/mac-sniffer/sniff.sh
        ;;
    2)
        echo "Launching Bluetooth Logger..."
        bash /home/pi/macsniffer-pi/bluetooth-logger/bluetooth-logger.sh
        ;;
    3)
        echo "GPS Logger is under development."
        ;;
    4)
        echo "Exiting..."
        exit 0
        ;;
    *)
        echo "Invalid input. Defaulting to MAC Sniffer..."
        bash /home/pi/macsniffer-pi/mac-sniffer/sniff.sh
        ;;
esac

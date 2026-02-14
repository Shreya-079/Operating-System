#!/bin/bash

# Function to perform traceroute
traceroute_test() {
    read -p "Enter the host or IP to traceroute: " target
    echo "Running traceroute to $target..."
    traceroute $target
}
# Check if required tools are installed
if ! command -v ping &> /dev/null; then
    echo "Ping could not be found. Installing..."
    sudo apt update & sudo apt install -y iputils-ping
fi

if ! command -v traceroute &> /dev/null; then
    echo "Traceroute could not be found. Installing..."
    sudo apt update & sudo apt install -y traceroute
fi

# Function to perform ping test
ping_test() {
    read -p "Enter the host or IP to ping: " target
    echo "Pinging $target..."
    ping -c 5 "$target"
}

# Main menu
while true; do
    echo "Choose an option:"
    echo "1) Ping Test"
    echo "2) Traceroute Test"
    echo "3) Exit"
    read -p "Enter your choice [1-3]: " choice

    case $choice in
        1)
            ping_test
            ;;
        2)
            traceroute_test
            ;;
        3)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please enter 1, 2, or 3."
            ;;
    esac
done
if ! command -v traceroute &> /dev/null; then
    echo "Traceroute could not be found. Installing..."
    sudo apt update & sudo apt install -y traceroute
fi
ping_test() {
    read -p "Enter the host or IP to ping: " target
    echo "Pinging $target..."
    ping -c 5 "$target"
}
while true; do
    echo "Choose an option:"
    echo "1) Ping Test"
    echo "2) Traceroute Test"
    echo "3) Exit"
    read -p "Enter your choice [1-3]: " choice
    case $choice in
        1)
            ping_test
            ;;
        2)
            traceroute_test
            ;;
        3)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please enter 1, 2, or 3."
            ;;
    esac
done

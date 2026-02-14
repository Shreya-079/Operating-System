#!/bin/bash
# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}
# Get active network interfaces (excluding 'lo')
get_interfaces() {
    ip -o link show | awk -F': ' '{print $2}' | grep -Ev "lo|docker|veth"
}
# Prompt user to select an interface
select_interface() {
    echo "Available network interfaces:"
    get_interfaces
    echo
    read -p "Enter the network interface to monitor (e.g., eth0, ens33, wlan0): " INTERFACE
}
# Check for required tools
if command_exists iftop; then
    TOOL="iftop"
elif command_exists nload; then
    TOOL="nload"
else
    echo "Error: Neither 'iftop' nor 'nload' is installed. Please install one of them and try again."
    exit 1
fi

# Select interface
select_interface

# Run the selected tool
echo "Starting bandwidth monitoring using $TOOL on interface $INTERFACE..."
if [ "$TOOL" = "iftop" ]; then
    sudo iftop -i "$INTERFACE"
else
    nload "$INTERFACE"
fi
select_interface

# Run the selected tool
echo "Starting bandwidth monitoring using $TOOL on interface $INTERFACE..."
if [ "$TOOL" = "iftop" ]; then
    sudo iftop -i "$INTERFACE"
else
    nload "$INTERFACE"
fi

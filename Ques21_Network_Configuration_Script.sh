#!/bin/bash
# Function to display usage information
usage() {
    echo "Usage: $0 <interface> <IP Address> <Subnet Mask> <Gateway>"
    exit 1
# Check if the script is run as root
if [[ $EUID -ne 0 ]]; then
    echo "Error: This script must be run as root!"
    exit 1
fi

# Check if all arguments are provided
if [[ $# -ne 4 ]]; then
    usage
fi

INTERFACE=$1
IP_ADDR=$2
SUBNET_MASK=$3
GATEWAY=$4

# Validate the network interface
if ! ip link show $INTERFACE &>/dev/null; then
    echo "Error: Network interface $INTERFACE does not exist!"
    exit 1
fi

# Configure the network interface
if ! ip addr add $IP_ADDR/$SUBNET_MASK dev $INTERFACE 2>/dev/null; then
    echo "Error: Failed to assign IP address!"
    exit 1
fi

echo "Successfully assigned IP address $IP_ADDR/$SUBNET_MASK to $INTERFACE."

# Bring the interface up
if ! ip link set $INTERFACE up 2>/dev/null; then
    echo "Error: Failed to bring up the interface $INTERFACE!"
    exit 1
fi

echo "Interface $INTERFACE is now up."

# Set the default gateway
if ! ip route add default via $GATEWAY dev $INTERFACE 2>/dev/null; then
    echo "Error: Failed to set default gateway!"
    exit 1
fi

echo "Default gateway set to $GATEWAY."

echo "Network configuration applied successfully."

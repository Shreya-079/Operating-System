#!/bin/bash
INTERFACE="eth0"   # Change this to your network interface
DURATION=10         # Capture duration in seconds
OUTPUT_FILE="packet_counts.log"
# Function to display usage
usage() {
    echo "Usage: $0 [-i interface] [-t duration] [-o output_file]"
    exit 1
# Parse command-line arguments
while getopts "i:t:o:" opt; do
    case ${opt} in
        i ) INTERFACE=$OPTARG;;
        t ) DURATION=$OPTARG;;
        o ) OUTPUT_FILE=$OPTARG;;
        * ) usage;;
    esac
done
# Check if tcpdump or tshark is installed
if command -v tcpdump &> /dev/null; then
    echo "Using tcpdump to capture packets..."
    sudo timeout ${DURATION} tcpdump -i ${INTERFACE} -c 1000 -q 2>/dev/null | wc -l > ${OUTPUT_FILE}
elif command -v tshark &> /dev/null; then
    echo "Using tshark to capture packets..."
    tshark -i ${INTERFACE} -a duration:${DURATION} 2>/dev/null | wc -l > ${OUTPUT_FILE}
else
    echo "Error: Neither tcpdump nor tshark is installed. Install one of them and retry."
    exit 1
fi
echo "Packet count collected in ${OUTPUT_FILE}"

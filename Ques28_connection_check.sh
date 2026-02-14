#!/bin/bash
check_netstat() {
    echo "Checking connection status using netstat..."
    netstat -tunap
}
check_ss() {
    echo "Checking connection status using ss..."
    ss -tunap
}
# Check if ss command is available, else use netstat
if command -v ss &> /dev/null; then
    check_ss
elif command -v netstat &> /dev/null; then
    check_netstat
else
    echo "Neither ss nor netstat is available on this system."
    exit 1
fi

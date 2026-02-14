#!/bin/bash

PROCESS_NAME="your_process_name"
PROCESS_COMMAND="/path/to/your/process"
LOG_FILE="/var/log/process_monitor.log"

# Function to check if the process is running
is_running() {
    pgrep -f "$PROCESS_NAME" > /dev/null 2>&1
    return $?
}

# Infinite loop to monitor the process
while true; do
    if ! is_running; then
        echo "$(date) - $PROCESS_NAME is not running. Restarting..." | tee -a "$LOG_FILE"
        $PROCESS_COMMAND &
    fi
    sleep 5  # Check every 5 seconds
done

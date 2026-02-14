#!/bin/bash

# Set the monitoring interval in seconds
INTERVAL=5

# Get the initial process snapshot
ps -eo ppid,pid,cmd --no-headers > initial_snapshot.txt

echo "Monitoring process forks... Press Ctrl+C to stop."

while true; do
    # Get the current process snapshot
    ps -eo ppid,pid,cmd --no-headers > current_snapshot.txt
    
    # Compare with the initial snapshot to detect new forks
    echo "Checking for new forks..."
    diff initial_snapshot.txt current_snapshot.txt | grep "^>" | awk '{print "New process fork detected: PPID=" $2 ", PID=" $3 ", CMD=" $4}'
    
    # Update the snapshot
    mv current_snapshot.txt initial_snapshot.txt
    
    # Wait for the next interval
    sleep $INTERVAL
done

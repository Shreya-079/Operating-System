#!/bin/bash

# Check if a process ID or command is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <pid> or $0 -c <command>"
    exit 1
fi

LOGFILE="syscall_log.txt"
echo "Logging system calls to $LOGFILE"

# If the first argument is -c, run the command under strace
if [ "$1" == "-c" ]; then
    shift
    strace -f -e trace=all -o "$LOGFILE" -s 1000 "$@"
else
    # Attach strace to an existing process
    PID=$1
    strace -f -e trace=all -p "$PID" -o "$LOGFILE" -s 1000
fi

# Format and display log
echo "Formatted log output:"
awk '{print $1, $2, $3, $4, $5, $6, $7, $8, $9}' "$LOGFILE"

#!/bin/bash

# Check if ltrace is installed
if ! command -v ltrace &> /dev/null
then
    echo "ltrace is not installed. Please install it using: sudo apt install ltrace"
    exit 1
fi

# Check if user provided a program to trace
if [ "$#" -lt 1 ]; then
    echo "Usage: $0 <program> [args...]"
    exit 1
fi

# Define the output log file
LOGFILE="ltrace_output.log"

# Start tracing the provided program and log output
echo "Intercepting library calls for: $@"
ltrace -f -o "$LOGFILE" "$@"

echo "Library calls logged in: $LOGFILE"

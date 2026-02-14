#!/bin/bash

# Check if the user provided both arguments
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <directory> <days>"
    exit 1
fi

DIRECTORY=$1
DAYS=$2

# Check if the directory exists
if [ ! -d "$DIRECTORY" ]; then
    echo "Error: Directory '$DIRECTORY' does not exist."
    exit 1
fi

# Find files modified in the last N days
find "$DIRECTORY" -type f -mtime -$DAYS

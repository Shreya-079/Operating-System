#!/bin/bash

# Check if filename argument is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi
# Find the directory containing the file
FILE_PATH=$(find / -type f -name "$1" 2>/dev/null | head -n 1)

# Check if the file was found
if [ -z "$FILE_PATH" ]; then
    echo "File not found"
    exit 1
fi

# Extract the directory path
DIR_PATH=$(dirname "$FILE_PATH")

echo "Navigating to: $DIR_PATH"
cd "$DIR_PATH" || exit

# Open a shell in the directory
echo "You are now in $(pwd)"
bash

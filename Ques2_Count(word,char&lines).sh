#!/bin/bash
# Check if a filename is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi
# Check if the file exists
if [ ! -f "$1" ]; then
    echo "Error: File '$1' not found!"
    exit 1
fi
# Count words, characters, and lines
words=$(wc -w < "$1")  #wc command is used
characters=$(wc -m < "$1")
lines=$(wc -l < "$1")

# Display the results
echo "File: $1"
echo "Words: $words"
echo "Characters: $characters"
echo "Lines: $lines"

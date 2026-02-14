#!/bin/bash
DIR=${1:-.}  # Use first argument if provided, otherwise use current directory
if [ ! -d "$DIR" ]; then
    echo "Error: Directory '$DIR' not found."
    exit 1
fi
for file in "$DIR"/*; do
    if [ -f "$file" ]; then
        lines=$(wc -l < "$file")
        echo "$file: $lines lines"
    fi
done

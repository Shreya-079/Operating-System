#!/bin/bash
# Check if correct number of arguments are passed
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <directory> <search_text> <replace_text>"
    exit 1
fi
# Assign arguments to variables
directory=$1
search_text=$2
replace_text=$3
# Find and replace text in files
find "$directory" -type f -exec sed -i "s/$search_text/$replace_text/g" {} +
echo "Replacement completed in directory: $directory"

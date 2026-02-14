#!/bin/bash
# Prompt the user for a directory path
echo -n "Enter the directory path: "
read dir

# Check if the directory exists
if [ -d "$dir" ]; then
    cd "$dir" || exit
    echo "Changed directory to: $(pwd)"
else
    echo "Error: Directory does not exist."
fi

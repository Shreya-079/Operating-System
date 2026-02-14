#!/bin/bash
echo "Simple File Manager"
echo "Enter directory path:"
read dir

# Check if directory exists, if not, create it
if [ ! -d "$dir" ]; then
    echo "Directory does not exist. Creating..."
    mkdir -p "$dir"
fi
while true; do
    echo "\nChoose an option:"
    echo "1) Create a file"
    echo "2) Delete a file"
    echo "3) List files"
    echo "4) Exit"
    read choice
    case $choice in
        1)
            echo "Enter file name to create:"
            read filename
            touch "$dir/$filename"
            echo "File '$filename' created in $dir."
            ;;
        2)
            echo "Enter file name to delete:"
            read filename
            if [ -f "$dir/$filename" ]; then
                rm "$dir/$filename"
                echo "File '$filename' deleted."
            else
                echo "File does not exist."
            fi
            ;;
        3)
            echo "Files in $dir:"
            ls -l "$dir"
            ;;
        4)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid option. Try again."
            ;;
    esac
done

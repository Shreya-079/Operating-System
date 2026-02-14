#!/bin/bash

# Define restore location
RESTORE_DIR="/home/$USER/restore"
BACKUP_FILE="$1"

# Check if Backup File is Provided
if [ -z "$BACKUP_FILE" ]; then
    echo "Usage: ./restore.sh <backup_file.tar.gz>"
    exit 1
fi

# Create Restore Directory (if not exists)
mkdir -p $RESTORE_DIR

# Extract backup file
tar -xzf $BACKUP_FILE -C $RESTORE_DIR

# Verify Restore
if [ $? -eq 0 ]; then
    echo "Restore successful: Files restored to $RESTORE_DIR"
else
    echo "Restore failed!"
fi

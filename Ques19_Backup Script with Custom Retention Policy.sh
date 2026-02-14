#!/bin/bash
# Configuration
SOURCE_DIR="/path/to/source"  # Directory to back up
BACKUP_DIR="/path/to/backup"  # Backup storage location
RETENTION_DAYS=7               # Number of days to keep backups
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_NAME="backup_$TIMESTAMP.tar.gz"
# Ensure backup directory exists
mkdir -p "$BACKUP_DIR"
# Create a compressed archive of the source directory
tar -czf "$BACKUP_DIR/$BACKUP_NAME" -C "$SOURCE_DIR" .

# Log backup creation
echo "Backup created: $BACKUP_DIR/$BACKUP_NAME"
# Find and delete old backups older than retention period
find "$BACKUP_DIR" -name "backup_*.tar.gz" -type f -mtime +$RETENTION_DAYS -exec rm -f {} \;
# Log cleanup
echo "Old backups older than $RETENTION_DAYS days removed."

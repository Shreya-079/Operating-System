#!/bin/bash

# Check if the user has provided exactly three arguments
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 {add|remove} username group"
    exit 1
fi

ACTION=$1
USERNAME=$2
GROUP=$3

# Check if the group exists
if ! getent group "$GROUP" >/dev/null; then
    echo "Error: Group '$GROUP' does not exist."
    exit 1
fi

# Check if the user exists
if ! id "$USERNAME" >/dev/null 2>&1; then
    echo "Error: User '$USERNAME' does not exist."
    exit 1
fi

# Perform the requested action
case $ACTION in
    add)
        sudo usermod -aG "$GROUP" "$USERNAME"
        echo "User '$USERNAME' added to group '$GROUP'."
        ;;
    remove)
        sudo gpasswd -d "$USERNAME" "$GROUP"
        echo "User '$USERNAME' removed from group '$GROUP'."
        ;;
    *)
        echo "Invalid action: Use 'add' or 'remove'."
        exit 1
        ;;
esac

exit 0

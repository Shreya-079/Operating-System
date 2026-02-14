#!/bin/bash

echo "User Account Management Script"
echo "1. Create User"
echo "2. Modify User"
echo "3. Delete User"
echo "4. Exit"
read -p "Enter your choice: " choice

case $choice in
    1)
        read -p "Enter the username to create: " username
        sudo adduser $username
        echo "User $username created successfully."
        ;;
    2)
        read -p "Enter the username to modify: " username
        echo "1. Change Username"
        echo "2. Change Password"
        echo "3. Lock User"
        echo "4. Unlock User"
        read -p "Enter your choice: " mod_choice
        case $mod_choice in
            1)
                read -p "Enter new username: " new_username
                sudo usermod -l $new_username $username
                echo "Username changed to $new_username."
                ;;
            2)
                sudo passwd $username
                echo "Password changed for $username."
                ;;
            3)
                sudo usermod -L $username
                echo "User $username has been locked."
                ;;
            4)
                sudo usermod -U $username
                echo "User $username has been unlocked."
                ;;
            *)
                echo "Invalid choice."
                ;;
        esac
        ;;
    3)
        read -p "Enter the username to delete: " username
        sudo deluser $username
        echo "User $username deleted successfully."
        ;;
    4)
        echo "Exiting..."
        exit 0
        ;;
    *)
        echo "Invalid choice. Please try again."
        ;;
esac

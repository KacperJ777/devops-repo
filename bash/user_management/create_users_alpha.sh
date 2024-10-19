#!/bin/bash

# File containing list of usernames
list_users="/path"

# Default password for new users
default_password="P@ssw0rd"

# Check if user list file exists
if [[ ! -f "$list_users" ]]; then
    echo "User list file not found!"
    exit 1
fi

# Loop through the file and create users
while IFS= read -r user; do
    # Check if user already exists
    if id "$user" &>/dev/null; then
        echo "User $user already exists, skipping."
    else
        # Create user
        sudo useradd "$user"
        
        if [[ $? -eq 0 ]]; then
            # Set default password
            echo "$user:$default_password" | sudo chpasswd
            
            # Force user to change password on first login
            sudo chage -d 0 "$user"
            
            echo "User $user has been created with default password."
        else
            echo "Failed to create user $user."
        fi
    fi
done < "$list_users"

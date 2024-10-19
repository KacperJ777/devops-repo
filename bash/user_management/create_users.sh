#!/bin/bash

# Create a users from a file text with default password
list_users="/path"

for user in $(cat "$list_users")

do
        sudo useradd $user
        sudo passwd $user
done

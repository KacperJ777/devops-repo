#!/bin/bash

# Write a script to create, rename, and delete directories based on user input.

printf "Enter your choice:\n1) Create a directory\n2) Delete directory\n3) Rename directory\n4) Your input: "
read choice

case $choice in
1)
        printf "Provide directory name: "
        read dir_name
        mkdir "$dir_name"
        ;;
2)
        printf "Provide directory that you want to remove: "
        read dir_name_remove
        rmdir "$dir_name_remove"
        ;;
3)
        printf "Provide directory that you want to rename:"
        read dir_name_rename
        printf "Provide a new name for a directory: "
        read new_dir_name
        mv "$dir_name_rename" "$new_dir_name"
        ;;
*)
        printf "Invalid choice"
        ;;
esac

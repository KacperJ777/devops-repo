#!/bin/bash

# Remove spaces and comments from a file
printf "Provide a file from you wanna remove spaces and comments: "
read filename
temp_file=$(mktemp)


grep -Ev "^#|^$" $filename > $temp_file
mv $temp_file $filename

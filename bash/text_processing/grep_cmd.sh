#!/bin/bash

# Search for a keyword and count number of occurences
log_file="/path"
keyword="kenmarks-ppp.example"

if grep -q $keyword $log_file
then
        printf "Word exist, it's in the line $(grep -n $keyword $log_file)"
else
        printf "Mentioned keyword is not present in a file"
fi

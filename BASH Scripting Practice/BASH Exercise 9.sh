#!/bin/bash

# Objectives:
# Pass a filename through command-line.
# Delete all the empty lines from that file and save it back.
# Be sure to save a copy to compare with the response on the next screen.

# Ask For File Location
echo "Enter File Location:"
read -e file;

# Ask if the user wants to delete all the empty lines
echo "Do you want to delete all the empty lines? "
read -e ans;

if [[ $ans == "yes" ]];
then
    sed /^$/d $file > file2.txt
else
    "Thanks For Running This Script......."
    sleep 2
    break
fi

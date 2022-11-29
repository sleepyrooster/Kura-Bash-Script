#!/bin/bash

# Objectives:
# Write a script to compare larger integer values from a ‘n’ number of arguments using command line arguments
# Compare all these arguments and print the largest value
# Print error in-case no arguments.
# Number of arguments can vary every time.
if [ "$#" = 0 ]
then
    #Script exits if no
    #arguments passed
    echo "No arguments passed."
    exit 1
fi

maxArg=$1

for i in "$@"
do
    if [[ "$i" -gt "$maxArg" ]]
    then
        maxArg=$i
    fi
done
echo $maxArg

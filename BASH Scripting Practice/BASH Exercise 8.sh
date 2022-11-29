#!/bin/bash

# Objectives:
# Write a script to print a given number in reverse order
# Read an multi-digit number from user and reverse the number.
# Its not just printing in reverse order
# You have to extract each digit and convert to reverse.

echo "Enter A Number: "
read n;


sd=0
rev=0
while [ $n -gt 0 ]
do
    sd=$(( $n % 10 ))
    rev=$(( $rev * 10 + $sd ))
    n=$(( $n / 10 ))
done
echo "Reverse number of entered digit is $rev"
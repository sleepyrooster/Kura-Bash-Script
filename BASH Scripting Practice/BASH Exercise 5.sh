#!/bin/bash

# Write a script for addition of two numbers for real numbers 

echo "Please enter a number: "
read num1;

echo "Please enter a number: "
read num2;

# Adding these two numbers
sum=`echo "$num1+$num2"|bc`
echo $sum


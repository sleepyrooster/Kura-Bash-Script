#!/bin/bash

# Objectives:
# Read a string from user, must end with a operator symbol.
# Number can be any length but must end with an operator character
# Always do left to right operations.
# If 8312 – passed do 8-3-1-2 = 2
# Be sure to save a copy to compare with the response on the next screen.


# Get a string with a set of number and an operation symbol
echo "Enter a string of numbers with an operator character at the end: "
read -e num;

# Add spaces to the string before creating the array
spacedString=$(echo "$num" |sed 's/./& /g')
echo $spacedString
# Creating the array
array1=($spacedString);
# Getting the last index
lastIndex=`expr ${#array1[@]} - 1`
operator=${array1[$(echo "lastIndex")]}

# Looping through the array to get the correct operator
# Addition
sum=0
 if [[ $operator == "+" ]];
 then 
     for i in ${array1[@]};do
  if [[ $i !=  "+" ]];
     then
     (( sum+=i ))
  fi
  done
  echo $sum
 # Subtraction
 elif [[ $operator == "-" ]];
 then
     for i in ${array1[@]};do
  if [[ $i !=  "-" ]];
     then
     sum=-1
     (( sum-=i ))
  fi
  done
  echo $sum
 # Multication
 elif [[ $operator == "*" ]];
 then
     for i in ${array1[@]};do
  if [[ $i !=  "*" ]];
     then
     (( sum*=i ))
  fi
  done
  echo $sum
 # Division
 elif [[ $operator == "/" ]]
 then
 for i in ${array1[@]};do
  if [[ $i !=  "/" ]];
     then
     (( sum/=i ))
  fi
  done
  echo $sum
#  *
 else
   echo "Don't Have an Operator at the End"
   sleep 2
fi



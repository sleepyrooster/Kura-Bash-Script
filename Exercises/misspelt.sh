#!/bin/bash

echo "Please enter File Path"
read file;

if [[ -z $file ]];
then
    echo "Please enter a parameter"
    exit 1
else 
  aspell -c $file
  fi
  exit 0

#!/bin/bash

# Read ‘n’ and generate a pattern
rows=5
for ((x=1; x<=5; x++))
do
for((y=1; y<=rows - i; y++))
  do
    echo -n "  "
  done
for ((y=1; y<=x; y++))
do
echo -n " $y"
done
echo " "
done



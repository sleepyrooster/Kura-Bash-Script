#!/bin/bash

# Read ‘n’ and generate a pattern

rows=4
number=1

for ((x=1; x<=rows; x++))
do
 for ((y=1; y<=x; y++))
 do
  echo -n " $number"
  number=$((number +1))
done
echo " "
done
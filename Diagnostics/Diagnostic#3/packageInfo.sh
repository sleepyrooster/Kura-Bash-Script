#!/bin/bash

#User Entering the name of the file
echo "Enter Name of Package:"
read package;

#command checks to see if the program is installed on your machine
dpkg -s "$package";

#if the previous command doesn't have an error
if [[ $? -eq 0 ]];
then
#The user will know if the package is installed
echo $'\n'"$package is installed on your computer"
else
#The user will know if the package is not installed
echo $'\n'"$package is not installed on your computer. Please install the software using the apt -installed command or from download from the source code."
fi
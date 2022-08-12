#!/bin/bash

#################################################################################################################################################
# Name: Walter Emmanuel                                                                                                                        ##
#                                                                                                                                              ##         
# Date:                                                                                                                                        ##
#                                                                                                                                              ##
# Description: This script will ill automatically check the computer's processes and system performance and kill task demanding application.   ##
#                                                                                                                                              ##
#################################################################################################################################################


# See what processes are running on your machine
echo "Do you want a snapshot of you current processes? yes or no?"
read ans;

ansFull=$(echo "$ans" < tr [:upper:] [:lower:])
ansCut=$(echo "$ans" | cut -c 1 | tr [:upper:] [:lower:] )


if [[ $ansFull = "yes" || $ansCut = "y" ]]
then
ps -e --format uname,pid,ppid,%mem,%cpu,cmd
else 
echo "Will close the script soon......."
fi

# If user wants to see what is consuming the most memory 
echo "Do you want to see what is using the most memory? "
#!/bin/bash

##################################################################################################################################################
## Name: Walter Emmanuel                                                                                                                        ##
##                                                                                                                                              ##         
## Date: 10/08/2022                                                                                                                             ##
##                                                                                                                                              ##
## Description: This script will ill automatically check the computer's processes and system performance and kill task demanding application.   ##
##                                                                                                                                              ##
##################################################################################################################################################


# To get the processes that are over the set limit
header=$(ps -e --format uname,pid,ppid,%mem,%cpu,cmd --sort=-%mem | sed q)
echo "$header" && ps -e --format uname,pid,ppid,%mem,%cpu,cmd --sort=-%mem | awk '$4 >= 0.3' 


# To kill the program which is higher than max memory limit (which is set)
while [ $(ps -e --format uname,pid,ppid,%mem,%cpu,cmd --sort=-%mem | awk '$4 >= 0.3'| awk '{print $4 }') < 0.3 ]
do
#Get the PID from the ps command
pid=$(ps -e --format uname,pid,ppid,%mem,%cpu,cmd --sort=-%mem | awk '$4 >= 0.3' | sed q | awk '{print $2}')

#kill the program in question
kill -9 "$pid"

done








#!/bin/bash

##################################################################################################################################################
## Name: Walter Emmanuel                                                                                                                        ##
##                                                                                                                                              ##         
## Date: 11/08/2022                                                                                                                             ##
##                                                                                                                                              ##
## Description: This script will ill automatically check the computer's processes and system performance and kill task demanding application.   ##
## 
## Notice when running script: 
## 1) Bash doesn't use decimal points in the conditional statements
## 2) Due to WSL i only use glance replicate some values (since cannot install firefox due to WSL and snap error) and use 0.3 as my marker
## 3) Script breaks after killing all of the PIDs that have a %mem value of 0.3 (my limiter for this script) since it cannot get the next PID 
## 4) Update on point (4), wrote script to fix it but WSL crashed                                                                                                                                         ##
##################################################################################################################################################

# setiting the memory limit for the program
echo "Set the memory limit for the machine"
read limit;


# To get the processes that are over the set limit
#header=$(ps -e --format uname,pid,ppid,%mem,%cpu,cmd --sort=-%mem | sed q)
ps -e --format uname,pid,ppid,%mem,%cpu,cmd --sort=-%mem | awk -v memlimiter=limit '$4 >= memlimit' 

# Turning the memory output into a variable
mem=$(ps -e --format uname,pid,ppid,%mem,%cpu,cmd --sort=-%mem | ps -e --format uname,pid,ppid,%mem,%cpu,cmd --sort=-%mem | awk -v memlimiter=limit '$4 >= memlimit'| awk '{print $4 }')
echo $mem


#convert the memory output which is in decimal into an integar
memlimitdec=$(echo $mem | awk -F '.' '{print $2}')
echo $memlimitdec

# Counting the number of programs which run over the memory limit
memOver=$(echo memlimitdec | awk '{print NF}')
# Setting a counter
a=1

# To kill the program which is higher than max memory limit (which is set)
while (( $a -le $memOver ));
do

#Get the PID from the ps command
pid=$(ps -e --format uname,pid,ppid,%mem,%cpu,cmd --sort=-%mem | awk -v memlimiter=limit '$4 >= memlimit' | sed q | awk '{print $2}')

#kill the program in question
kill -9 "$pid"

i=$(($i + 1))

done






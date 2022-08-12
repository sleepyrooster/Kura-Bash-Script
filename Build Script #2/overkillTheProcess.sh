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


# To get the processes that are over the set limit
header=$(ps -e --format uname,pid,ppid,%mem,%cpu,cmd --sort=-%mem | sed q)
echo "$header" && ps -e --format uname,pid,ppid,%mem,%cpu,cmd --sort=-%mem | awk '$4 >= 0.3' 

#Setting the Variable for the while loop
memlimit=$(ps -e --format uname,pid,ppid,%mem,%cpu,cmd --sort=-%mem | awk '$4 >= 0.3'|sed q | awk '{print $4 }')
echo $memlimit

#convert the decimal into an integar
memlimitdec=$(echo $memlimit | awk -F '.' '{print $2}')
#memlimitdec=2
echo $memlimitdec

# To kill the program which is higher than max memory limit (which is set)
while (( $memlimitdec > 1 ));
do
i=1
echo $i
#Get the PID from the ps command
pid=$(ps -e --format uname,pid,ppid,%mem,%cpu,cmd --sort=-%mem | awk '$4 >= 0.3' | sed q | awk '{print $2}')

#kill the program in question
kill -9 "$pid"

limiter=$(ps -e --format uname,pid,ppid,%mem,%cpu,cmd --sort=-%mem | awk '$4 >= 0.3' | awk '{print $4 }')
counter=$(echo $limiter | awk '{print $1"\n"$2}' | awk '{print NR}')

if [[ $counter = 0 ]];
then 
break
fi

done








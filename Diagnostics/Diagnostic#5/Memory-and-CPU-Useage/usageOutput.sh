#!/bin/bash

# to get the snapshot of the cpu and memory usage with a timestamp
ps -e --format uname,pid,ppid,%mem,%cpu,cmd > usage"$(date +"%D %T")".txt

# add , commit and push to the repo
git add . || commit -m "$(date +"%D %T")"
git remote add origin https://github.com/sleepyrooster/Memory-and-CPU-Useage.git
git push -u origin main

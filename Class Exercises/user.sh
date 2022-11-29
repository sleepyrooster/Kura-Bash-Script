#!/bin/bash


cat /etc/passwd | cut -d ":" -f 1,7 | awk -F : '{print $1","$NF}' > user.txt
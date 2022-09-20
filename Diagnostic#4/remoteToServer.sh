#!/bin/bash

# Check to see if the server is online?
echo "Please enter IP address of the server you want to remote into"
read ip;

ping -t 10 "$ip"

# If server is online then it will ssh into that server
if [ $? -eq 0 ]; then
    echo "The Server is online....."
    ssh -i Cali1.pem ubuntu@"$ip"
else
    echo "Coouldn't connect to server...."
fi
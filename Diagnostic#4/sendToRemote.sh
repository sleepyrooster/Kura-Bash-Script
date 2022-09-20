#!/bin/bash

#create file
echo "Enter name"
read name;
touch $name.txt
file=$name.txt

# Check to see if the server is online?
echo "Please enter IP address of the server you want to send this file to:"
read ip;

#sending file to remote server
scp -i Cali1.pem ./$file ubuntu@$ip:~/

#then to check too see if the file is there 
ssh -t ubuntu@12.34.56.78 "test -e ./$file"

if [ $? -eq 0 ]; then
    echo "File was transfered"
else
    echo "File Wasn't Transfered"
fi

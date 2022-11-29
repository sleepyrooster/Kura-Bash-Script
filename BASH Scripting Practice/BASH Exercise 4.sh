#!/bin/bash

#To understand working of scp and ssh commands.

echo "ssh"
echo "scp"
echo -e "Please choose which service you want to use: "
read service;

case $service in 

# Using SSH
ssh)   
echo -n "Please enter and IP address to access the remote machine:"
read ip;
echo -n "Please enter the username of remote machine: "
read username;
ssh $username@$ip
;;

# Using SCP
scp)
echo "Local --> Remote"
echo "Remote --> Local"
echo -e  "Please state which machine is the file going to: "
read direction ;

case $direction in
local)

echo -n "Location of source file: "
read source;

echo -n "Location of destination file: "
read destination

echo -n "Please enter and IP address to access the remote machine:"
read ip;

echo -n "Please enter the username of remote machine: "
read username;

scp $source $username@$ip:$destination

;;
remote)

echo -n "Location of source file: "
read source;

echo -n "Location of destination file: "
read destination

echo -n "Please enter and IP address to access the remote machine:"
read ip;

echo -n "Please enter the username of remote machine: "
read username;

scp $source $username@$ip:$destination
;;
esac

;;

*)
echo "Please choose a service above"
;;
esac
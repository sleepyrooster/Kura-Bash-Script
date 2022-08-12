#!/bin/bash

#Name: Walter Emmanuel

#Date: 03/08/2022

#Description: autoUpdate.sh is an automatic script that update and install updates to your machine without user interaction.

#Informaton for crontab:
#please place script in this directory: /usr/local/bin
#so edit the crontab file by using the following command "sudo nano /etc/crontab
#At the bottom of the file please enter the following:
# * 23 * * 5   root  /usr/local/bin



#To make sure you are a superuser
if [[ $UID != 0 ]];
then 
#If Not A superuser it will show an error
echo "Must Login As A Superuser !!!!"
exit 1
fi

#Updating the Repository 
if [[ $UID = 0 ]];
then 
echo "Updating the repository.... " >> autoUpdate_"$(date "+%Y-%m-%d")".txt
#Updates the repository and creates a file with the date the is run
apt -y update >> autoUpdate_"$(date "+%Y-%m-%d")".txt
echo "--------------------------------------------------------" >> autoUpdate_"$(date "+%Y-%m-%d")".txt
echo "You Device Repository Has Been Updated At: $(date)" $'\n' >> autoUpdate_"$(date "+%Y-%m-%d")".txt
fi

#Upgrading the Repository 
if [[ $UID = 0 ]];
then 
echo "Upgrading the repository...." >> autoUpdate_"$(date "+%Y-%m-%d")".txt
#Upgrades the repository and creates a file with the date the is run
apt -y upgrade >> autoUpdate_"$(date "+%Y-%m-%d")".txt
echo "--------------------------------------------------------" >> autoUpdate_"$(date "+%Y-%m-%d")".txt
echo "You Device Repository Has Been Upgraded At $(date)" $'\n' >> autoUpdate_"$(date "+%Y-%m-%d")".txt
fi





#!/bin/bash

#Making sure you're a super user
if [[ $UID != 0 ]];
then 
echo "Please try again as a superuser!"
exit 1
fi

#Getting the user information
echo "Enter Full Name:" 
read -r fullName;

echo "Enter the shell for this user:"
read -r shell;

echo "Enter the group for this user:"
read -r group;

echo "Enter password for this user:"
read -r psswd;


firstLetter=$(echo "$fullName" | cut -b 1);
lastName=$(echo "$fullName" | awk '{print $2}');
cName=$firstLetter$lastName

useradd "$cName" -g "$group" -s "$shell" -p "$psswd" -m -k 

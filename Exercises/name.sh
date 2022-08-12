#!/bin/bash
echo "Enter File Path: "
read name;

if [[ -z $name ]] ;
then 
 echo "Please input a name of the file"
 exit 1
else
cat $name | (sed -u  1q ; sort  | uniq -u) | nl > names2.txt && cat $name | (sed -u  1q ; sort  | uniq -d) | nl > dupli.txt
fi
exit 0
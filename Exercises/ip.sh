#!/bin/bash

echo "Pick a number between 1-10"

read ip;

case $ip in

 1) ssh -i private.pem ubuntu@192.168.0.1;;
 2) ssh -i private.pem ubuntu@192.168.0.2;;
 3) ssh -i private.pem ubuntu@192.168.0.3;;
 4) ssh -i private.pem ubuntu@192.168.0.4;;
 5) ssh -i private.pem ubuntu@192.168.0.5;;
 6) ssh -i private.pem ubuntu@192.168.0.6;;
 7) ssh -i private.pem ubuntu@192.168.0.7;;
 8) ssh -i private.pem ubuntu@192.168.0.8;;
 9) ssh -i private.pem ubuntu@192.168.0.9;;
 10) ssh -i private.pem ubuntu@192.168.0.10;;

esac

exit 0
   
 
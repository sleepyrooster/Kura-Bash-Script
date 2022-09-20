#!/bin/bash

########################################################################################################
#                                       add_User.sh                                                    #
# Name: Walter Emmanuel                                                                                #
# Date: 18/08/2022                                                                                     #
# Description: The purpose of this script is to check to see if there is a specific users and groups   #
#              and create these users/groups. Also to add these users to a specific group              #
#                                                                                                      # 
########################################################################################################

# Need sudo permission to add the user

if [[ $UID != 0 ]];
then
    echo "Please this exam as a superuser!!!"
    exit 1
fi


if [[ $UID = 0 ]];
then

    # Check to see if the user is already created 
    echo "Enter User Name: "
    read -r userName;

    check=$(getent passwd | grep "$userName")
    checkName=$(echo "$check" | cut -d: -f1)

    if [[ "$userName" = "$checkName" ]];
    then 
        # User was already added into the system
        echo "User is in the system already"
    else
        # Creating a new user
        echo "Do you want to create a new user?(yes/no)"
        read -r ans;
        if [[ "$ans" = "yes" || "$ans" = "y" ]];
          then
            # Variable for the User name
            echo "Enter User name:"
            read -r uname;

            # Variable for the shell for the user
            echo "Enter the shell for this user:"
            read -r shell;

            #Variable for the Password For the user
            echo "Enter password for this user:"
            read -r psswd;

            # Command to create the user
            useradd "$uname" -s "$shell" -p "$psswd" -m -k 
          else
          echo "Don't want to create a user thats ok....."
          echo "See you soon...."
          sleep 1
          exit 1
        fi

    fi
    
    # Adding a user to a group (EX. A git account group)
    # Check to see if the group is there
    echo "Enter the group name:"
    read -r group;

    checkgroup=$(getent group "$group")
    checkGroup=$(echo "$checkgroup" | cut -d: -f1)

    if [[ "$group" = "$checkGroup" ]];
      then
      # The group is already created
        echo "This group is already created!!!"
        echo "Want to add user to this group?(yes/no)"
        read -r ans;

        if [[ "$ans" = "yes" || "$ans" = "y" ]];
         then
          # Adding the user to the group
            sudo usermod -g "$group" "$userName"
          # State what user was added
            echo "The use ""$userName"" was added to the group ""$group""."
            sleep 1
            echo "Thank you for using this script....."

            else
          echo "Don't want to add a user to the group thats ok....."
          echo "See you soon...."
          sleep 1
          exit 1

        fi

         else
          # Ask user to create a new group
            echo "Want to create this group?(yes/no)"
            read -r ans;

            if [[ "$ans" = "yes" || "$ans" = "y" ]];
             then
                # Creating the group
                  groupadd "$group";
                else
                   echo "Don't want to create a group thats ok....."
                   echo "See you soon...."
                  sleep 1
                  exit 1
            fi
                # Ask user to add user to group
                  echo "Want to add user to this group?(yes/no)"
                  read -r ans;
                     if [[ "$ans" = "yes" || "$ans" = "y" ]];
                       then
                         # Adding the user to the group
                           sudo usermod -g "$group" "$userName"
                         # State what user was added
                           echo "The user ""$userName"" was added to the group ""$group""."
                           sleep 1
                           echo "Thank you for using this script....."
                            else
                             echo "Don't want to add a user to the group thats ok....."
                             echo "See you soon...."
                             sleep 1
                             exit 1
                      fi
        
        
      
    fi
fi

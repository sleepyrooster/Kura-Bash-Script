#!/bin/bash

########################################################################################################
#                                       git_User.sh                                                    #
# Name: Walter Emmanuel                                                                                #
# Date: 18/08/2022                                                                                     #
# Description: The purpose of this script is to add and commit changes to a file and also check for    # 
#               sensitive information                                                                  # 
########################################################################################################

# Creating the formats for the different sensitive information
# Emails
#emailFormat="^[a-zA-Z0-9._]+@[a-zA-Z0-9\s_.%]+\.[a-z]{2,4}$"
emailFormat="[a-zA-Z0-9._]\+@[a-zA-Z]\+.[a-zA-Z]\+"

# Telephone Number
telephoneFormat="(^\+[0-9]+\s\([0-9]{3}\)\s[0-9]{3}\-[0-9]{4}|\([0-9]{3}+\)\s[0-9]{3}+\-[0-9]{4}|[0-9]{3}+\-[0-9]{4}|[0-9]{7})"

# Date
dateFormat="^[0-3]{1}[0-9]{1}|\/|[0-1]{1}[1-9]{1}|\/|[0-9]{4}"


# See if the use has initalize the directory

echo "Lets check to see if your in a working directory..."
if [[ $(ls -a | grep -E "^(.git)+$") ]];
 then
  # If there is a .git folder then...
    echo "This is your working git repository"
    sleep 1

  
    while : 
    do

      # Askes User if they want to add a file to staging
        echo "Do you want to add a file to the staging phase?(yes/no)"
        read -r ans;
        if [[ $ans = "yes" || $ans = "y" ]];
         then
          # Checking for sensitive information
            echo "Enter file Path:"
            read path;

          # Emails
            emailData=$(grep -oe "[a-zA-Z0-9._]\+@[a-zA-Z]\+.[a-zA-Z]\+" $path)
            echo "Emails: "
            echo -e "$emailData\n"

         # Telephone Numbers
           telephoneData=$(grep -P "^((\([0-9]{3}\) )|([0-9]{3}\-))[0-9]{3}\-[0-9]{4}$" $path)
           echo "Telephone number: "
           echo -e "$telephoneData\n"

         # SSN Numbers
           ssnData=$(grep -P "^(?!666|000|9\\d{2})\\d{3}-(?!00)\\d{2}-(?!0{4})\\d{4}$" $path)
           echo "SSN number: "
           echo -e "$ssnData"

         # Adding a file to the commit phase and committing the file
           echo "Do you want to add this file with sensitive data to the staging phase?(yes/no)"
           read -r stagingans;

             if [[ $stagingans = "yes" || $stagingans = "y" ]];
              then
              # Add the file to the staging phase
              git add $path
              
              # Commiting the file
              echo "Do you want to commit this file(yes/no)"
              read -r commit;

              if [[ $commit = "yes" || $commit = "y" ]];
               then
                # Commit statement
                echo "Type out the commit statement: "
                read -r statement;

                # Commit the changes
                git commit -m ""$statement""

                # Pushing the file to the github repo
                echo "Do you want to push to you github repo(yes/no)"
                read push;

                if [[ $push = "yes" || $push = "y" ]];
                 then
                  # Which branch you pushing to
                  echo "which branch are you pushing to: "
                  read branch; 

                  # Push to the repo (If it is set up already)
                  git push -u origin $branch

                 else
                 sleep 1
                 break
                fi


               else
                sleep 1
                break
              fi


              else
              echo "Do you want to add another file to the staging phase?(yes/no)"
              read -r ans2;

              if [[ $ans2 = "yes" || $ans2 = "y" ]];
               then
               # Add the file to the staging phase
                 git add $path
              
               # Commiting the file
                 echo "Do you want to commit this file(yes/no)"
                 read -r commit2;

                 if [[ $commit2 = "yes" || $commit2 = "y" ]];
               then
                # Commit statement
                echo "Type out the commit statement: "
                read -r statement;

                # Commit the changes
                git commit -m ""$statement""

                # Pushing the file to the github repo
                echo "Do you want to push to you github repo(yes/no)"
                read push2;

                if [[ $push2 = "yes" || $push2 = "y" ]];
                 then
                  # Which branch you pushing to
                  echo "which branch are you pushing to: "
                  read branch2; 

                  # Push to the repo (If it is set up already)
                  git push -u origin $branch2

                 else
                 sleep 1
                 break
                fi

               else
                sleep 1
                break
              fi


               else
               sleep 1
               break
              fi

            fi

         else
         sleep 1
         break
        fi 

    done

 else
  # If there isn't a .git folder
    echo "You are not in a working git folder...."
    echo "Please use this script in a working git directory "
    sleep 1
    exit 1
fi

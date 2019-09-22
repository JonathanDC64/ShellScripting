#!/bin/bash

# Ensure that the user is the root user
# If the UID is 0, it is the root user
if [[ "$UID" -ne 0 ]]
then
    echo "You need to be the root user to run this script"
    exit 1
fi

# Ask for the username
read -p "Please enter the desired Username: " USER_NAME

# Ask for the name
read -p "Please enter your Full Name: " FULL_NAME

# Ask for the password
read -p "Please enter your desired initial password: " PASSWORD

# Create the user with the supplied information
useradd -c "${FULL_NAME}" -m "${USER_NAME}"

if [[ "${?}" -ne 0 ]]
then
    echo "There was an error while trying to execute useradd. Exit code ${?}"
    exit 1
fi

# Set the users initial password
echo $PASSWORD | passwd --stdin $USER_NAME

# Force password change on first login.
passwd -e ${USER_NAME}

# Output all supplied info
echo "Username:"
echo "${USER_NAME}"
echo ""
echo "Password:"
echo "${PASSWORD}"
echo ""
echo "Host:"
echo $(whoami)

exit 0
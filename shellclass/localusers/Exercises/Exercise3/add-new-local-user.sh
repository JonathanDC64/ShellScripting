#!/bin/bash

# Ensure that the user is the root user
# If the UID is 0, it is the root user
if [[ "$UID" -ne 0 ]]
then
    echo "You need to be the root user to run this script"
    exit 1
fi

# Check if argument for the username is present
if [[ "$#" -lt 1 ]]
then
    echo "Usage: ${0} USER_NAME [COMMENTS]..."
    exit 1
fi

# Store the username parameter
USER_NAME="${1}"

# shift so that remaining parameters are the comments
shift

# Use "${*}" to combine remaining parameters into a space delimeted string
COMMENTS="${*}"

# Generate a password
PASSWORD=$(date +%s%N | sha256sum | head -c48)

# Create the user with the supplied information
useradd -c "${COMMENTS}" -m "${USER_NAME}"

USER_ADD_EXIT_CODE="${?}"

# Check if the user was successfully added
if [[ "${USER_ADD_EXIT_CODE}" -ne 0 ]]
then
    echo "There was an error while trying to execute useradd. Exit code ${USER_ADD_EXIT_CODE}"
    exit 1
fi

# Set the users initial password
echo $PASSWORD | passwd --stdin $USER_NAME

PASSWD_EXIT_CODE="${?}"

# Check if the password was successfully set
if [[ "${PASSWD_EXIT_CODE}" -ne 0 ]]
then
    echo "There was an error while trying to execute passwd. Exit code ${PASSWD_EXIT_CODE}"
    exit 1
fi

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
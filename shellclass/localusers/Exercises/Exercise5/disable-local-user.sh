#!/bin/bash

function log_error() {
    local MESSAGE="${@}"
    echo "${MESSAGE}" 1>&2
}

function exit_code_message() {
    local STATUS="${?}"
    local MESSAGE="${@}"
    if [[ "${STATUS}" -ne 0 ]]
    then
        log_error "${MESSAGE}"
    fi

    exit 1
}

function usage() {
    echo "Usage: ${0} [-dra] USER_NAME..."  1>&2
    echo 'Delete multiple accounts.' 1>&2
    echo '  -d    Deletes accounts instead of disabling them.' 1>&2
    echo '  -r    Removes the home directory associated with the account(s).' 1>&2
    echo '  -a    Archives the home directory associated with the account.' 1>&2

    exit 1

}

readonly ARCHIVE_PATH="/archives"

# Must be root
if [[ "${UID}" -ne 0 ]]
then
    log_error 'You must use sudo or be the root user to execute this script.'
    exit 1
fi


while getopts dra OPTION
do
    case ${OPTION} in
        d) DELETE='true' ;;
        r) REMOVE_HOME='true' ;;
        a) RCHIVE='true' ;;
        ?) usage ;;
    esac
done

shift $(( ${OPTIND} - 1 ))

# Make sure at least one username is supplied
if [[ "$#" -eq 0 ]]
then
    usage
fi

# Get all supplied usernames
USER_NAMES="${@}"

# Create directory if it doesnt exist. Throw away existing directory error.
[ ! -d "${ARCHIVE_PATH}" ] && mkdir "${ARCHIVE_PATH}" 2> /dev/null

for USER_NAME in $USER_NAMES
do
    echo "Processing user : ${USER_NAME}"
    USER_ID=$(id -u ${USER_NAME})

    if [[ "${USER_ID}" -ge 1000 ]]
    then

        if [[ "${ARCHIVE}" = 'true' ]]
        then
            tar -cf "${ARCHIVE_PATH}/${USER_NAME}_home.tar" "/home/${USER_NAME}" 2> /dev/null
            exit_code_message "Failed to archive home directory for user ${USER_NAME}."
        fi

        if [[ "${REMOVE_HOME}" = 'true' ]]
        then
            rm -r "/home/${USER_NAME}/" 2> /dev/null
            exit_code_message "Failed to remove home directory for user ${USER_NAME}."
        fi
        
        if [[ "${DELETE}" = 'true' ]]
        then
            userdel "${USER_NAME}" 2> /dev/null
            exit_code_message "Failed to delete user ${USER_NAME}."
        else
            chage -E 0 "${USER_NAME}"
            exit_code_message "Failed to lock user account ${USER_NAME}."
        fi
    else
        log_error "Cannot remove user ${Username} with UID ${USER_ID} because its under 1000." 1>&2
        exit 1
    fi
done

exit 0
#!/bin/bash

# function log() {
#     local VERBOSE="${1}"
#     shift
#     local MESSAGE="${@}" # local means it only exists within the scope of the function
#     if [[ "${VERBOSE}" = 'true' ]]
#     then
#         echo "${MESSAGE}"
#     fi
# }
# 
# log true 'Hello!'
# log true 'This is fun!'


function log() {
    # This function sends a message to syslog and to standard output if VERBOSE is true.

    local MESSAGE="${@}" # local means it only exists within the scope of the function
    if [[ "${VERBOSE}" = 'true' ]]
    then
        echo "${MESSAGE}"
    fi
    logger -t "$(basename ${0})" "${MESSAGE}"
}

function backup_file() {
    #This function creates a backup of a file. returns non-zero status on error

    local FILE="${1}"

    # Make sure the file exists.
    if [[ -f "${FILE}" ]]
    then
        local BACKUP_FILE="/var/tmp/$(basename ${FILE}).$(date +%F-%N)"
        log "Backing up ${FILE} to ${BACKUP_FILE}."

        # the exit status of the function will be the exit status of the cp command.
        cp -p ${FILE} ${BACKUP_FILE} # -p preserve timestamps and ownership
    else
        # The file does not exist, so return a non-zero exit status.
        return 1
    fi
}


readonly VERBOSE='true'
log 'Hello!'
log 'This is fun!'

backup_file '/etc/passwd'

# Make a decision based on the exit status

if [[ "${?}" -eq 0 ]]
then
    log 'File backup succeeded!'
    exit 0
else
    log 'File backup failed!'
    exit 1
fi
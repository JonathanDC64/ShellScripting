#!/bin/bash

function usage() {
    echo "Usage: ${0} [-nsv] [-f FILE] COMMAND" 1>&2
    echo "Execute a command on the supplied list of servers." 1>&2
    echo "-f FILE   Override default server list file (/vagrant/servers)" 1>&2
    echo "-n        Dry run, shows commands without executing them." 1>&2
    echo "-s        Run command with superuser privileges on remote server." 1>&2
    echo "-v        Verbose mode."  1>&2

    exit 1
}

# Must be executed without root priviledge
if [[ ${UID} -eq 0 ]]
then
    echo "You must not be root when executing this script, use -s instead." 1>&2
    usage
fi

FILE="/vagrant/servers"

while getopts f:nsv OPTION 
do
    case ${OPTION} in
        f) FILE=${OPTARG} ;;
        n) DRY_RUN='true' ;;
        s) SUDO='true' ;;
        v) VERBOSE='true' ;;
        ?) usage ;;
    esac
done

# Remove the options while leaving the remaining arguments.
shift "$(( OPTIND - 1 ))"


# Check if there are any remaining parameters after shift
if [[ "$#" -lt 1 ]]
then
    usage
fi

# Make sure the SERVER_LIST file exists.
if [[ ! -e "${FILE}" ]]
then
    echo "Cannot open server list file ${FILE}." >&2
    exit 1
fi

COMMAND="${@}"

if [[ "${SUDO}" = 'true' ]]
then
    COMMAND="sudo ${COMMAND}"
fi

EXIT_STATUS='0'

for SERVER in $(cat ${FILE})
do
    CURRENT_COMMAND="ssh -o ConnectTimeout=2 ${SERVER} ${COMMAND}"
    if [[ "${VERBOSE}" = 'true' ]]
    then
        echo "${SERVER}";
    fi

    if [[ "${DRY_RUN}" = 'true' ]]
    then
        echo "DRY RUN: ${CURRENT_COMMAND}"
    else
        ${CURRENT_COMMAND}
        EXIT_STATUS="${?}"
        if [[ "${EXIT_STATUS}" -ne 0 ]]
        then
            echo "Command '${COMMAND}' has failed on server '${SERVER}'" 1>&2
        fi
    fi
done

exit ${EXIT_STATUS}
#!/bin/bash

# This script pings a list of servers and reports their status

SEVER_FILE='/vagrant/servers'

if [[ ! -e ${SEVER_FILE} ]]
then
    echo "Cannot open ${SEVER_FILE}." 1>&2
    exit 1
fi

for SERVER in $(cat ${SEVER_FILE})
do
    echo "Pinging ${SERVER}"
    ping -c 1 ${SERVER} &> /dev/null

    if [[ "${?}" -ne 0 ]]
    then
        echo "${SERVER} down."
    else
        echo "${SERVER} up."
    fi
done
#!/bin/bash

# This script demonstrates the case statement.

# if [[ "${1}" = 'start' ]]
# then
#     echo 'tarting'
# elif [[ "${1}" = 'stop' ]]
# then
#     echo 'Stoping'
# elif [[ "${1}" = 'status' ]]
# then
#     echo 'Status:'
# else
#     echo 'Supply a valid option.'
#     exit 1
# fi

case "${1}" in
    'start')
        echo 'Starting.'
        ;;
    'stop')
        echo 'Stoping.'
        ;;
    'status'|'state'|'--status'|'--state') # or
        echo 'Status:'
        ;;
    *) # default
        echo 'Supply a valid option'
        exit 1
        ;;
esac


#!/bin/bash

# Make sure at least 1 argument is passed
if [[ "$#" -lt 1 ]]
then
    echo "You must provide a path to a file as an argument." 1>&2
    exit 1
fi

FILE="${1}"

if [[ "${?}" -ne 0 ]]
then
    echo "File ${FILE} cannot be read." 1>&2
    exit 1
fi

#IP_REGEX="[0-9]*[0-9]*[0-9]+\.[0-9]*[0-9]*[0-9]+\.[0-9]*[0-9]*[0-9]+\.[0-9]*[0-9]*[0-9]+"
#IP_LIST=$(cat "${FILE}" | grep -Eo "${IP_REGEX}" | uniq -c | sort -n | awk '$1 >= 10')
IP_LIST=$(grep Failed ${FILE} | awk '{print $(NF - 3)}' | sort | uniq -c | sort -nr | awk '$1 >= 10')

echo "Count,IP,Location"
echo "${IP_LIST}" | while read COUNT IP
do
    LOCATION=$(geoiplookup ${IP} | awk '{print $NF}' )
    echo "${COUNT},${IP},${LOCATION}"
done

exit 0
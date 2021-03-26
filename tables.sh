#!/bin/sh

command="\dt"
if [ ! -z $1 ]; then
    command="\d $1"
fi

IFS=''
while read -r LINE || [ -n "$LINE" ]; do
    command="\d $LINE"
done

export  PGPASSWORD=postgres
psql -U postgres -h 192.168.1.237 selling_svil -c "$command"

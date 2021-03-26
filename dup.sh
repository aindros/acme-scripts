#!/bin/sh

# Duplicate a string

NEWLINE=`printf "\n"`
IFS=''
while read -r line || [ -n "$line" ]; do
    LINES="$LINES"`printf "$line"`"$NEWLINE"
    #echo $line
done

for line in "$LINES"; do
    printf "$line"
done

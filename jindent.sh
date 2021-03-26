#!/bin/sh

if [ -z $1 ]; then
    IFS=''
    while read -r LINE || [ -n "$LINE" ]; do
        CONTENT=$CONTENT`printf "%s\n " "$LINE"`
    done
    CONTENT=`printf "%s" $CONTENT | sed 's/^ //g'`
fi

if [ -z $CONTENT ] && [ ! -z $1 ]; then
    FILENAME="$1"
    cp "$FILENAME" "$FILENAME".orig

    sed -E -f ~/.sed-scripts/java.sed $1 > tmp
    awk -f ~/.awk-scripts/java.awk tmp > $1

    rm tmp
elif [ ! -z $CONTENT ]; then
    CONTENT=`printf "%s" $CONTENT | sed -E -f ~/.sed-scripts/java.sed`
    CONTENT=`printf "%s" $CONTENT | awk -f ~/.awk-scripts/java.awk`
    printf $CONTENT
fi

exit



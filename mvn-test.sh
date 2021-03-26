#!/bin/sh

workingdir=`9p read acme/$winid/tag | head -1 | grep -oE '^/.*src' | sed 's/src//'`
cd $workingdir

tests="$1"

if [ -z "$1" ]; then
    IFS=''
    while read -r LINE || [ -n "$LINE" ]; do
        tests="$LINE"
        break
    done
    classname=`9p read acme/$winid/tag | grep -oE '[A-Za-z]*\.java' | sed 's/.java//' | head -1`
    if [ ! -z $classname ] && [ ! -z $tests ] && [ $tests != $classname ]; then
        tests=$classname'#'$tests
    fi
fi


if [ ! -z "$tests" ]; then
    mvn test -DtrimStackTrace=false -Dtest=$tests
else
    mvn test -DtrimStackTrace=false
fi




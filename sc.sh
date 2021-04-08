#!/bin/sh

homedevel=`echo ~/devel/`
directory=`9p read acme/index | awk '{print "|"$1" "$6}' | grep "|$winid " | awk '{print $2}'`
directory=`echo $directory | sed 's|/[^/]*$||'`
if [ ! -z "`echo $directory | grep -o $homedevel`" ]; then
    directory=`echo $directory | sed "s|$homedevel||"`
    curdir=$homedevel
    for i in `echo $directory | sed 's|/| |g'`; do
        curdir=$curdir$i/
        if [ -f "${curdir}pom.xml" ]; then
            rootdir=$curdir
            break
        fi
    done
fi

rootdir=${rootdir}src

if [ -z $1 ]; then
    IFS=''
    while read -r LINE || [ -n "$LINE" ]; do
        FOUND=`find $rootdir -name "*$LINE*"`
        echo $FOUND
        exit
    done
else
    find $rootdir -name "*$1*"
fi



#!/bin/sh

fn_build()
{
    t1=`date +%s`
    mvn compile test-compile -l $logfile
    # date -r $logfile +%s
    t2=`date +%s`
    total=`expr $t2 - $t1`
}

logfile=target/build.log

t0=`for file in $(find src -type f); do date -r "$file" +%s; done | sort -r | uniq | head -1`

if [ ! -f $logfile ]; then
    fn_build
fi

tb=`date -r $logfile +%s`

if [ $t0 -gt $tb ]; then
    fn_build
fi

cat $logfile | \
    grep -oE "^\[ERROR\].*\.java.*\]" | \
    sed -E 's/:\[(.*),.*/:\1/' | \
    sort | uniq

if [ ! -z $total ]; then
    echo "$total seconds"
fi
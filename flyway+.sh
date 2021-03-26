#!/bin/sh

directory=$(search V*.sql | grep -Eo ".*/common/" | head -1)
last_version=$(search V*.sql | grep src/main | sed 's|.*/||g' | grep -E '^V' | sed 's/__.*//' | sort -V -u -r | head -1)

v1=`echo $last_version | sed 's/V//' | sed -E 's/\..*//'`
v2=`echo $last_version | sed 's/V//' | sed -E 's/[^\.]+\.(.*)\..*/\1/'`
v3=`echo $last_version | sed 's/V//' | sed -E 's/.*\.(.*)$/\1/'`

if [ -z $1 ]; then
    v3=`expr $v3 + 1`
else
    case $1 in
        M)
            v1=`expr $v1 + 1`
            v2=0
            v3=0
        ;;
        m)
            v2=`expr $v2 + 1`
            v3=0
        ;;
    esac
fi

new_version="V$v1.$v2.$v3"
echo $last_version" -> "$new_version
name=$directory$new_version"__New_migration.sql"

echo -n "" | 9p write acme/new/body
last=$(9p ls acme | sort -g | tail -n 1)
echo "name $name" | 9p write acme/$last/ctl


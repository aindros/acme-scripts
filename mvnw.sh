#!/bin/sh

print()
{
    echo [`date +"%Y-%m-%d %H:%M"`] "$1"
}

for arg in "$@"
do
    case $arg in
        compile)
            descr="Compilation"
            action=compile
            ;;
        test)
            descr="Testing"
            action="test"
            noTrim="-DtrimStackTrace=false"
            shift
            ;;
        -Dtest=*)
            #params="${arg#*=}"
            params="$arg"
            shift
            ;;
        -v)
            verbose=1
            ;;
    esac
done



T0=`date +"%s"`

print "Starting Maven $descr"
echo

IFS=''

if [ "$action" == "compile" ]; then
    OUTPUT=$(mvn compile \
                 | while read line; do echo $line|grep ERROR; done \
                 | grep -E "\[ERROR\] .*`pwd`" \
                 | sed 's/^\[ERROR\] //g' \
                 | sed 's/\[//g' \
                 | sed 's/,/:/g' \
                 | sed -E 's/\] (.*)$/ \[\1\]/g' \
                 | sort \
                 | uniq)
    if [ ! -z $verbose ]; then
        echo $OUTPUT
    else
        echo $OUTPUT | sed -E 's|\[.*\]||g'
    fi
    T1=`date +"%s"`
    TT=`expr $T1 - $T0`

    echo
    print "Maven $descr has endend. Time elapsed: $TT seconds"

    if [ ! -z "$OUTPUT" ]; then
        MSG="With errors."
    else
        MSG="Successful!"
    fi

    MSG=$MSG" Time elapsed: $TT seconds"

    notify-send "$descr completed" "$MSG"
else
    mvn $action $noTrim $params
fi


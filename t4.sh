#!/bin/sh

lastch()
{
    #echo -e "$1" | sed -E 's/.*(.)$/\1/'
    #echo $1 | tr '\n' "OL"
    #echo $1 | grep -oE ".$"
    if [ "$1" =~ /a$/ ]; then
	fi
}
#lastch `printf "ciao\n"`
#exit

if [ -z $1 ]; then
    N=4
else
    N=$1
fi

OUT=`echo | awk '{for (i = 0; i < '$N'; i++) print "#";}'`
SPACES=`echo $OUT | sed 's/ //g' | sed 's/#/ /g'`

TAB=$(printf '\t')

NEWLINE=`printf "\n"`

IFS=''
while read -r LINE || [ -n "$LINE" ]; do
    if [ "$NEWLINE" == "$LINE" ]; then
        printf "\n"
    elif [ -n "$LINE" ]; then
        printf "%s\n" "$LINE" | sed "s/${TAB}/$SPACES/g"
    else
        printf "%s" "$LINE" | sed "s/${TAB}/$SPACES/g"
    fi
done

exit
echo -n "1,$" | 9p write acme/$winid/addr
9p read acme/$winid/body | expand -t 4 | 9p write acme/$winid/data

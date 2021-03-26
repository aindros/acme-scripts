#!/bin/sh

makeprop()
{
    SCOPE=`echo $1 | sed -E 's|(.).*|\1|'`
    ATTRIBUTE=`echo $1 $2 | sed "s|^$SCOPE||"`

    case "$SCOPE" in
        '~')
            SCOPE=default
            ;;
        '-')
            SCOPE=private
            ;;
        '+')
            SCOPE=public
            ;;
        '?')
            SCOPE=protected
            ;;
        *)
            ATTRIBUTE=$SCOPE$ATTRIBUTE
            SCOPE=private
            ;;
    esac

    echo -n "@Getter @Setter $SCOPE $ATTRIBUTE;"
}


IFS=''
while read -r line || [ -n "$line" ]; do
    makeprop $line
    exit
done

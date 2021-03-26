#!/bin/sh

FONTSRV=`ps | grep fontsrv | grep -v grep | awk '{print $5}'`

if [ -z "$FONTSRV" ]; then
    echo "Avvio in corso di fontsrv"
    fontsrv &
fi

#acme -a -f /mnt/font/'DejaVuSansMono'/8a/font &
acme -a -f /mnt/font/DejaVuSansMono/9a/font &
#acme -a -f /mnt/font/'Courier'/9a/font &

#echo ">search >find-class mvnwc -v |c |uc" | 9p write acme/new/tag

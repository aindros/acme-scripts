#!/bin/sh

__start_fontsrv()
{
	# If you have problems, such as the /mnt/font is esmpty or has not been created, try launching the command with the
	# `-m` flag, like the following:
	#     fontsrv -m /mnt/font

	FONTSRV=`ps | grep fontsrv | grep -v grep | awk '{print $5}'`

	if [ -z "$FONTSRV" ]; then
		echo 'Executing `fontsrv` in background...'
		fontsrv &
	fi
}

# If you need `fontsrv`, uncomment the following line:
#__start_fontsrv

#acme -a -f /mnt/font/'Courier'/9a/font &
#acme -a -f /mnt/font/'DejaVuSansMono'/8a/font &
acme -a -f /mnt/font/DejaVuSansMono/9a/font &

#echo ">search >find-class mvnwc -v |c |uc" | 9p write acme/new/tag

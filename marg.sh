#!/bin/sh

if [ -z $1 ]; then
	M=80
else
	M=$1
fi

printf '\n%'$M's' "|" | 9p write acme/$winid/tag

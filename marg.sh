#!/bin/sh

if [ -z $1 ]; then
	M=80
else
	M=$1
fi

printf '%'$M's' "|"

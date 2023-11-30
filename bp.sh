#!/bin/sh

DIR=$(dirname `realpath $0`)

. $DIR/acme.inc

fn_exec_cmd_tag "Edit ="
WIN_ERR_ID=$(9p read acme/index | awk '{print $6" "$1}' | grep -E '^\+Errors' | awk '{print $2}')

file=$(9p read acme/$WIN_ERR_ID/body | tail -1)
extension=$(echo $file | sed -E 's/.*\.(.*):[0-9]*$/\1/g')

if [ $extension = 'java' ]; then
	CUR_DIR=`pwd`
	START_DIR=$CUR_DIR
	while [ $CUR_DIR != '/' ] && [ ! -f pom.xml ]; do
		cd ..
		CUR_DIR=$(pwd)
	done
	dir_name=${CUR_DIR##*/}

	BREAKPOINT=$(echo $file | sed -E "s|.*$dir_name/src/.*/java/(.*)\.java|\1|g" | tr '/' '.')
	echo 'stop at '$BREAKPOINT
	echo 'stop at '$BREAKPOINT >> jdb.lines

	cd $START_DIR
fi

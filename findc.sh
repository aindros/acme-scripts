#!/bin/sh

# This script find a Java Class inside the Maven project.

_get_dir()
{
	if [ ! -z $winid ]; then
		9p read acme/index                 \
				| awk '{print "|"$1" "$6}' \
				| grep "|$winid "          \
				| awk '{print $2}'         \
				| sed 's|/[^/]*$||'        \
				| grep -oE '/.*'
	else
		pwd
	fi
}

_reverse()
{
	local rev=
	for i in $@; do
		rev="$i $rev"
	done

	echo $rev
}

_find_pom()
{
	# Navigating to the pom.xml
	curdir=$directory
	for i in $(_reverse $(echo $directory | sed 's/\// /g')); do
		if [ -f "$curdir/pom.xml" ]; then
			echo $curdir
			return
		fi
		curdir=$(echo $curdir | sed "s/\/$i$//g")
	done
}

_get_class_name()
{
	if [ -z $1 ]; then
		IFS=''
		while read -r LINE || [ -n "$LINE" ]; do
			echo $LINE
			return
		done
	else
		echo $1
	fi
}

directory=$(_get_dir)

if [ -z "$directory" ]; then
	echo "The directory is empty. Exit."
	exit 1
fi

rootdir=$(_find_pom)
classname=$(_get_class_name $1)

find $rootdir -name $classname.java

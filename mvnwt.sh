#!/bin/sh

if [ -z $1 ]; then
    mvnw test
else
    mvnw test -Dtest=$1
fi


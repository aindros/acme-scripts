#!/bin/sh

echo -n "1,$" | 9p write acme/$winid/addr
printf "" | 9p write acme/$winid/data

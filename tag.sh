#!/bin/sh

CMD=`echo $0 | sed 's/.*\///g'`

TAG="Get $CMD"

# Clear the tag before adding the new one
echo cleartag | 9p write acme/$winid/ctl

printf "\n$TAG\nEdit" | 9p write acme/$winid/tag

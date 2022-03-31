#!/bin/sh

TAGS="dtag clbuff atags >finde >findt >findc >searchc win gbranch"

# Clear the tag before adding the new ones
echo cleartag | 9p write acme/$winid/ctl

printf "\n$TAGS" | 9p write acme/$winid/tag

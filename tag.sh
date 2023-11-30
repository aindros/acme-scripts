#!/bin/sh

CMD=`echo $0 | sed 's/.*\///g'`

EDIT_TAG='(Edit =)'
TAG="Get $CMD |c+ |c- |latin >ffunc m80 m120 >java-import |java-package >find-file >find-class |qentity |lower |upper >who-implement-me"
DEBUG_TAG='bp'

# Clear the tag before adding the new one
echo cleartag | 9p write acme/$winid/ctl

printf "\n$EDIT_TAG\n$TAG\n$DEBUG_TAG\nEdit" | 9p write acme/$winid/tag

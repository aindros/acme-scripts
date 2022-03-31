#!/bin/sh

TAGS="ftag Get |s |c+ |c- >findt >finde >findc >searchc >import |package |property <sver gbranch |upper |lower |latin |i+ |i-"
MARGIN="//MARGINE                                                                                                              |"

# Clear the tag before adding the new ones
echo cleartag | 9p write acme/$winid/ctl

printf "\n$TAGS\nEdit\n$MARGIN" | 9p write acme/$winid/tag

#!/bin/sh

find `pwd` -type f -name "*.sh" -exec ln -s {} ~/bin/acme/ ';'
find ~/bin/acme/ -type l -name "*.sh" -exec renamex -s/.sh// '{}' \;
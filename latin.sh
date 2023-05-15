#!/bin/sh

sed 's/a`/à/g;s/e`/è/g;s/i`/ì/g;s/o`/ò/g;s/u`/ù/g' |
	sed 's/A`/À/g;s/E`/È/g;s/I`/Ì/g;s/O`/Ò/g;s/U`/Ù/g' |
	sed "s/a'/á/g;s/e'/é/g;s/i'/í/g;s/o'/ó/g;s/u'/ú/g" |
	sed "s/A'/Á/g;s/E'/É/g;s/I'/Í/g;s/O'/Ó/g;s/U'/Ú/g"

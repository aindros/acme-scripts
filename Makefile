all:
	echo "Usage: make install"

install: uninstall
	chmod +x *sh
	find `pwd` -type f -name "*.sh" -exec ln -s {} ~/bin/acme/ ';'
	find ~/bin/acme/ -type l -name "*.sh" -exec renamex -s/.sh// '{}' \;

uninstall:
	rm -f ~/bin/acme/*

INSTALL_DIR=~/bin/acme

SRC != ls -1 *.sh
OBJ  = ${SRC:.sh=}
TGT  = ${OBJ:%=${INSTALL_DIR}/%}

all: ${OBJ}

.sh:
	ln -sf `realpath $<` $@

clean:
	rm -f ${OBJ}

install: ${OBJ}
	mv ${OBJ} ${INSTALL_DIR}/

uninstall:
	rm -f ${TGT}

INSTALL_DIR=~/bin/acme
BUILD_DIR=build

.SUFFIXES: .sh .o

SOURCES!=ls *.sh
OBJECTS=${SOURCES:.sh=}
D!=echo $(OBJECTS) | sed "s|^|$(INSTALL_DIR)/|g" | sed "s| | $(INSTALL_DIR)/|g"

.sh:
	chmod +x ${.IMPSRC}
	ln -s ${.CURDIR}/${.IMPSRC} ${.TARGET}

build: $(OBJECTS)

clean:
	find ${.CURDIR} -type l -exec rm -f '{}' \;

install: build
	find ${.CURDIR} -type l -exec cp -R -P '{}' ${INSTALL_DIR}/ \;

uninstall:
	rm -f $(D)

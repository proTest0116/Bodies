PYTHON = python
PYDOC = pydoc
PYCS = $(shell find . -name "*.pyc")
PYOPENGL = PyOpenGL-3.1.0
OPENGL = OpenGL
BASE = Bodies
EXT = py
TARGET = $(BASE).$(EXT)
PACKAGE = jp
INSTDIR = Bodies.app/Contents/Resources/Python/
NAME = Bodies
DATA = dragon.txt wasp.txt bunny.ply penguin.txt oni.txt baby.txt

all:
		@if [ !	-e $(PYOPENGL) ] ; then	unzip $(PYOPENGL).zip ;	fi
		@if	[ !	-e $(OPENGL) ] ; then ln -s	$(PYOPENGL)/$(OPENGL) $(OPENGL) ; fi
clean:
		@for each in ${PYCS} ; do echo "rm -f $${each}"	; rm -f	$${each} ; done
		if [ -e	$(INSTDIR) ] ; then	rm	-f -r $(INSTDIR) ; fi
		rm -f MANIFEST $(DATA)
wipe:
		if [ -e	$(OPENGL) ]	; then rm -f $(OPENGL) ; fi
		if [ -e	$(PYOPENGL)	] ;	then rm	-f -r $(PYOPENGL) ;	fi
test: all
		$(PYTHON) $(TARGET)
install: all
		if [ ! -e $(INSTDIR) ] ; then mkdir	$(INSTDIR) ; fi
		if [ ! -e $(INSTDIR)/$(PYOPENGL) ] ; then cp -p -r $(PYOPENGL) $(INSTDIR); fi
		if [ ! -e $(INSTDIR)/$(TARGET) ] ; then cp -p -r $(TARGET) $(INSTDIR); fi
		if [ ! -e $(INSTDIR)/$(PACKAGE) ] ; then cp -p -r $(PACKAGE) $(INSTDIR); fi

zip:	clean wipe
		(cd	.. ; zip -r	$(NAME).zip	./$(NAME)/)
sdist:	clean
		 $(PYTHON) setup.py	sdist
pydoc:	clean
		 (sleep	3 ; open http://localhost:9999/$(PACKAGE).html)	& $(PYDOC) -p 9999
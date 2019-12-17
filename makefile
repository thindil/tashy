# Copyright (C) 1997-2000 Terry J. Westley
# Copyright (C) Simon Wright <simon@pushface.org>

# This package is free software; you can redistribute it and/or
# modify it under terms of the GNU General Public License as
# published by the Free Software Foundation; either version 2, or
# (at your option) any later version. This package is distributed in
# the hope that it will be useful, but WITHOUT ANY WARRANTY; without
# even the implied warranty of MERCHANTABILITY or FITNESS FOR A
# PARTICULAR PURPOSE. See the GNU General Public License for more
# details. You should have received a copy of the GNU General Public
# License distributed with this package; see file COPYING.  If not,
# write to the Free Software Foundation, 59 Temple Place - Suite
# 330, Boston, MA 02111-1307, USA.

# This makefile builds the TASH library for either Unix or Windows. To
# build correctly, you must have previously run the setup program,
# setup.tcl, in this directory. This will create the makeconf file
# included below.

# Build and test TASH by executing "make all test" in this directory.
# Or, you can cd into each of the subdirectories, src, demos, tests,
# and apps, and execute "make all test" in each one in turn.

# If you want to install the TASH library elsewhere, copy the contents
# of ../lib and ../include directory to the install directory.

include makeconf

SUBDIRS = src tests demos

FOR_ALL_SUBUNITS = +for i in ${SUBDIRS}; do ${MAKE} -w -C $${i} $@ || exit 1; done

all:
	$(FOR_ALL_SUBUNITS)

test:
	$(FOR_ALL_SUBUNITS)

clean:
	$(FOR_ALL_SUBUNITS)
	rm -f makeconf tash_options.gpr

# Rule "install" does not depend on rule "all":
# "make install" should be executed as root but not necessarily "make all".
install: install-static

install-static:
	gprinstall					\
	  -f						\
	  --prefix=$(prefix)				\
	  -P tashy.gpr					\
	  --install-name=tashy				\
	  --project-subdir=$(GPR_INSTALL_SUBDIR)	\
	  -XLIBRARY_TYPE=static				\
	  --mode=dev					\
	  --create-missing-dirs				\
	  --build-var=LIBRARY_TYPE			\
	  --build-name=static

# Rules for constructing a distribution.

DATE = $(shell date +%Y%m%d)
DIST = tashy-$(TASH_VERSION)-$(TASH_RELEASE)-$(DATE)

SRC = 						\
  COPYING					\
  INSTALL					\
  README					\
  makefile					\
  setup.tcl					\
  tashy.gpr

dist: dist-src dist-zip dist-tgz

dist-src: $(DIST)
dist-zip: $(DIST).zip
dist-tgz: $(DIST).tgz

$(DIST):
	-rm -rf $(DIST)
	mkdir $(DIST)
	cp $(SRC) $(DIST)/
	for s in $(SUBDIRS); do \
	  $(MAKE) -C $$s DIST=../$(DIST) dist; \
	done

$(DIST).zip: dist-src
	-rm $@
	zip -r $@ $(DIST)

$(DIST).tgz: dist-src
	-rm $@
	tar zcvf $@ $(DIST)

.PHONY: clean dist dist-src dist-zip dist-tgz force install test

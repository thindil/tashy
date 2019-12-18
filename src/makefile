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

# This makefile builds the TASH library for either Unix or Windows.
# To build correctly, you must have previously run the setup program,
# setup.tcl, in the main TASH directory.  This will create the makeconf
# file included below.

# Build TASH by simply executing "make" in this directory.

# Next, cd to ../tests and run "make all test" to build and run more
# comprehensive TASH tests.

# To build and run the demos, cd to ../demos and run "make all test".

# To build and run the sample application programs, cd to ../apps and
# run "make all test" again.

all::

include ../makeconf

# At least for Mac OS X, gnatmake doesn't build shared libraries
# correctly (at GNAT GPL 2011); use gprbuild.
GPRBUILD ?= gprbuild
GPRCLEAN ?= gprclean
CC       ?= gcc

TASH_GPR ?= ../tashy.gpr

GEN_SRC = tcl_record_sizes.ads

TCL_ADA_SRC =					\
  cargv.adb					\
  cargv.ads					\
  chelper.adb					\
  chelper.ads					\
  tcl-ada.adb					\
  tcl-ada.ads					\
  tcl-async.adb					\
  tcl-async.ads					\
  tcl-tk-ada.adb				\
  tcl-tk-ada.ads				\
  tcl-tk.adb					\
  tcl-tk.ads					\
  tcl.adb					\
  tcl.ads

TCL_C_SRC = tclmacro.c tkmacro.c

ADA_SRC = $(TCL_ADA_SRC) $(GEN_SRC)
C_SRC = $(TCL_C_SRC)

SCRIPTS =					\
  makefile					\
  tcl_record_sizes.tcl

TASH_GPR = ../tashy.gpr

all:: build

build:: tcl_record_sizes.ads

tcl_record_sizes.ads: tcl_record_sizes$(EXE)
	./$< >$@

tcl_record_sizes$(EXE): tcl_record_sizes.c
	$(CC) $(TCL_INCLUDE) -o $@ $<

tcl_record_sizes.c: tcl_record_sizes.tcl
	tclsh $< >$@

build:: lib-static

lib-static:
	$(GPRBUILD) -p -P $(TASH_GPR) $<

# To distribute source ...
dist:
	mkdir $(DIST)/src
	cp $(TCL_ADA_SRC) $(TASH_ADA_SRC) \
	  $(TCL_C_SRC) $(TASH_C_SRC) $(SCRIPTS) $(DIST)/src/

test:
	# no action

clean:
	-$(GPRCLEAN) -P $(TASH_GPR)
	-rm -f *~ \
	  tcl_record_sizes.c tcl_record_sizes$(EXE) tcl_record_sizes.ads

.PHONY: all build clean dist install test lib-static

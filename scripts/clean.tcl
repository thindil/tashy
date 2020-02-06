#!/bin/sh
# the next line restarts using tclsh \
exec tclsh "$0" ${1+"$@"}

exec gprclean -P tashy.gpr -XLIBRARY_TYPE=static
exec gprclean -P tashy.gpr -XLIBRARY_TYPE=relocatable
file delete tash_options.gpr
file delete [file join [pwd] src tcl_record_sizes.ads]

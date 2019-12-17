TASHY is short from Tcl Ada SHell Younger. It is derivate of [TASH](http://tcladashell.sourceforge.net/)

Main differences:

* Unstable, used mostly as playground
* Removed legacy code which not works with newest versions of Tcl/Tk
* Removed creating relocatable version of the library
* More to come

## Build the library from sources

To build you need:

* compiler - GCC with enabled Ada support or (best option) GNAT from:

  https://www.adacore.com/download/

  It is recommended to use GNAT GPL 2019 to compile the program.
  The program does not work with old compilers (like GCC 4.9) since it
  lacks full support for Ada 2012.

* Tcl/Tk library. Should be available in every Linux distribution. For
  Windows it is recommended to use ActiveTcl version:

  https://www.activestate.com/products/tcl/

If you have all the required packages, navigate to the main directory(where
this file is) to compile and type in the console:

1. `./setup.tcl` to setup all configuration needed for compilation
2. `make all` to compile library
3. `make install` to install it with gprinstall which allow use it inside
   GNAT project files. On Unix systems this steps may require root privileges.

## Using the library in your project

If you use a GNAT project file in your project, simply add `with "tashy"` at
beginning of your project file.


## Licenses
TASHY is available under [GPLv2](COPYING) license.

----

That's all for now, as usual, probably I forgot about something important ;)

Bartek thindil Jasicki

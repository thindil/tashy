TASHY is short from Tcl Ada SHell Younger. It is derivate of [TASH](http://tcladashell.sourceforge.net/)

Main differences:

* Unstable, used mostly as playground
* Removed legacy code which not works with newest versions of Tcl/Tk
* Removed creating relocatable version of the library
* Removed tests
* Removed makefiles
* Added [ROBODoc](https://rfsber.home.xs4all.nl/Robo/) documentation
* [And more](CHANGELOG.md)

## Build the library from sources

To build you need:

* compiler - GCC with enabled Ada support or (best option) GNAT from:

  https://www.adacore.com/download/

  It is recommended to use GNAT GPL 2019 to compile the program.
  The program does not work with old compilers (like GCC 4.9) since it
  lacks full support for Ada 2012.

* Tcl/Tk library. Should be available in every Linux distribution. For
  Windows it is recommended to use MagicSplat version:

  https://www.magicsplat.com/tcl-installer/index.html

If you have all the required packages, navigate to the main directory(where
this file is) to compile and type in the console:

1. `scripts/setup.tcl` to setup all configuration needed for compilation.
   On Windows it will be `wish scripts\setup.tcl`.
2. `gprbuild -P tashy.gpr` to compile the library.
3. `gprinstall -P tashy.gpr -p` to install it with gprinstall which allow use
   it inside GNAT project files. On Unix systems this step may require root
   privileges.

If you have installed [Bob](https://github.com/thindil/bob) you can use it in
that way:

1. `bob setup` to setup all configuration needed for compilation.
2. `bob build` to compile the library.
3. `bob install` to install it with gprinstall which allow use
   it inside GNAT project files. On Unix systems this step may require root
   privileges.

To remove all generated/compiled files type in the console:
`scripts/clean.tcl` (on Unix) or `tclsh scripts\clean.tcl` (on Windows).
If you have installed [Bob](https://github.com/thindil/bob) you can type:
`bob clean`

## Using the library in your project

If you use a GNAT project file in your project, simply add `with "tashy"` at
beginning of your project file.

## Versioning

TASHY versioning is in X.Y.Z schema where:

* X.Y are Tcl/Tk version with which TASHY was created and tested. For example,
  version 8.6.5 means that this TASHY was tested with Tcl/Tk 8.6.
* Z is number of release of TASHY for selected Tcl version. Release numbers
  starts from 0. For example, version 8.6.2 means third release of TASHY for
  Tcl/Tk 8.6

## Generating code documentation

To generate (or regenerate) code documentation, you need [ROBODoc](https://rfsber.home.xs4all.nl/Robo/)
If you have it, in main program directory (where this file is) enter terminal
command: `others/generatedocs.tcl`. For more information about this script,
please look [here](https://github.com/thindil/roboada#generatedocstcl). This
version of script have set all default settings for TASHY code. If you have
[Bob](https://github.com/thindil/bob) installed, you can type `bob docs`.

## Contributing to the project

For detailed informations about contributing to the project (bugs reporting,
ideas propositions, code conduct, etc), see [CONTRIBUTING.md](CONTRIBUTING.md)

## Licenses

TASHY is available under [GPLv2](COPYING) license with exception:

As a special exception, if other files instantiate generics from this unit,
or you link this unit with other files to produce an executable, this unit
does not by itself cause the resulting executable to be covered by the GNU
General Public License. This exception does not however invalidate any other
reasons why the executable file might be covered by the GNU Public License.

## TODO

* More widgets to Tcl.Tk.Ada
* More and better code documentation
* Update code to newest Tcl version
* Update code to newest Tk version
* Your proposition :)

----

That's all for now, as usual, probably I forgot about something important ;)

Bartek thindil Jasicki

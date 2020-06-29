## Table of Contents
* [General information](#General-information)
* [Build the library from sources](#Build-the-library-from-sources)
* [Docker images](#Docker-images)
* [Using the library in your project](#Using-the-library-in-your-project)
* [Versioning](#Versioning)
* [Documentation](#Documentation)
* [Generating the code documentation](#Generating-the-code-documentation)
* [Contributing to the project](#Contributing-to-the-project)
* [Licenses](#Licenses)
* [TODO](#TODO)

## General information

TASHY is short from Tcl Ada SHell Younger. It is derivate of [TASH](https://github.com/simonjwright/tcladashell)

**IMPORTANT:** TASHY is not compatible with TASH. Here are many breaking
changes in the code, thus TASHY should be used only with the new code. At
this moment TASHY API should be almost stable. All changes (compared with
TASH too) can be found [in CHANGELOG.md](CHANGELOG.md)

TASHY is the Ada 2012 binding to Tcl/Tk. It allow to use Tcl code in Ada code
and vice versa. Included bindings:

* Tcl - It is the base binding. Allow use Tcl scripts in the Ada code.
  This binding should be complete but have lack of the code documentation. If
  you find that something is missing, please [open an issue](https://github.com/thindil/tashy/issues/new) with it.
* Tk - Requires Tcl binding. Allows use Tk GUI in the Ada code. At this
  moment it is a low level binding - mostly works like standard Tcl/Tk
  commands. Additionally, this binding is still incomplete, but you can
  use any Tk command/widget by `Tcl_Eval` or `Execute_Widget_Command`
  procedures. This is the main focus of the development at this moment.
* Tklib - Requires Tcl and Tk bindings. Allows use additional packages for
  Tk GUI in the Ada code. At this moment it is a low level binding only to
  tooltip package. If you want binding to any other package from this library,
  feel free to [open an issue](https://github.com/thindil/tashy/issues/new) with it.

## Build the library from sources

To build you need:

* compiler - GCC with enabled Ada support or (best option) GNAT from:

  https://www.adacore.com/download/

  It is recommended to use GNAT GPL 2019 to compile the project.
  The project does not work with old compilers (like GCC 4.9) since it
  lacks full support for Ada 2012.

* Tcl/Tk library. Should be available in every Linux distribution. For
  Windows it is recommended to use MagicSplat version:

  https://www.magicsplat.com/tcl-installer/index.html

* If you want Tklib library binding, you will be need this library too. Should
  be available in every Linux distribution. For Windows it is included in the
  MagicSplat version.

If you have all the required packages, navigate to the main directory(where
this file is) to compile and type in the console:

1. `scripts/setup.tcl` to setup all configuration needed for compilation.
   On Windows it will be `wish scripts\setup.tcl`. If you want to use default
   settings (like include all other bindings), you can use auto setup by
   adding parameter `--nogui`. You need to run this script only the first time
   when you compile the library on the selected platform. If you only
   recompile the configured project, skip this step.
2. `gprbuild -P tashy.gpr` to compile the library in static mode. If you want
   to build relocatable version of the library, use command
   `gprbuild -P tashy.gpr -XLIBRARY_TYPE=relocatable`.
3. `gprinstall -P tashy.gpr -p -XLIBRARY_TYPE=static --build-var=LIBRARY_TYPE --build-name=static`
   to install static version of the library with gprinstall which allow use
   it inside GNAT project files. To install also relocatable version of the
   library use command
   `gprinstall -P tashy.gpr -p -XLIBRARY_TYPE=relocatable --build-var=LIBRARY_TYPE --build-name=relocatable`.
   On Unix systems this step may require root privileges.

If you have installed [Bob](https://github.com/thindil/bob) you can use it in
that way:

1. `bob setup` to setup all configuration needed for compilation. If you want
    to use default settings (like include all other bindings), you can use
    auto setup by typing `bob autosetup`. You need to run this command only
    the first time when you compile the library on the selected platform. If
    you only recompile the configured project, skip this step.
2. `bob build` to compile the library in static and relocatable versions on
   Unix and static only on Windows.
3. `bob install` to install the library with gprinstall which allow use it
   inside GNAT project files. On Unix systems this step may require root
   privileges.

To remove all generated/compiled files type in the console:
`scripts/clean.tcl` (on Unix) or `tclsh scripts\clean.tcl` (on Windows).
If you have installed [Bob](https://github.com/thindil/bob) you can type:
`bob clean`

## Docker images
The library (in the static version) is available also as a Docker container with
GNAT GPL version.

* For the development version of the library, you can use this command to
download:

`docker pull thindil/gnat-tashy-devel`

* For the stable version of the library, you can use this command to download:

`docker pull thindil/gnat-tashy`

Full list of all available versions is [here](https://hub.docker.com/repository/registry-1.docker.io/thindil/gnat-tashy/tags?page=1)

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

## Documentation

For the last release, the library code documenation is available online at:

https://thindil.github.io/tashy/

Also, in directory [demos](demos/) you will find some examples of usage of the
library.

## Generating the code documentation

To generate (or regenerate) code documentation, you need [ROBODoc](https://rfsber.home.xs4all.nl/Robo/)
If you have it, in main project directory (where this file is) enter terminal
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

The whole TODO list you can find [here](https://github.com/thindil/tashy/projects/2)

----

That's all for now, as usual, probably I forgot about something important ;)

Bartek thindil Jasicki

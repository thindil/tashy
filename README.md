TASHY is short from Tcl Ada SHell Younger. It is derivate of [TASH](https://github.com/simonjwright/tcladashell)

**IMPORTANT:** TASHY is not compatible with TASH. Here are many breaking
changes in the code, thus TASHY should be used only with the new code. At
this moment TASHY API is stable. All changes (compared with TASH too) can
be found [in CHANGELOG.md](https://www.laeran.pl/repositories/tashy/file?name=CHANGELOG.md&ci=tip).  If you read this
file on Github: **please don't send pull requests here**. All will be
automatically closed. Any code propositions should go to the [Fossil](https://www.laeran.pl/repositories/tashy)
repository.

**INFO:** This project is no longer maintained. Feel free to clone it and take care about it.

TASHY is the Ada 2012 binding to Tcl/Tk. It allows using Tcl code in Ada code
and vice versa. Included bindings:

* Tcl: It is the base binding. Allow use Tcl scripts in the Ada code.
  This binding should be complete but have lack of the code documentation. If
  you find that something is missing, please [open a ticket](https://www.laeran.pl/repositories/tashy/tktnew) with it.
* Tk: Requires Tcl binding. Allows use Tk GUI in the Ada code. At this
  moment it is a low level binding: mostly works like standard Tcl/Tk
  commands. You can use any Tk command/widget by `Tcl_Eval` or
  `Execute_Widget_Command` procedures. If you find that something is
  missing, please [open a ticket](https://www.laeran.pl/repositories/tashy/tktnew) with it.
* Tklib: Requires Tcl and Tk bindings. Allows use additional packages for
  Tk GUI in the Ada code. At this moment it is a low level binding only to
  tooltip, getstring, autoscroll and ctext packages. If you want binding to
  any other package from this library, feel free to [open a ticket](https://www.laeran.pl/repositories/tashy/tktnew) with it.
* Msgcat: Requires Tcl binding. Allows creating multi-language text messages.
  At this moment it is a low level binding to msgcat commands: mostly works
  like standard Tcl commands. If you want binding to any other command from
  this package, please [open a ticket](https://www.laeran.pl/repositories/tashy/tktnew) with it.

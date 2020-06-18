#!/bin/sh
# the next line restarts using wish \
exec wish "$0" ${1+"$@"}

# Copyright (C) 1997-2000 Terry J. Westley
# Copyright (C) Simon Wright <simon@pushface.org>
# Copyright (C) 2019-2020 Bartek Jasicki <thindil@laeran.pl>

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

# This is a Tcl/Tk script which helps install TASHY.  It collects
# information about the environment and creates files makeconf and
# tash_options.gpr, which are included in makefiles/withed by GPRs to
# customize to the local environment.

package require Tk

set buildoption all
set installtklib 0
set tashy_version 8.6.6

# Used for mostly for Docker, normally Tk should set this variable
# by itself
if {[info exists tk_version] == 0} {
   set tk_version 8.6
}

proc cequal {left right} {
   return [expr [string compare $left $right] == 0]
}

proc lempty {string} {
   return [expr [string length $string] == 0]
}

proc setvar {name value comments} {
   global tashvar tashorder tashcomments
   set tashvar($name) $value
   set tashcomments($name) $comments
   lappend tashorder $name
}

# Create the tash_options.gpr file
#--------------------------------
proc CreateGprFile {} {
   global library_switches gpr tashvar installtk
   if [catch {open $gpr w} gprfid] {
      puts stderr $gprfid
      exit
   }
   set library_switch [string range $library_switches 0 [string first "-ltcl" $library_switches]-1]
   puts $gprfid "--  $gpr
   ----------------------------------------------------------
   --
   --  This file, tash_options.gpr, contains global options
   --  used for building and using Tashy.
   --
   --  It is automatically generated by the setup.tcl script.
   --
   ----------------------------------------------------------

   project Tash_Options is

   for Source_Dirs use ();

   -- The source files used to compile Tashy
   Source_Files := ($tashvar(SOURCES));

   --  These are the Ada compiler options used to build Tashy.
   Compiler_Options :=
   (
   \"[join $tashvar(AARGS) "\",\n      \""]\"
   );

   --  These are the C compiler options used to build Tashy.
   C_Compiler_Options :=
   (
   \"[join [concat $tashvar(CARGS)] "\",\n      \""]\",
      \"[join [list "$tashvar(TCL_INCLUDE)" "$tashvar(X11_INCLUDE)"] "\",\n      \""]\"
   );

   --  These options determine the location of the system's Tcl, Tk
   --  libraries.
   Linker_Options :=
   (
   \"[string range $library_switches 0 [string first "-ltcl" $library_switches]-2]\",
      \"[join [string range $library_switches [string first "-ltcl" $library_switches] [string length $library_switches]] "\",\n      \""]\"
   );

   end Tash_Options;"
   catch {close $gprfid}
}

# Implement Save button command.  Update tashorder & tashvar from the
# GUI.
#-----------------------------------------------------------------
proc Save_GUI {g} {
   global tashorder tashvar useLinkerOptions tcl_platform library_switches
   global tcl_version tk_version
   foreach name $tashorder {
      switch -regexp $name {
         "(TK|TCL)_(VERSION|RELEASE)" {
            # wasn't displayed, can't have changed
         }
         "EXE" {
            # wasn't displayed, can't have changed
         }
         default {
            set w [string tolower $name]
            if {![winfo exists $g.$w-entry]} continue;
            set tashvar($name) "[$g.$w-entry get]"
         }
      }
   }
   set library_switches ""
   set tclhome $tashvar(TCLHOME)
   regsub -all {[ \t]+} $tcl_platform(os) "_" os
   switch $tcl_platform(platform) {
      "windows" {
         regsub {\.} $tcl_version {} tcl_short_version
         regsub {\.} $tk_version  {} tk_short_version
         append library_switches "-L$tclhome/lib "
         set tail " "
         if {![file exists [file join $tclhome lib tcl$tk_short_version.lib]]} {
            set tail "t "
         }
         append library_switches "-ltcl$tcl_short_version$tail"
         append library_switches "-ltk$tk_short_version$tail"
      }
      "unix" {
         if [cequal $os "SunOS"] {
            append library_switches " -R$tclhome/lib -L$tclhome/lib"
            append library_switches " -ltcl$tcl_version -ltk$tk_version"
         } elseif [cequal $os "Darwin"] {
            append library_switches " -L$tclhome/lib"
            append library_switches " -ltcl$tcl_version -ltk$tk_version"
         } else {
            # Must be Linux (?)
            append library_switches " -Wl,-rpath,$tclhome/lib"
            append library_switches " -L$tclhome/lib"
            append library_switches " -ltcl$tcl_version -ltk$tk_version"
         }
      }
   }
   Save
}

# Implement Save command.  Creates tash_options.gpr
# Also, create tcl_record_sizes.ads file
#-----------------------------------------------------------------
proc Save {} {
   global tashvar tcl_platform buildoption library_switches installtklib
   if {$buildoption == "tcl"} {
      setvar TK_VERSION    ""        {Tk version}
      setvar TK_LIBRARY    ""        {Tk library}
      setvar X11HOME       ""        {X11 home directory}
      setvar X11_LIB       ""        {X11 library directory}
      setvar X11_INCLUDE   ""        {X11 include directory}
      setvar SOURCES       "\"src\""   {Source directories}
      set library_switches [string range $library_switches 0 [string first "-ltk" $library_switches]-1]
   } elseif {$buildoption != "all"} {
      set sources "\"src\", \"src/tk\""
      if {$installtklib == 1} {
         append sources ", \"src/tklib\""
      }
      setvar SOURCES       $sources   {Source directories}
   } else {
      setvar SOURCES       "\"src/**\""   {Source directories}
   }
   CreateGprFile
   source [file join [pwd] scripts tcl_record_sizes.tcl]
   exec gcc -Wno-format $tashvar(TCL_INCLUDE) -o tcl_record_sizes [file join [pwd] src tcl_record_sizes.c]
   file delete [file join [pwd] src tcl_record_sizes.c]
   exec [file join [pwd] tcl_record_sizes] > [file join [pwd] src tcl_record_sizes.ads]
   file delete [file join [pwd] tcl_record_sizes$tashvar(EXE)]
}


# Establish values for all macros depending on platform
#------------------------------------------------------
proc Set_Macros {platform os} {
   global tcl_version tk_version tcl_interactive tcl_library tk_library env
   global library_switches gpr_switches

   set x11home           ""
   set x11_lib           ""
   set x11_include       ""
   set exec_suffix       ""

   regsub -all {[ \t]+} $os "_" os

   if [cequal $os "Darwin"] {
      set tclhome "/usr"
      set tcl_include "/usr/include"
   } else {
      set tclhome [file dirname [file dirname [info nameofexecutable]]]
      set tcl_include [file join $tclhome include]
      if {![file exists [file join $tcl_include tcl.h]]} {
         set tcl_include [file join $tcl_include [file tail $tcl_library]]
      }
   }
   set library_switches  ""

   set pwd               [pwd]

   switch $platform {
      "windows" {
         # It assumes a GNAT that recognises tcl86.lib as a
         # candidate for the linker switch -ltcl86.
         #
         # Should works with ActiveState Tcl and Magicsplat Tcl
         # distributions
         #
         # Most development tools get confused by paths with spaces.
         regsub {PROGRAM FILES} $tclhome "PROGRA~1" tclhome
         regsub {\.} $tcl_version {} tcl_short_version
         regsub {\.} $tk_version  {} tk_short_version
         set tclsh "tclsh${tcl_short_version}"
         set libtcl ""
         set tcldll "tcl${tcl_short_version}.dll"
         set libtk ""
         set tkdll  "tk${tk_short_version}.dll"
         append library_switches "-L$tclhome/lib "
         set tail " "
         if {![file exists [file join $tclhome lib tcl$tk_short_version.lib]]} {
            set tail "t "
         }
         append library_switches "-ltcl$tcl_short_version$tail"
         append library_switches "-ltk$tk_short_version$tail"
         set exec_suffix ".exe"
      }
      "unix" {
         set tclsh "tclsh"
         set dynlib [info sharedlibextension]
         set libtcl "$tclhome/lib/libtcl${tcl_version}$dynlib"
         set libtk  "$tclhome/lib/libtk${tk_version}$dynlib"

         set PossibleXHomes \
            [list /usr/openwin /usr/X /usr/X11R6 /usr /opt/X11]
         foreach dir $PossibleXHomes {
            set lib [file join $dir lib]
            foreach file [list "libX11$dynlib" "libX11.a"] {
               if [file exists [file join $lib $file]] {
                  set x11home $dir
                  set x11_lib [file join $x11home lib]
                  break
               }
            }
         }
         if [file isdirectory [file join $x11home include]] {
            set x11_include [file join $x11home include]
         } else {
            foreach dir $PossibleXHomes {
               set include [file join $dir include]
               if [file isdirectory $include] {
                  set x11_include $include
                  break
               }
            }
         }
         if [cequal $os "SunOS"] {
            append library_switches " -R$tclhome/lib -L$tclhome/lib"
            append library_switches " -ltcl$tcl_version -ltk$tk_version"
         } elseif [cequal $os "Darwin"] {
            append library_switches " -L$tclhome/lib"
            append library_switches " -ltcl$tcl_version -ltk$tk_version"
         } else {
            # Must be Linux (?)
            append library_switches " -Wl,-rpath,$tclhome/lib"
            append library_switches " -L$tclhome/lib"
            append library_switches " -ltcl$tcl_version -ltk$tk_version"
         }
      }
   }

   setvar PLATFORM          $platform            {OS platform}
   setvar OS                $os                  {Operating system}
   if [lempty $x11home] {
      setvar X11HOME       ""                   {X11 home directory}
   } else {
      setvar X11HOME       "$x11home"           {X11 home directory}
   }
   if [lempty $x11_lib] {
      setvar X11_LIB       ""                   {X11 library directory}
   } else {
      setvar X11_LIB       "$x11_lib"           {X11 library directory}
   }
   if [lempty $x11_include] {
      setvar X11_INCLUDE   ""                   {X11 include directory}
   } else {
      setvar X11_INCLUDE   "-I$x11_include"     {X11 include directory}
   }
   setvar TCLSH             "$tclsh"             {Tclsh executable}
   setvar TCLHOME           "$tclhome"           {Tcl Home directory}
   setvar TCL_INCLUDE       "-I$tcl_include"     {Tcl include directory}
   setvar TCL_VERSION       "$tcl_version"       {Tcl version}
   setvar TCL_LIBRARY       "$libtcl"            {Tcl library}
   setvar TK_VERSION        "$tk_version"        {Tk version}
   setvar TK_LIBRARY        "$libtk"             {Tk library}
   setvar CARGS             "-g -O2"             {C compiler switches}
   setvar AARGS             "-g -O2 -gnatqQafo -gnatwaL" \
      {Ada compiler switches}
   setvar BARGS             "-E"                 {gnatbind switches}
   setvar EXE               "$exec_suffix"       {suffix for executable files}
}

# Establish values for all macros depending on platform
#------------------------------------------------------
Set_Macros $tcl_platform(platform) $tcl_platform(os)

set gpr [file join [pwd] tash_options.gpr]

# If no GUI required, save and finish
#------------------------------------
if {[lindex $argv 0] == "--nogui"} {
   Save
   exit
}

# Create window for installer to review and edit macro values
#------------------------------------------------------------
wm title    . "TASHY $tashy_version Setup"
wm iconname . "TASHY Setup"

message .instructions -justify left -aspect 500 -pady 10 -padx 20 -text \
   "This program, setup.tcl, customizes the TASHY $tashy_version installation by\
   creating the file $gpr. Setup.tcl guesses \"reasonable\"\
   values for the macros, but you may have to edit them.  After you're\
   happy with the macro values, press \"Save\" to save the files."

pack .instructions -side top -fill x

set modulesframe [ttk::labelframe .modules -text "Select modules"]
pack $modulesframe -side top

pack [ttk::radiobutton .modules.all -text "Everything" -value "all" -variable buildoption] -fill x
pack [ttk::radiobutton .modules.tcl -text "Tcl only" -value "tcl" -variable buildoption] -fill x
pack [ttk::radiobutton .modules.select -text "Tcl, Tk and one from the list below" -value "tcltk" -variable buildoption]
pack [ttk::checkbutton .modules.tklib -text "Tklib" -variable installtklib]

set g [ttk::frame .grid]
pack $g -side top

set row 0

proc DisplaySetting {name} {
   global row g w tashvar

   set w [string tolower $name]
   ttk::label $g.$w-label -text "$name: " -anchor e
   grid $g.$w-label  -row $row -column 0 -sticky e
   ttk::entry $g.$w-entry -width 40
   $g.$w-entry insert end $tashvar($name)
   grid $g.$w-entry  -row $row -column 1
   incr row
}

foreach name $tashorder {
   switch -regexp $name {
      "(TK|TCL)_(VERSION|RELEASE)" {
         # don't display
      }
      "EXE" {
         # don't display
      }
      "(X11)(HOME|_LIB|_INCLUDE)" {
         # don't display on Windows
         if {$tcl_platform(platform) != "windows"} {
            DisplaySetting $name
         }
      }
      "(TK|TCL)_(LIBRARY)" {
         # don't display on Windows
         if {$tcl_platform(platform) != "windows"} {
            DisplaySetting $name
         }
      }
      default {
         DisplaySetting $name
      }
   }
}

ttk::frame .buttons
pack .buttons -side bottom -fill x -pady 2m
ttk::button .buttons.save   -text Save   -command "Save_GUI $g; exit"
ttk::button .buttons.cancel -text Cancel -command exit
pack .buttons.save .buttons.cancel -side left -expand 1

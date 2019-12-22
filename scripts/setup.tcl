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

# This is a Tcl/Tk script which helps install TASH.  It collects
# information about the environment and creates files makeconf and
# tash_options.gpr, which are included in makefiles/withed by GPRs to
# customize to the local environment.

set tash_version "0.1"
set tash_release "0"

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

# Write makefile macro
#---------------------
proc WriteOneMacro {f name value comments} {
   puts $f ""
   foreach line [split $comments "\n"] {
      puts $f "# [string trimleft $line]"
   }
   puts $f [format "%-18s = %s" $name $value]
}

# Create the makeconf file
#--------------------------------
proc CreateMakeconfFile {makefile} {
   global tashorder tashvar tashcomments library_switches
   if [catch {open $makefile w} makefid] {
      puts stderr $makefid
      exit
   }
   puts $makefid "#$makefile"
   puts -nonewline $makefid {
      #####################################################
      #
      # This file, makeconf, contains macros used to
      # customize makefiles in various TASH directories.
      #
      # It is automatically generated by the setup.tcl script.
      # To change them, you may either edit them directly
      # with a text editor or run setup.tcl again.
      #
      #####################################################
   }

   foreach name $tashorder {
      WriteOneMacro $makefid $name $tashvar($name) $tashcomments($name)
   }

   WriteOneMacro $makefid LARGS [concat "-ltash" [join $library_switches]] \
      {All link switches for TASH, Tcl, and Tk}

   catch {close $makefid}
}

# Create the tash_options.gpr file
#--------------------------------
proc CreateGprFile {} {
   global library_switches gpr tashvar
   if [catch {open $gpr w} gprfid] {
      puts stderr $gprfid
      exit
   }
   puts $gprfid "--  $gpr
   ----------------------------------------------------------
   --
   --  This file, tash_options.gpr, contains global options
   --  used for building and using Tash.
   --
   --  It is automatically generated by the setup.tcl script.
   --
   ----------------------------------------------------------

   project Tash_Options is

   for Source_Dirs use ();

   --  These are the Ada compiler options used to build Tash.
   Compiler_Options :=
   (
   \"[join $tashvar(AARGS) "\",\n      \""]\"
   );

   --  These are the C compiler options used to build Tash.
   C_Compiler_Options :=
   (
   \"[join [concat $tashvar(CARGS) $tashvar(TCL_INCLUDE) $tashvar(X11_INCLUDE)] "\",\n      \""]\"
   );

   --  These options determine the location of the system's Tcl, Tk
   --  libraries.
   Linker_Options :=
   (
   \"[join $library_switches "\",\n      \""]\"
   );

   end Tash_Options;"
   catch {close $gprfid}
}

# Implement Save button command.  Update tashorder & tashvar from the
# GUI.
#-----------------------------------------------------------------
proc Save_GUI {g} {
   global tashorder tashvar useLinkerOptions makefile tcl_platform
   foreach name $tashorder {
      switch -regexp $name {
         "(TK|TCL|TASH)_(VERSION|RELEASE)" {
            # wasn't displayed, can't have changed
         }
         "EXE" {
            # wasn't displayed, can't have changed
         }
         default {
            set w [string tolower $name]
            set tashvar($name) [$g.$w-entry get]
         }
      }
   }
   Save
}

# Implement Save command.  Creates makefile and tash_options.gpr
# Also, create tcl_record_sizes.ads file
#-----------------------------------------------------------------
proc Save {} {
   global makefile tashvar tcl_platform
   CreateMakeconfFile $makefile
   CreateGprFile
   source [file join [pwd] scripts tcl_record_sizes.tcl]
   exec gcc $tashvar(TCL_INCLUDE) -o tcl_record_sizes [file join [pwd] src tcl_record_sizes.c]
   file delete [file join [pwd] src tcl_record_sizes.c]
   exec [file join [pwd] tcl_record_sizes] > [file join [pwd] src tcl_record_sizes.ads]
   if [cequal $tcl_platform(platform) "windows"] {
      file delete [file join [pwd] tcl_record_sizes.exe]
   } else {
      file delete [file join [pwd] tcl_record_sizes]
   }
}


# Establish values for all macros depending on platform
#------------------------------------------------------
proc Set_Macros {platform os osVersion} {
   global tcl_version tk_version tcl_interactive tcl_library tk_library env
   global tash_version tash_release library_switches gpr_switches

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
      if {![info exists [file join $tcl_include tcl.h]]} {
         set tcl_include [file join $tcl_include [file tail $tcl_library]]
      }
   }
   set library_switches  ""

   set pwd               [pwd]

   switch $platform {
      "windows" {
         # This assumes ActiveTcl. Cygwin Tcl/Tk (at 30 Oct 2006)
         # wouldn't run properly when called from Ada.
         #
         # It also assumes a GNAT that recognises tcl84.lib as a
         # candidate for the linker switch -ltcl84.
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
         set tcl_include [file join $tclhome include]
         append library_switches "-L$tclhome/lib "
         append library_switches "-ltk$tk_short_version "
         append library_switches "-ltcl$tcl_short_version "
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
            append library_switches " -ltk$tk_version -ltcl$tcl_version"
         } elseif [cequal $os "Darwin"] {
            append library_switches " -L$tclhome/lib"
            append library_switches " -ltk$tk_version -ltcl$tcl_version"
         } else {
            # Must be Linux (?)
            append library_switches " -Wl,-rpath,$tclhome/lib"
            append library_switches " -L$tclhome/lib"
            append library_switches " -ltk$tk_version -ltcl$tcl_version"
         }
      }
   }

   setvar PLATFORM          $platform            {OS platform}
   setvar OS                $os                  {Operating system}
   setvar OSVERSION         $osVersion           {Operating system version}
   setvar TASH_VERSION      "$tash_version"      {TASH version}
   setvar TASH_RELEASE      "$tash_release"      {TASH release}
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
   setvar AARGS             "-g -O2 -gnatqQafoy -gnatwaL" \
      {Ada compiler switches}
   setvar BARGS             "-E"                 {gnatbind switches}
   setvar EXE               "$exec_suffix"       {suffix for executable files}
}

# Establish values for all macros depending on platform
#------------------------------------------------------
Set_Macros $tcl_platform(platform) $tcl_platform(os) $tcl_platform(osVersion)

set makefile [file join [pwd] makeconf]
set gpr [file join [pwd] tash_options.gpr]

# If no GUI required, save and finish
#------------------------------------
if {[lindex $argv 0] == "--nogui"} {
   Save
   exit
}

# Create window for installer to review and edit macro values
#------------------------------------------------------------
wm title    . "TASH $tashvar(TASH_VERSION)-$tashvar(TASH_RELEASE) Setup"
wm iconname . "TASH Setup"

message .instructions -justify left -aspect 500 -pady 10 -padx 20 -text \
   "This program, setup.tcl, customizes the TASH installation by\
   creating the files $makefile and $gpr. Setup.tcl guesses \"reasonable\"\
   values for the macros, but you may have to edit them.  After you're\
   happy with the macro values, press \"Save\" to save the files."

pack .instructions -side top -fill x -expand yes

set g [frame .grid]
pack $g -side top

set row 0

foreach name $tashorder {
   switch -regexp $name {
      "(TK|TCL|TASH)_(VERSION|RELEASE)" {
         # don't display
      }
      "EXE" {
         # don't display
      }
      default {
         set w [string tolower $name]
         label $g.$w-label -text "$name: " -anchor e
         grid $g.$w-label  -row $row -column 0 -sticky e
         entry $g.$w-entry -width 40
         $g.$w-entry insert end $tashvar($name)
         grid $g.$w-entry  -row $row -column 1
         incr row
      }
   }
}

frame .buttons
pack .buttons -side bottom -fill x -pady 2m
button .buttons.save   -text Save   -command "Save_GUI $g; exit"
button .buttons.cancel -text Cancel -command exit
pack .buttons.save .buttons.cancel -side left -expand 1

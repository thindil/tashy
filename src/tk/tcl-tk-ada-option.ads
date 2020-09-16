-- Copyright (c) 2020 Bartek thindil Jasicki <thindil@laeran.pl>
--
-- Tashy is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 2 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.
--
-- As a special exception, if other files instantiate generics from this
-- unit, or you link this unit with other files to produce an executable,
-- this unit does not by itself cause the resulting executable to be
-- covered by the GNU General Public License. This exception does not
-- however invalidate any other reasons why the executable file might be
-- covered by the GNU Public License.

with Tcl.Tk.Ada.Widgets; use Tcl.Tk.Ada.Widgets;

-- ****h* TkAda/Option
-- FUNCTION
-- Provides code for manipulate Tk command Option
-- SOURCE
package Tcl.Tk.Ada.Option is
-- ****

   -- ****f* Option/Add
   -- FUNCTION
   -- Add a new option to the database
   -- PARAMETERS
   -- Interp    - Tcl interpreter on which the new option will be added
   -- Pattern   - The option which will be added
   -- Value     - Value of the option to add
   -- OPriority - Priority of the new option. Can be empty. Default value is
   --             interactive
   -- HISTORY
   -- 8.6.7 - Added
   -- EXAMPLE
   -- -- Add option *Button.foreground with value red on current Tcl interpreter
   -- Add(Get_Context, "*Button.foreground", "red");
   -- COMMANDS
   -- option add pattern value priority
   -- SOURCE
   procedure Add
     (Interp: in Tcl_Interp; Pattern, Value: in String;
      OPriority: in String := "interactive") with
      Pre => Pattern /= "" and Value /= "";
      -- ****

      -- ****f* Option/Clear
      -- FUNCTION
      -- Clear option's database
      -- PARAMETERS
      -- Interp - Tcl interpreter on which option's database will be cleared
      -- HISTORY
      -- 8.6.7 - Added
      -- EXAMPLE
      -- -- Clear the options database on My_Interpreter interpreter
      -- Clear(My_Interpreter);
      -- COMMANDS
      -- option clear
      -- SOURCE
   procedure Clear(Interp: in Tcl_Interp);
   -- ****

   -- ****f* Option/Get
   -- FUNCTION
   -- Get the value of the selected option
   -- PARAMETERS
   -- Window - Tk_Widget which will be queried for option
   -- Name   - The name of the option to get
   -- Class  - The class of the option to get
   -- RESULT
   -- The value of the selected option or {} if no option was found
   -- HISTORY
   -- 8.6.7 - Added
   -- EXAMPLE
   -- -- Get the returnCommand value of the class Command of the window My_Window
   -- Value: constant String := Get(My_Window, "returnValue", "Command");
   -- COMMANDS
   -- option get window name class
   -- SOURCE
   function Get
     (Window: in Tk_Widget'Class; Name, Class: in String) return String with
      Pre => Name /= "" and Class /= "";
      -- ****

      -- ****f* Option/Read_File
      -- FUNCTION
      -- Read file and add all the options from it to the options database
      -- PARAMETERS
      -- Interp    - Tcl interpreter on which options will be loaded
      -- FileName  - Name of the file with options to load
      -- OPriority - Priority of the loaded option. Can be empty. Default value
      --             is interactive
      -- HISTORY
      -- 8.6.7 - Added
      -- EXAMPLE
      -- -- Read the file .Xdefaults at userDefault priority on My_Interpreter interpreter
      -- Read_File(My_Interpreter, ".Xdefaults", "userDefault");
      -- COMMANDS
      -- option readfile fileName priority
      -- SOURCE
   procedure Read_File
     (Interp: in Tcl_Interp; FileName: in String;
      OPriority: in String := "interactive") with
      Pre => FileName /= "";
      -- ****

end Tcl.Tk.Ada.Option;

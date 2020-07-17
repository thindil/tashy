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

-- ****h* TkAda/TkBusy
-- FUNCTION
-- Provides code for manipulate Tk command Busy
-- SOURCE
package Tcl.Tk.Ada.Busy is
-- ****

   -- ****f* TkBusy/Busy
   -- FUNCTION
   -- Set selected window busy
   -- PARAMETERS
   -- Window  - Tk_Widget which will be set busy
   -- Options - Tk options for busy command
   -- HISTORY
   -- 8.6.2 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- EXAMPLE
   -- -- Set the My_Main_Window widget busy
   -- Tcl.Tk.Ada.Busy.Busy(My_Main_Window);
   --
   -- -- Set the My_Main_Window widget busy and mouse curson on it to watch cursor
   -- Tcl.Tk.Ada.Busy.Hold(My_Main_Window, "-cursor watch");
   -- COMMANDS
   -- tk busy window ?options?
   -- tk busy hold window ?options?
   -- SOURCE
   procedure Busy(Window: in Tk_Widget'Class; Options: in String := "");
   procedure Hold(Window: in Tk_Widget'Class; Options: in String := "") renames
     Busy;
     -- ****

     -- ****f* TkBusy/cget
     -- FUNCTION
     -- Get value of the selected option for the selected busy window
     -- PARAMETERS
     -- Window - Tk_Widget which is set as busy
     -- Option - Busy option to query
     -- RESULT
     -- Value of the selected option of the selected busy window
     -- HISTORY
     -- 8.6.3 - Added
     -- TODO
     -- Replace it with higher level of binding
     -- EXAMPLE
     -- -- Get the currently set cursor for busy My_Main_Window
     -- Cursor_Name: constant String := Tcl.Tk.Ada.Busy.cget(My_Main_Window, "-cursor");
     -- COMMANDS
     -- tk busy cget window option
     -- SOURCE
   function cget
     (Window: in Tk_Widget'Class; Option: in String) return String with
      Pre => Option /= "";
      -- ****

      -- ****f* TkBusy/Configure (procedure)
      -- FUNCTION
      -- Change configuration of the selected busy Tk_Widget
      -- PARAMETERS
      -- Window  - Busy Tk_Widget to configure
      -- Options - Tk options to set to the selected Tk_Widget
      -- HISTORY
      -- 8.6.3 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- EXAMPLE
      -- -- Change the busy cursor for the My_Main_Window
      -- Tcl.Tk.Ada.Busy.Configure(My_Main_Window, "-cursor watch");
      -- COMMANDS
      -- tk busy configure window option value ?option2 value2...?
      -- SOURCE
   procedure Configure(Window: in Tk_Widget'Class; Options: in String) with
      Pre => Options /= "";
      -- ****

      -- ****f* TkBusy/Configure (function)
      -- FUNCTION
      -- Get busy configuration values for the selected busy Tk_Widget
      -- PARAMETERS
      -- Window  - Busy Tk_Widget which will be queried for options
      -- Option  - Tk busy option's value to get from the Tk_Widget. Default
      --           value is empty
      -- RESULT
      -- If Option is empty, return all configuration options with their
      -- values, otherwise return value of the selected option
      -- HISTORY
      -- 8.6.3 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- EXAMPLE
      -- -- Get the currently set cursor for busy My_Main_Window
      -- Cursor_Name: constant String := Tcl.Tk.Ada.Busy.Configure(My_Main_Window, "-cursor");
      --
      -- -- Get all available options for the busy My_Main_Window
      -- Options_List: constant String := Tcl.Tk.Ada.Busy.Configure(My_Main_Window);
      -- COMMANDS
      -- tk busy configure window ?option?
      -- SOURCE
   function Configure
     (Window: in Tk_Widget'Class; Option: in String := "") return String;
     -- ****

     -- ****f* TkBusy/Current
     -- FUNCTION
     -- Get list of Tk_Widgets names currently set as busy
     -- PARAMETERS
     -- Pattern - Pattern which must be match in busy Tk_Widget names.
     --           Default value is empty
     -- RESULT
     -- If Pattern is empty, return all busy Tk_Widgets names. If Pattern is
     -- specified, return only this which match the Pattern.
     -- HISTORY
     -- 8.6.3 - Added
     -- TODO
     -- Replace it with higher level of binding
     -- EXAMPLE
     -- -- Get names of all busy windows
     -- Busy_Windows: constant String := Tcl.Tk.Ada.Busy.Current;
     --
     -- -- Get names of busy windows which names contains mywindow
     -- Busy_Windows: constant String := Tcl.Tk.Ada.Busy.Current("*mywindow*");
     -- COMMANDS
     -- tk busy current ?pattern?
     -- SOURCE
   function Current(Pattern: in String := "") return String;
   -- ****

   -- ****f* TkBusy/Forget
   -- FUNCTION
   -- Make window enabled again
   -- PARAMETERS
   -- Window - Tk_Widget which will be enabled
   -- HISTORY
   -- 8.6.2 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- EXAMPLE
   -- -- Enable the widget My_Main_Window
   -- Tcl.Tk.Ada.Busy.Forget(My_Main_Window);
   -- COMMANDS
   -- tk busy forget window
   -- SOURCE
   procedure Forget(Window: in Tk_Widget'Class);
   -- ****

   -- ****f* TkBusy/Status
   -- FUNCTION
   -- Get information if the selected Tk_Widget is busy or not
   -- PARAMETERS
   -- Window - Tk_Widget which will be queried for status
   -- RESULT
   -- 1 if Tk_Widget is busy, otherwise 0
   -- HISTORY
   -- 8.6.3 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- EXAMPLE
   -- -- Get the status of widget My_Main_Window
   -- Busy_Status: constant String := Tcl.Tk.Ada.Busy.Status(My_Main_Window);
   -- COMMANDS
   -- tk busy status window
   -- SOURCE
   function Status(Window: in Tk_Widget'Class) return String;
   -- ****

end Tcl.Tk.Ada.Busy;

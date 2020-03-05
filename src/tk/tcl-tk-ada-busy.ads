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

-- ****h* TkAda/Busy
-- FUNCTION
-- Provides code for manipulate Tk command Busy
-- SOURCE
package Tcl.Tk.Ada.Busy is
-- ****

   -- ****f* Busy/Busy
   -- FUNCTION
   -- Set selected window busy
   -- PARAMETERS
   -- Window  - Tk_Widget which will be set busy
   -- Options - Tk options for busy command
   -- SOURCE
   procedure Busy(Window: in Tk_Widget'Class; Options: in String := "");
   procedure Hold(Window: in Tk_Widget'Class; Options: in String := "") renames
     Busy;
   -- ****

   -- ****f* Busy/cget
   -- FUNCTION
   -- Get value of the selected option for the selected busy window
   -- PARAMETERS
   -- Window - Tk_Widget which is set as busy
   -- Option - Busy option to query
   -- RESULT
   -- Value of the selected option of the selected busy window
   -- SOURCE
   function cget
     (Window: in Tk_Widget'Class; Option: in String) return String with
      Pre => Option /= "";
      -- ****

      -- ****f* Busy/Configure
      -- FUNCTION
      -- Change configuration of the selected busy Tk_Widget
      -- PARAMETERS
      -- Window  - Busy Tk_Widget to configure
      -- Options - Tk options to set to the selected Tk_Widget
      -- SOURCE
   procedure Configure(Window: in Tk_Widget'Class; Options: in String) with
      Pre => Options /= "";
      -- ****

      -- ****f* Busy/Configure2
      -- FUNCTION
      -- Get busy configuration values for the selected busy Tk_Widget
      -- PARAMETERS
      -- Window  - Busy Tk_Widget which will be queried for options
      -- Option  - Tk busy option's value to get from the Tk_Widget. Default
      --           value is empty
      -- RESULT
      -- If Option is empty, return all configuration options with their
      -- values, otherwise return value of the selected option
      -- SOURCE
   function Configure
     (Window: in Tk_Widget'Class; Option: in String := "") return String;
   -- ****

   -- ****f* Busy/Current
   -- FUNCTION
   -- Get list of Tk_Widgets names currently set as busy
   -- PARAMETERS
   -- Pattern - Pattern which must be match in busy Tk_Widget names.
   --           Default value is empty
   -- RESULT
   -- If Pattern is empty, return all busy Tk_Widgets names. If Pattern is
   -- specified, return only this which match the Pattern.
   -- SOURCE
   function Current(Pattern: in String := "") return String;
   -- ****

   -- ****f* Busy/Forget
   -- FUNCTION
   -- Make window enabled again
   -- PARAMETERS
   -- Window - Tk_Widget which will be enabled
   -- SOURCE
   procedure Forget(Window: in Tk_Widget'Class);
   -- ****

   -- ****f* Busy/Status
   -- FUNCTION
   -- Get information if the selected Tk_Widget is busy or not
   -- PARAMETERS
   -- Window - Tk_Widget which will be queried for status
   -- RESULT
   -- 1 if Tk_Widget is busy, otherwise 0
   -- SOURCE
   function Status(Window: in Tk_Widget'Class) return String;
   -- ****

end Tcl.Tk.Ada.Busy;

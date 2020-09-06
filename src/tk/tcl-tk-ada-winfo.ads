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

-- ****h* TkAda/Winfo
-- FUNCTION
-- Provides code for get information about selected window
-- SOURCE
package Tcl.Tk.Ada.Winfo is
-- ****

   -- ****f* Winfo/Winfo_Get
   -- FUNCTION
   -- Get selected information about selected window
   -- PARAMETERS
   -- Tk_Widget - Tk_Widget which will be queried
   -- Info      - Winfo information to get
   -- Options   - Options for selected information. Default is empty
   -- RESULT
   -- Selected information about selected Tk_Widget
   -- HISTORY
   -- 8.6.2 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- EXAMPLE
   -- -- Check if widget My_Label exists
   -- Exists: constant String := Winfo_Get(My_Label, "exists");
   -- COMMANDS
   -- winfo info Widgt options
   -- SOURCE
   function Winfo_Get
     (Widgt: in Tk_Widget'Class; Info: in String; Options: in String := "")
      return String;
   -- ****

end Tcl.Tk.Ada.Winfo;

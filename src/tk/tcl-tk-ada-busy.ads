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

   -- ****f* Busy/Forget
   -- FUNCTION
   -- Make window enabled again
   -- PARAMETERS
   -- Window - Tk_Widget which will be enabled
   -- SOURCE
   procedure Forget(Window: in Tk_Widget'Class);
   -- ****

end Tcl.Tk.Ada.Busy;

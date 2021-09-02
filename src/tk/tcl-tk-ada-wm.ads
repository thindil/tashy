-- Copyright (c) 2020-2021 Bartek thindil Jasicki <thindil@laeran.pl>
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

-- ****h* TkAda/Wm
-- FUNCTION
-- Provides code for communicate with windows manager
-- SOURCE
package Tcl.Tk.Ada.Wm with
   SPARK_Mode
is
-- ****

   -- ****f* Wm/Wm.Wm_Set
   -- FUNCTION
   -- Communicate with the window manager
   -- PARAMETERS
   -- Tk_Widget   - Tk_Widget which will be modified
   -- Action   - WM action to do
   -- Options  - Options for selected action. Default is empty
   -- HISTORY
   -- 8.6.1 - Added
   -- EXAMPLE
   -- -- Set title of My_Window to My window title
   -- Wm_Set(My_Window, "title", "{My window title}");
   -- COMMANDS
   -- wm action Widgt options
   -- SOURCE
   procedure Wm_Set
     (Widgt: in Tk_Widget'Class; Action: in String; Options: in String := "");
   -- ****

end Tcl.Tk.Ada.Wm;

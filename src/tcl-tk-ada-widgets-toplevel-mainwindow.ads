-- Copyright (c) 2020 Bartek thindil Jasicki <thindil@laeran.pl>
--
-- This program is free software: you can redistribute it and/or modify
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

-- ****h* Tashy/MainWindow
-- FUNCTION
-- Provides code for manipulate main window widget
-- SOURCE
package Tcl.Tk.Ada.Widgets.Toplevel.MainWindow is
-- ****

   -- ****f* MainWindow/Get_Main_Window
   -- FUNCTION
   -- Get main window of the specified interpreter
   -- SOURCE
   function Get_Main_Window(Interp: in Tcl_Interp) return Tk_Toplevel;
   -- ****

   -- ****f* MainWindow/Bind_To_Main_Window
   -- FUNCTION
   -- Associates Tcl script Script with the event Sequence in the main window.
   -- SOURCE
   procedure Bind_To_Main_Window
     (Interp: in Tcl_Interp; Sequence: in String; Script: in String);
   -- ****

   -- ****f* MainWindow/Unbind_From_Main_Window
   -- FUNCTION
   -- Disassociates the binding from the event Sequence in the main window.
   -- SOURCE
   procedure Unbind_From_Main_Window
     (Interp: in Tcl_Interp; Sequence: in String);
   function Unbind_From_Main_Window
     (Interp: in Tcl_Interp; Sequence: in String) return String;
   -- ****

end Tcl.Tk.Ada.Widgets.Toplevel.MainWindow;

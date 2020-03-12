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

with Tcl.Ada;

package body Tcl.Tk.Ada.Widgets.Toplevel.MainWindow is

   function Get_Main_Window(Interp: in Tcl_Interp) return Tk_Toplevel is
   begin
      return (C.Strings.New_String("."), Interp);
   end Get_Main_Window;

   procedure Bind_To_Main_Window
     (Interp: in Tcl_Interp; Sequence: in String; Script: in String) is
   begin --  Bind_To_Main_Window
      Tcl_Eval(Interp, "bind . " & Sequence & " " & Script);
   end Bind_To_Main_Window;

   procedure Unbind_From_Main_Window
     (Interp: in Tcl_Interp; Sequence: in String) is
   begin --  Unbind_From_Main_Window
      Tcl_Eval(Interp, "bind . " & Sequence & " {}");
   end Unbind_From_Main_Window;

   function Unbind_From_Main_Window
     (Interp: in Tcl_Interp; Sequence: in String) return String is
   begin --  Unbind_From_Main_Window
      Tcl_Eval(Interp, "bind . " & Sequence & " {}");
      return Tcl.Ada.Tcl_GetResult(Interp);
   end Unbind_From_Main_Window;

end Tcl.Tk.Ada.Widgets.Toplevel.MainWindow;

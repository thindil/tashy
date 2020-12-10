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

with Tcl.Ada;

package body Tcl.Tk.Ada.Option is

   procedure Add
     (Interp: in Tcl_Interp; Pattern, Value: in String;
      OPriority: in String := "interactive") is
   begin
      Tcl.Ada.Tcl_Eval
        (Interp, "option add " & Pattern & " " & Value & " " & OPriority);
   end Add;

   procedure Clear(Interp: in Tcl_Interp) is
   begin
      Tcl.Ada.Tcl_Eval(Interp, "option clear");
   end Clear;

   function Get
     (Window: in Tk_Widget'Class; Name, Class: in String) return String is
   begin
      Tcl.Ada.Tcl_Eval
        (Window.Interp, "option get " & Window & " " & Name & " " & Class);
      return Tcl.Ada.Tcl_GetResult(Window.Interp);
   end Get;

   procedure Read_File
     (Interp: in Tcl_Interp; FileName: in String;
      OPriority: in String := "interactive") is
   begin
      Tcl.Ada.Tcl_Eval
        (Interp, "option readfile " & FileName & " " & OPriority);
   end Read_File;

end Tcl.Tk.Ada.Option;

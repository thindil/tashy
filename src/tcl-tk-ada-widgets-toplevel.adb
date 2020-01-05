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

package body Tcl.Tk.Ada.Widgets.Toplevel is

   function Create
     (pathName: in String; options: in String := "") return Tk_Toplevel is
   begin --  Create
      return Create(Context, pathName, options);
   end Create;

   procedure Create
     (Widgt: out Tk_Toplevel; pathName: in String; options: in String := "") is
   begin --  Create
      Widgt := Create(Context, pathName, options);
   end Create;

   function Create
     (Interp: in Tcl_Interp; pathName: in String; options: in String := "")
      return Tk_Toplevel is
      --
      The_Widget: Tk_Toplevel;
   begin --  Create
      The_Widget.Interp := Interp;
      The_Widget.Name := C.Strings.New_String(pathName);
      Tcl_Eval(The_Widget.Interp, "toplevel " & pathName & " " & options);
      return The_Widget;
   end Create;

   procedure Create
     (Widgt: out Tk_Toplevel; Interp: in Tcl_Interp; pathName: in String;
      options: in String := "") is
   begin --  Create
      Widgt := Create(Interp, pathName, options);
   end Create;

end Tcl.Tk.Ada.Widgets.Toplevel;

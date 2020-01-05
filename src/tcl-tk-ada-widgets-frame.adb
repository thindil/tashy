-- Copyright (c) 2020 Bartek thindil Jasicki <thindil@laeran.pl>
--
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
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

package body Tcl.Tk.Ada.Widgets.Frame is

   function Create
     (pathName: in String; options: in String := "") return Tk_Frame is
   begin --  Create
      return Create(Context, pathName, options);
   end Create;

   procedure Create
     (Widgt: out Tk_Frame; pathName: in String; options: in String := "") is
   begin --  Create
      Widgt := Create(Context, pathName, options);
   end Create;

   function Create
     (Interp: in Tcl_Interp; pathName: in String; options: in String := "")
      return Tk_Frame is
      --
      The_Widget: Tk_Frame;
   begin --  Create
      The_Widget.Interp := Interp;
      The_Widget.Name := C.Strings.New_String(pathName);
      Tcl_Eval(The_Widget.Interp, "frame " & pathName & " " & options);
      return The_Widget;
   end Create;

   procedure Create
     (Widgt: out Tk_Frame; Interp: in Tcl_Interp; pathName: in String;
      options: in String := "") is
   begin --  Create
      Widgt := Create(Interp, pathName, options);
   end Create;

   function Get_Main_Window(Interp: in Tcl_Interp) return Tk_Frame is
      --
   begin --  Get_Main_Window
      return (C.Strings.New_String("."), Interp);
   end Get_Main_Window;

end Tcl.Tk.Ada.Widgets.Frame;

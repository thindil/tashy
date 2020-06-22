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

package body Tcl.Tk.Ada.Font is

   function Actual
     (FontDescription: in String; Options: in String := "") return String is
   begin
      Tcl_Eval(Get_Context, "font actual" & FontDescription & " " & Options);
      return Tcl.Ada.Tcl_GetResult(Get_Context);
   end Actual;

   function Actual
     (Interp: in Tcl_Interp; FontDescription: in String;
      Options: in String := "") return String is
   begin
      Tcl_Eval(Interp, "font actual" & FontDescription & " " & Options);
      return Tcl.Ada.Tcl_GetResult(Interp);
   end Actual;

   procedure Configure
     (FontName, Options: in String; Interp: Tcl_Interp := Get_Context) is
   begin
      Tcl_Eval(Interp, "font configure " & FontName & " " & Options);
   end Configure;

   function Configure
     (FontName: in String; Option: in String := "";
      Interp: Tcl_Interp := Get_Context) return String is
   begin
      Tcl_Eval(Interp, "font configure " & FontName & " " & Option);
      return Tcl.Ada.Tcl_GetResult(Interp);
   end Configure;

   procedure Create
     (FontName: in String; Options: in String := "";
      Interp: Tcl_Interp := Get_Context) is
   begin
      Tcl_Eval(Interp, "font create " & FontName & " " & Options);
   end Create;

   function Create
     (FontName, Options: in String := ""; Interp: Tcl_Interp := Get_Context)
      return String is
   begin
      Tcl_Eval(Interp, "font create " & FontName & " " & Options);
      return Tcl.Ada.Tcl_GetResult(Interp);
   end Create;

   procedure Delete(FontName: in String; Interp: Tcl_Interp := Get_Context) is
   begin
      Tcl_Eval(Interp, "font delete " & FontName);
   end Delete;

end Tcl.Tk.Ada.Font;

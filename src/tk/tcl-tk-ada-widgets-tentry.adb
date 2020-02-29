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

package body Tcl.Tk.Ada.Widgets.TEntry is

   function Create
     (pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) return Tk_Entry is
      The_Widget: Tk_Entry;
   begin
      if Interp = null then
         The_Widget.Interp := Context;
      else
         The_Widget.Interp := Interp;
      end if;
      The_Widget.Name := C.Strings.New_String(pathName);
      Tcl_Eval(The_Widget.Interp, "entry " & pathName & " " & options);
      return The_Widget;
   end Create;

   procedure Create
     (Widgt: out Tk_Entry; pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) is
   begin
      Widgt := Create(pathName, options, Interp);
   end Create;

   procedure Delete
     (TextEntry: in Tk_Entry; FirstIndex: in String;
      LastIndex: in String := "") is
   begin
      Execute_Widget_Command
        (TextEntry, "delete", FirstIndex & " " & LastIndex);
   end Delete;

   function Get(Widgt: in Tk_Entry) return String is
   begin
      Execute_Widget_Command(Widgt, "get");
      return Tcl.Ada.Tcl_GetResult(Widgt.Interp);
   end Get;

   procedure Insert
     (TextEntry: in Tk_Entry; Index: in String; Text: in String) is
   begin
      Execute_Widget_Command
        (TextEntry, "insert", Index & " " & "{" & Text & "}");
   end Insert;

end Tcl.Tk.Ada.Widgets.TEntry;

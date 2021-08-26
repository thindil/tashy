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

with Tcl.Ada;

package body Tcl.Tk.Ada.Widgets.TtkEntry.TtkComboBox is

   function Create
     (pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := Null_Interp) return Ttk_ComboBox is
      The_Widget: Ttk_ComboBox;
   begin
      if Interp = Null_Interp then
         The_Widget.Interp := Context;
      else
         The_Widget.Interp := Interp;
      end if;
      The_Widget.Name := C.Strings.New_String(pathName);
      Tcl_Eval(The_Widget.Interp, "ttk::combobox " & pathName & " " & options);
      return The_Widget;
   end Create;

   procedure Create
     (Widgt: out Ttk_ComboBox; pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := Null_Interp) is
   begin
      Widgt := Create(pathName, options, Interp);
   end Create;

   function Current(ComboBox: in Ttk_ComboBox) return String is
   begin
      Execute_Widget_Command(ComboBox, "current");
      return Tcl.Ada.Tcl_GetResult(ComboBox.Interp);
   end Current;

   overriding function Get_Widget
     (pathName: in String; Interp: in Tcl_Interp := Get_Context)
      return Ttk_ComboBox is
   begin
      return New_ComboBox: Ttk_ComboBox do
         New_ComboBox.Interp := Interp;
         New_ComboBox.Name := C.Strings.New_String(pathName);
      end return;
   end Get_Widget;

   procedure Current(ComboBox: in Ttk_ComboBox; NewIndex: in String) is
   begin
      Execute_Widget_Command(ComboBox, "current", NewIndex);
   end Current;

   procedure Set(ComboBox: in Ttk_ComboBox; Value: in String) is
   begin
      Execute_Widget_Command(ComboBox, "set", Value);
   end Set;

end Tcl.Tk.Ada.Widgets.TtkEntry.TtkComboBox;

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

package body Tcl.Tk.Ada.Widgets.TEntry.SpinBox is

   function Create
     (pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := Null_Interp) return Tk_SpinBox is
      The_Widget: Tk_SpinBox;
   begin
      if Interp = Null_Interp then
         The_Widget.Interp := Context;
      else
         The_Widget.Interp := Interp;
      end if;
      The_Widget.Name := C.Strings.New_String(pathName);
      Tcl_Eval(The_Widget.Interp, "spinbox " & pathName & " " & options);
      return The_Widget;
   end Create;

   procedure Create
     (Widgt: out Tk_SpinBox; pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := Null_Interp) is
   begin
      Widgt := Create(pathName, options, Interp);
   end Create;

   function Identify
     (SpinBoxWidget: in Tk_SpinBox; X, Y: in String) return String is
   begin
      Execute_Widget_Command(SpinBoxWidget, "identify", X & " " & Y);
      return Tcl.Ada.Tcl_GetResult(SpinBoxWidget.Interp);
   end Identify;

   overriding function Get_Widget
     (pathName: in String; Interp: in Tcl_Interp := Get_Context)
      return Tk_SpinBox is
   begin
      return New_SpinBox: Tk_SpinBox do
         New_SpinBox.Interp := Interp;
         New_SpinBox.Name := C.Strings.New_String(pathName);
      end return;
   end Get_Widget;

   procedure Invoke(SpinBoxWidget: in Tk_SpinBox; Element: in String) is
   begin
      Execute_Widget_Command(SpinBoxWidget, "invoke", Element);
   end Invoke;

   procedure Selection_Element
     (SpinBoxWidget: in Tk_SpinBox; Element: in String) is
   begin
      Execute_Widget_Command(SpinBoxWidget, "selection element", Element);
   end Selection_Element;

   function Selection_Element(SpinBoxWidget: in Tk_SpinBox) return String is
   begin
      Execute_Widget_Command(SpinBoxWidget, "selection element");
      return Tcl.Ada.Tcl_GetResult(SpinBoxWidget.Interp);
   end Selection_Element;

   procedure Set(SpinBoxWidget: in Tk_SpinBox; Value: in String) is
   begin
      Execute_Widget_Command(SpinBoxWidget, "set", Value);
   end Set;

   function Set(SpinBoxWidget: in Tk_SpinBox) return String is
   begin
      Execute_Widget_Command(SpinBoxWidget, "set");
      return Tcl.Ada.Tcl_GetResult(SpinBoxWidget.Interp);
   end Set;

end Tcl.Tk.Ada.Widgets.TEntry.SpinBox;

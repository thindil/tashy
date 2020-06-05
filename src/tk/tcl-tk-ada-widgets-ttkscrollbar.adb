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

package body Tcl.Tk.Ada.Widgets.TtkScrollbar is

   function Create
     (pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) return Ttk_Scrollbar is
      The_Widget: Ttk_Scrollbar;
   begin
      if Interp = null then
         The_Widget.Interp := Context;
      else
         The_Widget.Interp := Interp;
      end if;
      The_Widget.Name := C.Strings.New_String(pathName);
      Tcl_Eval
        (The_Widget.Interp, "ttk::scrollbar " & pathName & " " & options);
      return The_Widget;
   end Create;

   procedure Create
     (Widgt: out Ttk_Scrollbar; pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) is
   begin
      Widgt := Create(pathName, options, Interp);
   end Create;

   function Scrollbar_Delta
     (ScrollbarWidget: in Ttk_Scrollbar; DeltaX, DeltaY: in String)
      return String is
   begin
      Execute_Widget_Command(ScrollbarWidget, "delta", DeltaX & " " & DeltaY);
      return Tcl.Ada.Tcl_GetResult(ScrollbarWidget.Interp);
   end Scrollbar_Delta;

   function Fraction
     (ScrollbarWidget: in Ttk_Scrollbar; X, Y: in String) return String is
   begin
      Execute_Widget_Command(ScrollbarWidget, "fraction", X & " " & Y);
      return Tcl.Ada.Tcl_GetResult(ScrollbarWidget.Interp);
   end Fraction;

   function Get(ScrollbarWidget: in Ttk_Scrollbar) return String is
   begin
      Execute_Widget_Command(ScrollbarWidget, "get");
      return Tcl.Ada.Tcl_GetResult(ScrollbarWidget.Interp);
   end Get;

   procedure Set(ScrollbarWidget: in Ttk_Scrollbar; First, Last: in String) is
   begin
      Execute_Widget_Command(ScrollbarWidget, "set", First & " " & Last);
   end Set;

end Tcl.Tk.Ada.Widgets.TtkScrollbar;

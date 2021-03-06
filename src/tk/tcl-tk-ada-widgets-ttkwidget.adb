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

package body Tcl.Tk.Ada.Widgets.TtkWidget is

   function Identify_Element
     (Widget: in Tk_Widget'Class; X, Y: in String) return String is
   begin
      Execute_Widget_Command(Widget, "identify element", X & " " & Y);
      return Tcl.Ada.Tcl_GetResult(Widget.Interp);
   end Identify_Element;

   function InState
     (Widget: in Tk_Widget'Class; StateSpec: in String;
      Script: in String := "") return String is
   begin
      Execute_Widget_Command(Widget, "instate", StateSpec & " " & Script);
      return Tcl.Ada.Tcl_GetResult(Widget.Interp);
   end InState;

   procedure State(Widget: in Tk_Widget'Class; StateSpec: in String) is
   begin
      Execute_Widget_Command(Widget, "state", StateSpec);
   end State;

   function State(Widget: in Tk_Widget'Class) return String is
   begin
      Execute_Widget_Command(Widget, "state");
      return Tcl.Ada.Tcl_GetResult(Widget.Interp);
   end State;

end Tcl.Tk.Ada.Widgets.TtkWidget;

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

package body Tcl.Tk.Ada.Event is

   procedure Add
     (Virtual, Sequence: in String; Interp: Tcl_Interp := Get_Context) is
   begin
      Tcl_Eval(Interp, "event add " & Virtual & " " & Sequence);
   end Add;

   procedure Delete
     (Virtual: in String; Sequence: in String := "";
      Interp: Tcl_Interp := Get_Context) is
   begin
      Tcl_Eval(Interp, "event delete " & Virtual & " " & Sequence);
   end Delete;

   procedure Generate
     (Window: in Tk_Widget'Class; EventName: in String;
      Options: in String := "") is
   begin
      Tcl_Eval
        (Window.Interp,
         "event generate " & Widget_Image(Window) & " " & EventName & " " &
         Options);
   end Generate;

   function Info
     (EventName: in String := ""; Interp: Tcl_Interp := Get_Context)
      return String is
   begin
      Tcl_Eval(Interp, "event info " & EventName);
      return Tcl.Ada.Tcl_GetResult(Interp);
   end Info;

end Tcl.Tk.Ada.Event;

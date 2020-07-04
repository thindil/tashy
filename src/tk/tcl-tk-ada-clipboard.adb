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

package body Tcl.Tk.Ada.Clipboard is

   procedure Append
     (Data: in String; Window: in Tk_Widget'Class;
      Format, CType: in String := "STRING") is
   begin
      Tcl_Eval
        (Window.Interp,
         "clipboard append -displayof " & Widget_Image(Window) & " -format " &
         Format & " -type " & CType & " " & Data);
   end Append;

   procedure Clear(Window: in Tk_Widget'Class) is
   begin
      Tcl_Eval
        (Window.Interp, "clipboard clear -displayof " & Widget_Image(Window));
   end Clear;

   function Get
     (Window: in Tk_Widget'Class; CType: in String := "STRING")
      return String is
   begin
      Tcl_Eval
        (Window.Interp,
         "clipboard get -displayof " & Widget_Image(Window) & " -type " &
         CType);
      return Tcl.Ada.Tcl_GetResult(Window.Interp);
   end Get;

   procedure Selection_Clear
     (Window: in Tk_Widget'Class; Selection: in String := "PRIMARY") is
   begin
      Tcl_Eval
        (Window.Interp,
         "selection clear -displayof " & Widget_Image(Window) &
         " -selection " & Selection);
   end Selection_Clear;

end Tcl.Tk.Ada.Clipboard;

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

with Interfaces.C.Strings; use Interfaces.C.Strings;
with Tcl.Ada;

package body Tcl.Tklib.Ada.Tooltip is

   procedure Tooltip_Init(Interp: in Tcl_Interp) is
   begin
      if Tcl.Ada.Tcl_Eval(Interp, "package require tooltip") /= 0 then
         raise Program_Error
           with "Failed to load tooltip package: " &
           Tcl.Ada.Tcl_GetStringResult(Interp);
      end if;
   end Tooltip_Init;

   procedure Add
     (Widget: in Tk_Widget'Class; Message: in String;
      Options: in String := "") is
   begin
      if Tcl_Eval
          (Widget.Interp,
           New_String
             ("tooltip::tooltip " & Widget_Image(Widget) & " " & Options &
              " """ & Message & """")) /=
        0 then
         raise Program_Error with Tcl.Ada.Tcl_GetStringResult(Widget.Interp);
      end if;
   end Add;

   procedure Clear(Pattern: in String; Interp: in Tcl_Interp := Get_Context) is
   begin
      Tcl.Ada.Tcl_Eval(Interp, "tooltip::tooltip clear " & Pattern);
   end Clear;

   procedure Disable(Interp: in Tcl_Interp := Get_Context) is
   begin
      Tcl.Ada.Tcl_Eval(Interp, "tooltip::tooltip disable");
   end Disable;

   procedure Enable(Interp: in Tcl_Interp := Get_Context) is
   begin
      Tcl.Ada.Tcl_Eval(Interp, "tooltip::tooltip enable");
   end Enable;

end Tcl.Tklib.Ada.Tooltip;

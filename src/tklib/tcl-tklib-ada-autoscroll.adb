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

package body Tcl.Tklib.Ada.Autoscroll is

   procedure Autoscroll_Init(Interp: in Tcl_Interp) is
   begin
      if Tcl.Ada.Tcl_Eval(Interp, "package require autoscroll") /= 0 then
         raise Program_Error
           with "Failed to load autoscroll package: " &
           Tcl.Ada.Tcl_GetStringResult(Interp);
      end if;
   end Autoscroll_Init;

   procedure Autoscroll(Scroll: in Tk_Widget'Class) is
   begin
      Tcl.Ada.Tcl_Eval
        (Scroll.Interp, "::autoscroll::autoscroll " & Widget_Image(Scroll));
   end Autoscroll;

   procedure Wrap(Interp: in Tcl_Interp) is
   begin
      Tcl.Ada.Tcl_Eval(Interp, "::autoscroll::wrap");
   end Wrap;

   procedure Unautoscroll(Scroll: in Tk_Widget'Class) is
   begin
      Tcl.Ada.Tcl_Eval
        (Scroll.Interp, "::autoscroll::unautoscroll " & Widget_Image(Scroll));
   end Unautoscroll;

   procedure Unwrap(Interp: in Tcl_Interp) is
   begin
      Tcl.Ada.Tcl_Eval(Interp, "::autoscroll::unwrap");
   end Unwrap;

end Tcl.Tklib.Ada.Autoscroll;

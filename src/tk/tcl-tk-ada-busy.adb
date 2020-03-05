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

package body Tcl.Tk.Ada.Busy is

   procedure Busy(Window: in Tk_Widget'Class; Options: in String := "") is
   begin
      Tcl_Eval
        (Window.Interp, "tk busy " & Widget_Image(Window) & " " & Options);
   end Busy;

   function cget
     (Window: in Tk_Widget'Class; Option: in String) return String is
   begin
      Tcl_Eval
        (Window.Interp, "tk busy cget " & Widget_Image(Window) & " " & Option);
      return Tcl.Ada.Tcl_GetResult(Window.Interp);
   end cget;

   procedure Configure(Window: in Tk_Widget'Class; Options: in String) is
   begin
      Tcl_Eval
        (Window.Interp,
         "tk busy configure " & Widget_Image(Window) & " " & Options);
   end Configure;

   function Configure
     (Window: in Tk_Widget'Class; Option: in String := "") return String is
   begin
      Tcl_Eval
        (Window.Interp,
         "tk busy configure " & Widget_Image(Window) & " " & Option);
      return Tcl.Ada.Tcl_GetResult(Window.Interp);
   end Configure;

   function Current(Pattern: in String := "") return String is
   begin
      Tcl_Eval(Get_Context, "tk busy current " & Pattern);
      return Tcl.Ada.Tcl_GetResult(Get_Context);
   end Current;

   procedure Forget(Window: in Tk_Widget'Class) is
   begin
      Tcl_Eval(Window.Interp, "tk busy forget " & Widget_Image(Window));
   end Forget;

   function Status(Window: in Tk_Widget'Class) return String is
   begin
      Tcl_Eval(Window.Interp, "tk busy status " & Widget_Image(Window));
      return Tcl.Ada.Tcl_GetResult(Window.Interp);
   end Status;

end Tcl.Tk.Ada.Busy;

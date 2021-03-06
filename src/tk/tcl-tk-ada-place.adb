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

package body Tcl.Tk.Ada.Place is

   procedure Place(Slave: in Tk_Widget'Class; Options: in String := "") is
   begin
      Tcl_Eval(Slave.Interp, "place " & Slave & " " & Options);
   end Place;

   procedure Place_Configure
     (Slave: in Tk_Widget'Class; Options: in String := "") is
   begin
      Tcl_Eval(Slave.Interp, "place configure " & Slave & " " & Options);
   end Place_Configure;

   procedure Place_Forget(Slave: in Tk_Widget'Class) is
   begin
      Tcl_Eval(Slave.Interp, "place forget " & Slave);
   end Place_Forget;

   function Place_Info(Slave: in Tk_Widget'Class) return String is
   begin
      Tcl_Eval(Slave.Interp, "place info " & Slave);
      return Tcl.Ada.Tcl_GetResult(Slave.Interp);
   end Place_Info;

   function Place_Slaves(Master: in Tk_Widget'Class) return String is
   begin
      Tcl_Eval(Master.Interp, "place slaves " & Master);
      return Tcl.Ada.Tcl_GetResult(Master.Interp);
   end Place_Slaves;

end Tcl.Tk.Ada.Place;

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

package body Tcl.Tk.Ada.Pack is

   procedure Pack(Slave: in Tk_Widget'Class; Options: in String := "") is
   begin --  Pack
      Tcl_Eval(Slave.Interp, "pack " & Widget_Image(Slave) & " " & Options);
   end Pack;

   procedure Pack_Configure
     (Slave: in Tk_Widget'Class; Options: in String := "") is
   begin --  Pack_Configure
      Tcl_Eval
        (Slave.Interp,
         "pack configure " & Widget_Image(Slave) & " " & Options);
   end Pack_Configure;

   procedure Pack_Forget(Slave: in Tk_Widget'Class) is
   begin --  Pack_Forget
      Tcl_Eval(Slave.Interp, "pack forget " & Widget_Image(Slave));
   end Pack_Forget;

   function Pack_Info(Slave: in Tk_Widget'Class) return String is
   begin --  Pack_Info
      Tcl_Eval(Slave.Interp, "pack info " & Widget_Image(Slave));
      return Tcl.Ada.Tcl_GetResult(Slave.Interp);
   end Pack_Info;

   procedure Pack_Propagate(Master: in Tk_Widget'Class; State: in Boolean) is
   begin --  Pack_Propagate
      Tcl_Eval
        (Master.Interp,
         "pack propagate " & Widget_Image(Master) & " " &
         Integer'Image(Boolean'Pos(State)));
   end Pack_Propagate;

   function Pack_Propagate(Master: in Tk_Widget'Class) return Boolean is
   begin --  Pack_Propagate
      Tcl_Eval(Master.Interp, "pack propagate " & Widget_Image(Master));
      return Integer'Value(Tcl.Ada.Tcl_GetResult(Master.Interp)) = 1;
   end Pack_Propagate;

   function Pack_Slaves(Master: in Tk_Widget'Class) return String is
   begin --  Pack_Slaves
      Tcl_Eval(Master.Interp, "pack slaves " & Widget_Image(Master));
      return Tcl.Ada.Tcl_GetResult(Master.Interp);
   end Pack_Slaves;

end Tcl.Tk.Ada.Pack;

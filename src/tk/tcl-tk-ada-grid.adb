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

package body Tcl.Tk.Ada.Grid is

   procedure Grid(Slave: in Tk_Widget'Class; Options: in String := "") is
   begin
      Tcl_Eval(Slave.Interp, "grid " & Slave & " " & Options);
   end Grid;

   procedure Grid_Anchor(Master: in Tk_Widget'Class; Direction: in String) is
   begin
      Tcl_Eval(Master.Interp, "grid anchor " & Master & " " & Direction);
   end Grid_Anchor;

   function Grid_Anchor(Master: in Tk_Widget'Class) return String is
   begin
      Tcl_Eval(Master.Interp, "grid anchor " & Master);
      return Tcl.Ada.Tcl_GetResult(Master.Interp);
   end Grid_Anchor;

   function Grid_BBox
     (Master: in Tk_Widget'Class; Column, Row, Column2, Row2: in String := "")
      return String is
   begin
      Tcl_Eval
        (Master.Interp,
         "grid bbox " & Master & " " & Column & " " & Row & " " & Column2 &
         " " & Row2);
      return Tcl.Ada.Tcl_GetResult(Master.Interp);
   end Grid_BBox;

   procedure Column_Configure
     (Master, Slave: in Tk_Widget'Class; Options: in String) is
   begin
      Tcl_Eval
        (Master.Interp,
         "grid columnconfigure " & Master & " " & Slave & " " & Options);
   end Column_Configure;

   function Column_Configure
     (Master, Slave: in Tk_Widget'Class) return String is
   begin
      Tcl_Eval(Master.Interp, "grid columnconfigure " & Master & " " & Slave);
      return Tcl.Ada.Tcl_GetResult(Master.Interp);
   end Column_Configure;

   procedure Grid_Configure
     (Slave: in Tk_Widget'Class; Options: in String := "") is
   begin
      Tcl_Eval(Slave.Interp, "grid configure " & Slave & " " & Options);
   end Grid_Configure;

   procedure Grid_Forget(Slave: in Tk_Widget'Class) is
   begin
      Tcl_Eval(Slave.Interp, "grid forget " & Slave);
   end Grid_Forget;

   function Grid_Info(Slave: in Tk_Widget'Class) return String is
   begin
      Tcl_Eval(Slave.Interp, "grid info " & Slave);
      return Tcl.Ada.Tcl_GetResult(Slave.Interp);
   end Grid_Info;

   function Grid_Location
     (Master: in Tk_Widget'Class; X, Y: in String) return String is
   begin
      Tcl_Eval(Master.Interp, "grid location " & Master & " " & X & " " & Y);
      return Tcl.Ada.Tcl_GetResult(Master.Interp);
   end Grid_Location;

   procedure Grid_Propagate(Master: in Tk_Widget'Class; Value: in String) is
   begin
      Tcl_Eval(Master.Interp, "grid propagate " & Master & " " & Value);
   end Grid_Propagate;

   function Grid_Propagate(Master: in Tk_Widget'Class) return String is
   begin
      Tcl_Eval(Master.Interp, "grid propagate " & Master);
      return Tcl.Ada.Tcl_GetResult(Master.Interp);
   end Grid_Propagate;

   procedure Grid_Remove(Slave: in Tk_Widget'Class) is
   begin
      Tcl_Eval(Slave.Interp, "grid remove " & Slave);
   end Grid_Remove;

   procedure Row_Configure
     (Master, Slave: in Tk_Widget'Class; Options: in String) is
   begin
      Tcl_Eval
        (Master.Interp,
         "grid rowconfigure " & Master & " " & Slave & " " & Options);
   end Row_Configure;

   function Row_Configure(Master, Slave: in Tk_Widget'Class) return String is
   begin
      Tcl_Eval(Master.Interp, "grid rowconfigure " & Master & " " & Slave);
      return Tcl.Ada.Tcl_GetResult(Master.Interp);
   end Row_Configure;

   function Grid_Size(Master: in Tk_Widget'Class) return String is
   begin
      Tcl_Eval(Master.Interp, "grid size " & Master);
      return Tcl.Ada.Tcl_GetResult(Master.Interp);
   end Grid_Size;

   function Grid_Slaves
     (Master: in Tk_Widget'Class; Option: in String := "") return String is
   begin
      Tcl_Eval(Master.Interp, "grid slaves " & Master & " " & Option);
      return Tcl.Ada.Tcl_GetResult(Master.Interp);
   end Grid_Slaves;

end Tcl.Tk.Ada.Grid;

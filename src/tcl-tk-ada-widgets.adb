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

-- As a special exception, if other files instantiate generics from this
-- unit, or you link this unit with other files to produce an executable,
-- this unit does not by itself cause the resulting executable to be
-- covered by the GNU General Public License. This exception does not
-- however invalidate any other reasons why the executable file might be
-- covered by the GNU Public License.

-- As a special exception, if other files instantiate generics from this
-- unit, or you link this unit with other files to produce an executable,
-- this unit does not by itself cause the resulting executable to be
-- covered by the GNU General Public License. This exception does not
-- however invalidate any other reasons why the executable file might be
-- covered by the GNU Public License.

with Tcl.Ada;

package body Tcl.Tk.Ada.Widgets is

   function Widget_Image(Win: in Tk_Widget'Class) return String is
   begin --  Widget_Image
      return CHelper.Value(Win.Name);
   end Widget_Image;

   function "&"
     (Left: in Tk_Widget'Class; Right: in Tk_Widget'Class) return String is
   begin --  "&"
      return Widget_Image(Left) & Widget_Image(Right);
   end "&";

   function "&"(Left: in Tk_Widget'Class; Right: in String) return String is
   begin --  "&"
      return Widget_Image(Left) & Right;
   end "&";

   function "&"(Left: in String; Right: in Tk_Widget'Class) return String is
   begin --  "&"
      return Left & Widget_Image(Right);
   end "&";

   function Get_Interp(Widgt: in Tk_Widget'Class) return Tcl_Interp is
   begin --  Get_Interp
      return Widgt.Interp;
   end Get_Interp;

   procedure Destroy(Widgt: in out Tk_Widget'Class) is
   begin --  Destroy
      Execute_Widget_Command(Widgt, "destroy");
      C.Strings.Free(Widgt.Name);
   end Destroy;

   function cget(Widgt: in Tk_Widget'Class; option: in String) return String is
   begin --  cget
      Execute_Widget_Command(Widgt, "cget", option);
      return Tcl.Ada.Tcl_GetResult(Widgt.Interp);
   end cget;

   function configure
     (Widgt: in Tk_Widget'Class; options: in String := "") return String is
   begin --  configure
      Execute_Widget_Command(Widgt, "configure", options);
      return Tcl.Ada.Tcl_GetResult(Widgt.Interp);
   end configure;

   procedure configure(Widgt: in Tk_Widget'Class; options: in String := "") is
   begin --  configure
      Execute_Widget_Command(Widgt, "configure", options);
   end configure;

   procedure Bind
     (Widgt: in Tk_Widget'Class; Sequence: in String; Script: in String) is
   begin --  Bind
      Tcl_Eval
        (Widgt.Interp,
         "bind " & Widget_Image(Widgt) & " " & Sequence & " " & Script);
   end Bind;

   procedure Unbind(Widgt: in Tk_Widget'Class; Sequence: in String) is
   begin --  Unbind
      Tcl_Eval(Widgt.Interp, "bind " & Widget_Image(Widgt) & " " & Sequence);
   end Unbind;

   function Unbind
     (Widgt: in Tk_Widget'Class; Sequence: in String) return String is
   begin --  Unbind
      Tcl_Eval(Widgt.Interp, "bind " & Widget_Image(Widgt) & " " & Sequence);
      return Tcl.Ada.Tcl_GetResult(Widgt.Interp);
   end Unbind;

   procedure Bind_To_Main_Window
     (Interp: in Tcl_Interp; Sequence: in String; Script: in String) is
   begin --  Bind_To_Main_Window
      Tcl_Eval(Interp, "bind . " & Sequence & " " & Script);
   end Bind_To_Main_Window;

   procedure Unbind_From_Main_Window
     (Interp: in Tcl_Interp; Sequence: in String) is
   begin --  Unbind_From_Main_Window
      Tcl_Eval(Interp, "bind . " & Sequence);
   end Unbind_From_Main_Window;

   function Unbind_From_Main_Window
     (Interp: in Tcl_Interp; Sequence: in String) return String is
   begin --  Unbind_From_Main_Window
      Tcl_Eval(Interp, "bind . " & Sequence);
      return Tcl.Ada.Tcl_GetResult(Interp);
   end Unbind_From_Main_Window;

   procedure Wm_Set
     (Widgt: in Tk_Widget'Class; Action: in String;
      Options: in String := "") is
   begin
      Tcl_Eval
        (Widgt.Interp,
         "wm " & Action & " " & Widget_Image(Widgt) & " " & Options);
   end Wm_Set;

   procedure Pack(Slave: in Tk_Widget'Class; Options: in String) is
   begin --  Pack
      Tcl_Eval(Slave.Interp, "pack " & Widget_Image(Slave) & " " & Options);
   end Pack;

   procedure Pack_Configure(Slave: in Tk_Widget'Class; Options: in String) is
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

   procedure Execute_Widget_Command
     (Widgt: in Tk_Widget'Class; command: in String;
      options: in String := "") is
   begin --  Execute_Widget_Command
      Tcl_Eval
        (Widgt.Interp, Widget_Image(Widgt) & " " & command & " " & options);
   end Execute_Widget_Command;

end Tcl.Tk.Ada.Widgets;

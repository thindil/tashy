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

with Tcl.Ada;

package body Tcl.Tk.Ada.Widgets is

   function Widget_Image(Win: in Tk_Widget'Class) return String is
   begin --  Widget_Image
      return CHelper.Value(Win.Name);
   end Widget_Image;

   function "&"(Left: in Tk_Widget'Class; Right: in Tk_Widget'Class) return String is
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
     (Widgt: in Tk_Widget'Class; Action: in String; Options: in String := "") is
   begin
      Tcl_Eval
        (Widgt.Interp,
         "wm " & Action & " " & Widget_Image(Widgt) & " " & Options);
   end Wm_Set;

   function Create
     (pathName: in String; options: in String := "") return Toplevel is
   begin --  Create
      return Create(Context, pathName, options);
   end Create;

   procedure Create
     (Widgt: out Toplevel; pathName: in String; options: in String := "") is
   begin --  Create
      Widgt := Create(Context, pathName, options);
   end Create;

   function Create
     (Interp: in Tcl_Interp; pathName: in String; options: in String := "")
      return Toplevel is
      --
      The_Widget: Toplevel;
   begin --  Create
      The_Widget.Interp := Interp;
      The_Widget.Name := C.Strings.New_String(pathName);
      Tcl_Eval(The_Widget.Interp, "toplevel " & pathName & " " & options);
      return The_Widget;
   end Create;

   procedure Create
     (Widgt: out Toplevel; Interp: in Tcl_Interp; pathName: in String;
      options: in String := "") is
   begin --  Create
      Widgt := Create(Interp, pathName, options);
   end Create;

   function Create
     (pathName: in String; options: in String := "") return Label is
   begin --  Create
      return Create(Context, pathName, options);
   end Create;

   procedure Create
     (Widgt: out Label; pathName: in String; options: in String := "") is
   begin --  Create
      Widgt := Create(Context, pathName, options);
   end Create;

   function Create
     (Interp: in Tcl_Interp; pathName: in String; options: in String := "")
      return Label is
      --
      The_Widget: Label;
   begin --  Create
      The_Widget.Interp := Interp;
      The_Widget.Name := C.Strings.New_String(pathName);
      Tcl_Eval(The_Widget.Interp, "label " & pathName & " " & options);
      return The_Widget;
   end Create;

   procedure Create
     (Widgt: out Label; Interp: in Tcl_Interp; pathName: in String;
      options: in String := "") is
   begin --  Create
      Widgt := Create(Interp, pathName, options);
   end Create;

   function Create
     (pathName: in String; options: in String := "") return Message is
   begin --  Create
      return Create(Context, pathName, options);
   end Create;

   procedure Create
     (Widgt: out Message; pathName: in String; options: in String := "") is
   begin --  Create
      Widgt := Create(Context, pathName, options);
   end Create;

   function Create
     (Interp: in Tcl_Interp; pathName: in String; options: in String := "")
      return Message is
      --
      The_Widget: Message;
   begin --  Create
      The_Widget.Interp := Interp;
      The_Widget.Name := C.Strings.New_String(pathName);
      Tcl_Eval(The_Widget.Interp, "message " & pathName & " " & options);
      return The_Widget;
   end Create;

   procedure Create
     (Widgt: out Message; Interp: in Tcl_Interp; pathName: in String;
      options: in String := "") is
   begin --  Create
      Widgt := Create(Interp, pathName, options);
   end Create;

   function Create
     (pathName: in String; options: in String := "") return Button is
   begin --  Create
      return Create(Context, pathName, options);
   end Create;

   procedure Create
     (Widgt: out Button; pathName: in String; options: in String := "") is
   begin --  Create
      Widgt := Create(Context, pathName, options);
   end Create;

   function Create
     (Interp: in Tcl_Interp; pathName: in String; options: in String := "")
      return Button is
      --
      The_Widget: Button;
   begin --  Create
      The_Widget.Interp := Interp;
      The_Widget.Name := C.Strings.New_String(pathName);
      Tcl_Eval(The_Widget.Interp, "button " & pathName & " " & options);
      return The_Widget;
   end Create;

   procedure Create
     (Widgt: out Button; Interp: in Tcl_Interp; pathName: in String;
      options: in String := "") is
   begin --  Create
      Widgt := Create(Interp, pathName, options);
   end Create;

   function Create
     (pathName: in String; options: in String := "") return RadioButton is
   begin --  Create
      return Create(Context, pathName, options);
   end Create;

   procedure Create
     (Widgt: out RadioButton; pathName: in String; options: in String := "") is
   begin --  Create
      Widgt := Create(Context, pathName, options);
   end Create;

   function Create
     (Interp: in Tcl_Interp; pathName: in String; options: in String := "")
      return RadioButton is
      --
      The_Widget: RadioButton;
   begin --  Create
      The_Widget.Interp := Interp;
      The_Widget.Name := C.Strings.New_String(pathName);
      Tcl_Eval(The_Widget.Interp, "radiobutton " & pathName & " " & options);
      return The_Widget;
   end Create;

   procedure Create
     (Widgt: out RadioButton; Interp: in Tcl_Interp; pathName: in String;
      options: in String := "") is
   begin --  Create
      Widgt := Create(Interp, pathName, options);
   end Create;

   function Create
     (pathName: in String; options: in String := "") return CheckButton is
   begin --  Create
      return Create(Context, pathName, options);
   end Create;

   procedure Create
     (Widgt: out CheckButton; pathName: in String; options: in String := "") is
   begin --  Create
      Widgt := Create(Context, pathName, options);
   end Create;

   function Create
     (Interp: in Tcl_Interp; pathName: in String; options: in String := "")
      return CheckButton is
      --
      The_Widget: CheckButton;
   begin --  Create
      The_Widget.Interp := Interp;
      The_Widget.Name := C.Strings.New_String(pathName);
      Tcl_Eval(The_Widget.Interp, "checkbutton " & pathName & " " & options);
      return The_Widget;
   end Create;

   procedure Create
     (Widgt: out CheckButton; Interp: in Tcl_Interp; pathName: in String;
      options: in String := "") is
   begin --  Create
      Widgt := Create(Interp, pathName, options);
   end Create;

   function Create
     (pathName: in String; options: in String := "") return Menu is
   begin --  Create
      return Create(Context, pathName, options);
   end Create;

   procedure Create
     (Widgt: out Menu; pathName: in String; options: in String := "") is
   begin --  Create
      Widgt := Create(Context, pathName, options);
   end Create;

   function Create
     (Interp: in Tcl_Interp; pathName: in String; options: in String := "")
      return Menu is
      --
      The_Widget: Menu;
   begin --  Create
      The_Widget.Interp := Interp;
      The_Widget.Name := C.Strings.New_String(pathName);
      Tcl_Eval(The_Widget.Interp, "menu " & pathName & " " & options);
      return The_Widget;
   end Create;

   procedure Create
     (Widgt: out Menu; Interp: in Tcl_Interp; pathName: in String;
      options: in String := "") is
   begin --  Create
      Widgt := Create(Interp, pathName, options);
   end Create;

   function Create
     (pathName: in String; options: in String := "") return Ttk_Button is
   begin --  Create
      return Create(Context, pathName, options);
   end Create;

   procedure Create
     (Widgt: out Ttk_Button; pathName: in String; options: in String := "") is
   begin --  Create
      Widgt := Create(Context, pathName, options);
   end Create;

   function Create
     (Interp: in Tcl_Interp; pathName: in String; options: in String := "")
      return Ttk_Button is
      --
      The_Widget: Ttk_Button;
   begin --  Create
      The_Widget.Interp := Interp;
      The_Widget.Name := C.Strings.New_String(pathName);
      Tcl_Eval(The_Widget.Interp, "ttk::button " & pathName & " " & options);
      return The_Widget;
   end Create;

   procedure Create
     (Widgt: out Ttk_Button; Interp: in Tcl_Interp; pathName: in String;
      options: in String := "") is
   begin --  Create
      Widgt := Create(Interp, pathName, options);
   end Create;

   procedure Add
     (MenuWidget: in Menu'Class; WidgetType: in String;
      Options: in String := "") is
   begin
      Execute_Widget_Command
        (Tk_Widget'Class(MenuWidget), "add", WidgetType & " " & Options);
   end Add;

   procedure Flash(Buttn: in Button'Class) is
   begin --  Flash
      Execute_Widget_Command(Tk_Widget'Class(Buttn), "flash");
   end Flash;

   function Invoke
     (Buttn: in Button'Class; options: in String := "") return String is
   begin --  Invoke
      Execute_Widget_Command(Tk_Widget'Class(Buttn), "invoke", options);
      return Tcl.Ada.Tcl_GetResult(Buttn.Interp);
   end Invoke;

   procedure Deselect(Buttn: in RadioButton) is
   begin --  Deselect
      Execute_Widget_Command(Tk_Widget'Class(Buttn), "deselect");
   end Deselect;

   procedure Tk_Select(Buttn: in RadioButton) is
   begin --  Tk_Select
      Execute_Widget_Command(Tk_Widget'Class(Buttn), "select");
   end Tk_Select;

   procedure Toggle(Buttn: in RadioButton) is
   begin --  Toggle
      Execute_Widget_Command(Tk_Widget'Class(Buttn), "toggle");
   end Toggle;

   procedure Deselect(Buttn: in CheckButton) is
   begin --  Deselect
      Execute_Widget_Command(Tk_Widget'Class(Buttn), "deselect");
   end Deselect;

   procedure Tk_Select(Buttn: in CheckButton) is
   begin --  Tk_Select
      Execute_Widget_Command(Tk_Widget'Class(Buttn), "select");
   end Tk_Select;

   procedure Toggle(Buttn: in CheckButton) is
   begin --  Toggle
      Execute_Widget_Command(Tk_Widget'Class(Buttn), "toggle");
   end Toggle;

   function Create
     (pathName: in String; options: in String := "") return EntryWidget is
   begin --  Create
      return Create(Context, pathName, options);
   end Create;

   procedure Create
     (Widgt: out EntryWidget; pathName: in String; options: in String := "") is
   begin --  Create
      Widgt := Create(Context, pathName, options);
   end Create;

   function Create
     (Interp: in Tcl_Interp; pathName: in String; options: in String := "")
      return EntryWidget is
      --
      The_Widget: EntryWidget;
   begin --  Create
      The_Widget.Interp := Interp;
      The_Widget.Name := C.Strings.New_String(pathName);
      Tcl_Eval(The_Widget.Interp, "entry " & pathName & " " & options);
      return The_Widget;
   end Create;

   procedure Create
     (Widgt: out EntryWidget; Interp: in Tcl_Interp; pathName: in String;
      options: in String := "") is
   begin --  Create
      Widgt := Create(Interp, pathName, options);
   end Create;

   function get(Widgt: in EntryWidget) return String is
   begin --  get
      Execute_Widget_Command(Widgt, "get");
      return Tcl.Ada.Tcl_GetResult(Widgt.Interp);
   end get;

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
     (Widgt: in Tk_Widget'Class; command: in String; options: in String := "") is
   begin --  Execute_Widget_Command
      Tcl_Eval
        (Widgt.Interp, Widget_Image(Widgt) & " " & command & " " & options);
   end Execute_Widget_Command;

end Tcl.Tk.Ada.Widgets;

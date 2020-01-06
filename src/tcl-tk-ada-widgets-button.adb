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

package body Tcl.Tk.Ada.Widgets.Button is

   function Create
     (pathName: in String; options: in String := "") return Tk_Button is
   begin --  Create
      return Create(Context, pathName, options);
   end Create;

   procedure Create
     (Widgt: out Tk_Button; pathName: in String; options: in String := "") is
   begin --  Create
      Widgt := Create(Context, pathName, options);
   end Create;

   function Create
     (Interp: in Tcl_Interp; pathName: in String; options: in String := "")
      return Tk_Button is
      --
      The_Widget: Tk_Button;
   begin --  Create
      The_Widget.Interp := Interp;
      The_Widget.Name := C.Strings.New_String(pathName);
      Tcl_Eval(The_Widget.Interp, "button " & pathName & " " & options);
      return The_Widget;
   end Create;

   procedure Create
     (Widgt: out Tk_Button; Interp: in Tcl_Interp; pathName: in String;
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

   procedure Flash(Buttn: in Tk_Button'Class) is
   begin --  Flash
      Execute_Widget_Command(Tk_Widget'Class(Buttn), "flash");
   end Flash;

   function Invoke
     (Buttn: in Tk_Button'Class; options: in String := "") return String is
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

end Tcl.Tk.Ada.Widgets.Button;

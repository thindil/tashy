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

with Tcl.Ada; use Tcl.Ada;
with Tcl.Tk.Ada.Widgets; use Tcl.Tk.Ada.Widgets;

package body Tcl.Tk.Ada.Dialogs is

   function Choose_Color(Options: in String := "") return String is
   begin
      Tcl_Eval(Get_Context, "tk_chooseColor " & Options);
      return Tcl_GetResult(Get_Context);
   end Choose_Color;

   function Choose_Directory(Options: in String := "") return String is
   begin
      Tcl_Eval(Get_Context, "tk_chooseDirectory " & Options);
      return Tcl_GetResult(Get_Context);
   end Choose_Directory;

   function Dialog
     (Widget: in out Tk_Toplevel; Title, Text, Bitmap: in String;
      Default: in Integer; Buttons: in DialogButtons) return Integer is
      ButtonsString: Unbounded_String := Null_Unbounded_String;
   begin
      for Button of Buttons loop
         Append(ButtonsString, " " & Button);
      end loop;
      Tcl_Eval
        (Get_Context,
         "tk_dialog " & Widget_Image(Widget) & " """ & Title & """ """ & Text &
         """ " & Bitmap & Integer'Image(Default) & To_String(ButtonsString));
      return Integer'Value(Tcl_GetResult(Get_Context));
   end Dialog;

   procedure FontChooser_Configure(Options: in String) is
   begin
      Tcl_Eval(Get_Context, "tk_fontchooser " & Options);
   end FontChooser_Configure;

   function FontChooser_Configure(Option: in String := "") return String is
   begin
      Tcl_Eval(Get_Context, "tk_fontchooser configure " & Option);
      return Tcl_GetResult(Get_Context);
   end FontChooser_Configure;

   procedure FontChooser_Show is
   begin
      Tcl_Eval(Get_Context, "tk_fontchooser show");
   end FontChooser_Show;

   function Get_Open_File(Options: in String := "") return String is
   begin
      Tcl_Eval(Get_Context, "tk_getOpenFile " & Options);
      return Tcl_GetResult(Get_Context);
   end Get_Open_File;

   function Get_Save_File(Options: in String := "") return String is
   begin
      Tcl_Eval(Get_Context, "tk_getSaveFile " & Options);
      return Tcl_GetResult(Get_Context);
   end Get_Save_File;

   function MessageBox(Options: in String := "") return String is
   begin
      Tcl_Eval(Get_Context, "tk_messageBox " & Options);
      return Tcl_GetResult(Get_Context);
   end MessageBox;

end Tcl.Tk.Ada.Dialogs;

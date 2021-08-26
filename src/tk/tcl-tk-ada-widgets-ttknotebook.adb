-- Copyright (c) 2020 Bartek thindil Jasicki <thindil@laeran.pl>
--
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
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

package body Tcl.Tk.Ada.Widgets.TtkNotebook is

   function Create
     (pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := Null_Interp) return Ttk_Notebook is
      The_Widget: Ttk_Notebook;
   begin
      if Interp = Null_Interp then
         The_Widget.Interp := Context;
      else
         The_Widget.Interp := Interp;
      end if;
      The_Widget.Name := C.Strings.New_String(pathName);
      Tcl_Eval(The_Widget.Interp, "ttk::notebook " & pathName & " " & options);
      return The_Widget;
   end Create;

   procedure Create
     (Widgt: out Ttk_Notebook; pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := Null_Interp) is
   begin
      Widgt := Create(pathName, options, Interp);
   end Create;

   overriding function Get_Widget
     (pathName: in String; Interp: in Tcl_Interp := Get_Context)
      return Ttk_Notebook is
   begin
      return New_Notebook: Ttk_Notebook do
         New_Notebook.Interp := Interp;
         New_Notebook.Name := C.Strings.New_String(pathName);
      end return;
   end Get_Widget;

   procedure Add
     (Notebook: in Ttk_Notebook; WindowName: in String;
      Options: String := "") is
   begin
      Execute_Widget_Command(Notebook, "add", WindowName & " " & Options);
   end Add;

   procedure Forget(Notebook: in Ttk_Notebook; TabId: in String) is
   begin
      Execute_Widget_Command(Notebook, "forget", TabId);
   end Forget;

   procedure Hide(Notebook: in Ttk_Notebook; TabId: in String) is
   begin
      Execute_Widget_Command(Notebook, "hide", TabId);
   end Hide;

   function Identify_Element
     (Notebook: in Ttk_Notebook; X, Y: in String) return String is
   begin
      Execute_Widget_Command(Notebook, "identify element", X & " " & Y);
      return Tcl.Ada.Tcl_GetResult(Notebook.Interp);
   end Identify_Element;

   function Identify_Tab
     (Notebook: in Ttk_Notebook; X, Y: in String) return String is
   begin
      Execute_Widget_Command(Notebook, "identify tab", X & " " & Y);
      return Tcl.Ada.Tcl_GetResult(Notebook.Interp);
   end Identify_Tab;

   function Index(Notebook: in Ttk_Notebook; TabId: in String) return String is
   begin
      Execute_Widget_Command(Notebook, "index", TabId);
      return Tcl.Ada.Tcl_GetResult(Notebook.Interp);
   end Index;

   procedure Insert
     (Notebook: in Ttk_Notebook; Pos: in String; SubWindow: in Tk_Widget'Class;
      Options: in String) is
   begin
      Execute_Widget_Command
        (Notebook, "insert", Pos & " " & SubWindow & " " & Options);
   end Insert;

   procedure Notebook_Select(Notebook: in Ttk_Notebook; TabId: in String) is
   begin
      Execute_Widget_Command(Notebook, "select", TabId);
   end Notebook_Select;

   function Get_Selected(Notebook: in Ttk_Notebook) return String is
   begin
      Execute_Widget_Command(Notebook, "select");
      return Tcl.Ada.Tcl_GetResult(Notebook.Interp);
   end Get_Selected;

   procedure Tab(Notebook: in Ttk_Notebook; TabId, Options: in String) is
   begin
      Execute_Widget_Command(Notebook, "tab", TabId & " " & Options);
   end Tab;

   function Tab
     (Notebook: in Ttk_Notebook; TabId: in String; Option: in String := "")
      return String is
   begin
      Execute_Widget_Command(Notebook, "tab", TabId & " " & Option);
      return Tcl.Ada.Tcl_GetResult(Notebook.Interp);
   end Tab;

   function Tabs(Notebook: in Ttk_Notebook) return String is
   begin
      return Tcl.Ada.Tcl_GetResult(Notebook.Interp);
   end Tabs;

end Tcl.Tk.Ada.Widgets.TtkNotebook;

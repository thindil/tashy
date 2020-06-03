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

package body Tcl.Tk.Ada.Widgets.TtkPanedWindow is

   function Create
     (pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) return Ttk_PanedWindow is
      The_Widget: Ttk_PanedWindow;
   begin
      if Interp = null then
         The_Widget.Interp := Context;
      else
         The_Widget.Interp := Interp;
      end if;
      The_Widget.Name := C.Strings.New_String(pathName);
      Tcl_Eval
        (The_Widget.Interp, "ttk::panedwindow " & pathName & " " & options);
      return The_Widget;
   end Create;

   procedure Create
     (Widgt: out Ttk_PanedWindow; pathName: in String;
      options: in String := ""; Interp: in Tcl_Interp := null) is
   begin
      Widgt := Create(pathName, options, Interp);
   end Create;

   procedure Add
     (Paned: in Ttk_PanedWindow; SubWindow: in Tk_Widget'Class;
      Options: in String := "") is
   begin
      Execute_Widget_Command
        (Paned, "add", Widget_Image(SubWindow) & " " & Options);
   end Add;

   procedure Forget
     (Paned: in Ttk_PanedWindow; SubWindow: in Tk_Widget'Class) is
   begin
      Execute_Widget_Command(Paned, "forget", Widget_Image(SubWindow));
   end Forget;

   procedure Insert
     (Paned: in Ttk_PanedWindow; Position: in String;
      SubWindow: in Tk_Widget'Class; Options: in String := "") is
   begin
      Execute_Widget_Command
        (Paned, "insert",
         Position & " " & Widget_Image(SubWindow) & " " & Options);
   end Insert;

   function Identify_Element
     (Paned: in Ttk_PanedWindow; X, Y: in String) return String is
   begin
      Execute_Widget_Command(Paned, "identify element", X & " " & Y);
      return Tcl.Ada.Tcl_GetResult(Paned.Interp);
   end Identify_Element;

   function Identify_Sash
     (Paned: in Ttk_PanedWindow; X, Y: in String) return String is
   begin
      Execute_Widget_Command(Paned, "identify sash", X & " " & Y);
      return Tcl.Ada.Tcl_GetResult(Paned.Interp);
   end Identify_Sash;

   procedure Pane(Paned: in Ttk_PanedWindow; Index, Options: in String) is
   begin
      Execute_Widget_Command(Paned, "pane", Index & " " & Options);
   end Pane;

   function Pane
     (Paned: in Ttk_PanedWindow; Index: in String; Option: in String := "")
      return String is
   begin
      Execute_Widget_Command(Paned, "pane", Index & " " & Option);
      return Tcl.Ada.Tcl_GetResult(Paned.Interp);
   end Pane;

   function Panes(Paned: in Ttk_PanedWindow) return String is
   begin
      Execute_Widget_Command(Paned, "panes");
      return Tcl.Ada.Tcl_GetResult(Paned.Interp);
   end Panes;

end Tcl.Tk.Ada.Widgets.TtkPanedWindow;

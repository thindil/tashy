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

package body Tcl.Tk.Ada.Widgets.PanedWindow is

   function Create
     (pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := Null_Interp) return Tk_PanedWindow is
      The_Widget: Tk_PanedWindow;
   begin
      if Interp = Null_Interp then
         The_Widget.Interp := Context;
      else
         The_Widget.Interp := Interp;
      end if;
      The_Widget.Name := C.Strings.New_String(pathName);
      Tcl_Eval(The_Widget.Interp, "panedwindow " & pathName & " " & options);
      return The_Widget;
   end Create;

   procedure Create
     (Widgt: out Tk_PanedWindow; pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := Null_Interp) is
   begin
      Widgt := Create(pathName, options, Interp);
   end Create;

   overriding function Get_Widget
     (pathName: in String; Interp: in Tcl_Interp := Get_Context)
      return Tk_PanedWindow is
   begin
      return New_PanedWindow: Tk_PanedWindow do
         New_PanedWindow.Interp := Interp;
         New_PanedWindow.Name := C.Strings.New_String(pathName);
      end return;
   end Get_Widget;

   procedure Add
     (Paned: in Tk_PanedWindow; SubWindow: in Tk_Widget'Class;
      Options: in String := "") is
   begin
      Execute_Widget_Command(Paned, "add", SubWindow & " " & Options);
   end Add;

   procedure Forget(Paned: in Tk_PanedWindow; SubWindow: in Tk_Widget'Class) is
   begin
      Execute_Widget_Command(Paned, "forget", Widget_Image(SubWindow));
   end Forget;

   function Identify
     (Paned: in Tk_PanedWindow; X, Y: in String) return String is
   begin
      Execute_Widget_Command(Paned, "identify", X & " " & Y);
      return Tcl.Ada.Tcl_GetResult(Paned.Interp);
   end Identify;

   function Pane_Cget
     (Paned: in Tk_PanedWindow; Window, Option: in String) return String is
   begin
      Execute_Widget_Command(Paned, "panecget", Window & " " & Option);
      return Tcl.Ada.Tcl_GetResult(Paned.Interp);
   end Pane_Cget;

   procedure Pane_Configure
     (Paned: in Tk_PanedWindow; Window, Options: in String) is
   begin
      Execute_Widget_Command(Paned, "paneconfigure", Window & " " & Options);
   end Pane_Configure;

   function Pane_Configure
     (Paned: in Tk_PanedWindow; Window: in String; Options: in String := "")
      return String is
   begin
      Execute_Widget_Command(Paned, "paneconfigure", Window & " " & Options);
      return Tcl.Ada.Tcl_GetResult(Paned.Interp);
   end Pane_Configure;

   function Panes(Paned: in Tk_PanedWindow) return String is
   begin
      Execute_Widget_Command(Paned, "panes");
      return Tcl.Ada.Tcl_GetResult(Paned.Interp);
   end Panes;

   function Proxy_Coord(Paned: in Tk_PanedWindow) return String is
   begin
      Execute_Widget_Command(Paned, "proxy coord");
      return Tcl.Ada.Tcl_GetResult(Paned.Interp);
   end Proxy_Coord;

   procedure Proxy_Forget(Paned: in Tk_PanedWindow) is
   begin
      Execute_Widget_Command(Paned, "proxy forget");
   end Proxy_Forget;

   procedure Proxy_Place(Paned: in Tk_PanedWindow; X, Y: in String) is
   begin
      Execute_Widget_Command(Paned, "proxy place", X & " " & Y);
   end Proxy_Place;

   function Sash_Coord
     (Paned: in Tk_PanedWindow; Index: in String) return String is
   begin
      Execute_Widget_Command(Paned, "sash coord", Index);
      return Tcl.Ada.Tcl_GetResult(Paned.Interp);
   end Sash_Coord;

   procedure Sash_DragTo(Paned: in Tk_PanedWindow; Index, X, Y: in String) is
   begin
      Execute_Widget_Command(Paned, "sash dragto", Index & " " & X & " " & Y);
   end Sash_DragTo;

   procedure Sash_Mark(Paned: in Tk_PanedWindow; Index, X, Y: in String) is
   begin
      Execute_Widget_Command(Paned, "sash mark", Index & " " & X & " " & Y);
   end Sash_Mark;

   procedure Sash_Place(Paned: in Tk_PanedWindow; Index, X, Y: in String) is
   begin
      Execute_Widget_Command(Paned, "sash place", Index & " " & X & " " & Y);
   end Sash_Place;

end Tcl.Tk.Ada.Widgets.PanedWindow;

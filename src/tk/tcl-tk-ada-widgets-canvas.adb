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

package body Tcl.Tk.Ada.Widgets.Canvas is

   function Create
     (pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) return Tk_Canvas is
      The_Widget: Tk_Canvas;
   begin
      if Interp = null then
         The_Widget.Interp := Context;
      else
         The_Widget.Interp := Interp;
      end if;
      The_Widget.Name := C.Strings.New_String(pathName);
      Tcl_Eval(The_Widget.Interp, "canvas " & pathName & " " & options);
      return The_Widget;
   end Create;

   procedure Create
     (Widgt: out Tk_Canvas; pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) is
   begin
      Widgt := Create(pathName, options, Interp);
   end Create;

   procedure Add_Tag
     (CanvasWidget: in Tk_Canvas; Tag, SearchSpec: in String;
      Arguments: in String := "") is
   begin
      Execute_Widget_Command
        (CanvasWidget, "addtag", Tag & " " & SearchSpec & " " & Arguments);
   end Add_Tag;

   function BBox
     (CanvasWidget: in Tk_Canvas; TagOrId: in String) return String is
   begin
      Execute_Widget_Command(CanvasWidget, "bbox", TagOrId);
      return Tcl.Ada.Tcl_GetResult(CanvasWidget.Interp);
   end BBox;

   procedure Bind
     (CanvasWidget: in Tk_Canvas; TagOrId, Sequence, Command: in String) is
   begin
      Execute_Widget_Command
        (CanvasWidget, "bind", TagOrId & " " & Sequence & " " & Command);
   end Bind;

   function Bind
     (CanvasWidget: in Tk_Canvas; TagOrId: in String;
      Sequence: in String := "") return String is
   begin
      Execute_Widget_Command(CanvasWidget, "bind", TagOrId & " " & Sequence);
      return Tcl.Ada.Tcl_GetResult(CanvasWidget.Interp);
   end Bind;

   function CanvasX
     (CanvasWidget: in Tk_Canvas; ScreenX: in String;
      GridSpacing: in String := "") return String is
   begin
      Execute_Widget_Command
        (CanvasWidget, "canvasx", ScreenX & " " & GridSpacing);
      return Tcl.Ada.Tcl_GetResult(CanvasWidget.Interp);
   end CanvasX;

   function CanvasY
     (CanvasWidget: in Tk_Canvas; ScreenY: in String;
      GridSpacing: in String := "") return String is
   begin
      Execute_Widget_Command
        (CanvasWidget, "canvasx", ScreenY & " " & GridSpacing);
      return Tcl.Ada.Tcl_GetResult(CanvasWidget.Interp);
   end CanvasY;

   procedure Coords
     (CanvasWidget: in Tk_Canvas; TagOrId, Coordinates: in String) is
   begin
      Execute_Widget_Command
        (CanvasWidget, "coords", TagOrId & " " & Coordinates);
   end Coords;

   function Coords
     (CanvasWidget: in Tk_Canvas; TagOrId: in String) return String is
   begin
      Execute_Widget_Command(CanvasWidget, "coords", TagOrId);
      return Tcl.Ada.Tcl_GetResult(CanvasWidget.Interp);
   end Coords;

   procedure Canvas_Create
     (Parent: in Tk_Canvas; Child_Type: in String; Options: in String := "") is
   begin
      Execute_Widget_Command(Parent, "create", Child_Type & " " & Options);
   end Canvas_Create;

   procedure Dchars
     (CanvasWidget: in Tk_Canvas; TagOrId, First: in String;
      Last: in String := "") is
   begin
      Execute_Widget_Command
        (CanvasWidget, "dchars", TagOrId & " " & First & " " & Last);
   end Dchars;

end Tcl.Tk.Ada.Widgets.Canvas;

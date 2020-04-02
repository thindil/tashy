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

   procedure Delete(CanvasWidget: in Tk_Canvas; TagOrId: in String) is
   begin
      Execute_Widget_Command(CanvasWidget, "delete", TagOrId);
   end Delete;

   procedure DTag
     (CanvasWidget: in Tk_Canvas; TagOrId: in String;
      TagToDelete: in String := "") is
   begin
      Execute_Widget_Command
        (CanvasWidget, "dtag", TagOrId & " " & TagToDelete);
   end DTag;

   function Find
     (CanvasWidget: in Tk_Canvas; SearchCommand: in String;
      Arguments: in String := "") return String is
   begin
      Execute_Widget_Command
        (CanvasWidget, "find", SearchCommand & " " & Arguments);
      return Tcl.Ada.Tcl_GetResult(CanvasWidget.Interp);
   end Find;

   procedure Focus(CanvasWidget: in Tk_Canvas; TagOrId: in String := "") is
   begin
      Execute_Widget_Command(CanvasWidget, "focus", TagOrId);
   end Focus;

   function Get_Tags
     (CanvasWidget: in Tk_Canvas; TagOrId: in String) return String is
   begin
      Execute_Widget_Command(CanvasWidget, "gettags", TagOrId);
      return Tcl.Ada.Tcl_GetResult(CanvasWidget.Interp);
   end Get_Tags;

   procedure ICursor(CanvasWidget: in Tk_Canvas; TagOrId, Index: in String) is
   begin
      Execute_Widget_Command(CanvasWidget, "icursor", TagOrId & " " & Index);
   end ICursor;

   procedure IMove
     (CanvasWidget: in Tk_Canvas; TagOrId, Index, X, Y: in String) is
   begin
      Execute_Widget_Command
        (CanvasWidget, "icursor", TagOrId & " " & Index & " " & X & " " & Y);
   end IMove;

   function Index
     (CanvasWidget: in Tk_Canvas; TagOrId, Index: in String) return String is
   begin
      Execute_Widget_Command(CanvasWidget, "index", TagOrId & " " & Index);
      return Tcl.Ada.Tcl_GetResult(CanvasWidget.Interp);
   end Index;

   procedure Insert
     (CanvasWidget: in Tk_Canvas; TagOrId, BeforeThis, Item: in String) is
   begin
      Execute_Widget_Command
        (CanvasWidget, "insert", TagOrId & " " & BeforeThis & " " & Item);
   end Insert;

   function Item_Cget
     (CanvasWidget: in Tk_Canvas; TagOrId, Option: in String) return String is
   begin
      Execute_Widget_Command(CanvasWidget, "itemcget", TagOrId & " " & Option);
      return Tcl.Ada.Tcl_GetResult(CanvasWidget.Interp);
   end Item_Cget;

   procedure Item_Configure
     (CanvasWidget: in Tk_Canvas; TagOrId, Options: in String) is
   begin
      Execute_Widget_Command
        (CanvasWidget, "itemconfigure", TagOrId & " " & Options);
   end Item_Configure;

   function Item_Configure
     (CanvasWidget: in Tk_Canvas; TagOrId: in String; Options: in String := "")
      return String is
   begin
      Execute_Widget_Command
        (CanvasWidget, "itemconfigure", TagOrId & " " & Options);
      return Tcl.Ada.Tcl_GetResult(CanvasWidget.Interp);
   end Item_Configure;

   procedure Lower
     (CanvasWidget: in Tk_Canvas; TagOrId: in String;
      BelowThis: in String := "") is
   begin
      Execute_Widget_Command(CanvasWidget, "lower", TagOrId & " " & BelowThis);
   end Lower;

   procedure Move
     (CanvasWidget: in Tk_Canvas; TagOrId, XAmount, YAmount: in String) is
   begin
      Execute_Widget_Command
        (CanvasWidget, "move", TagOrId & " " & XAmount & " " & YAmount);
   end Move;

   procedure MoveTo
     (CanvasWidget: in Tk_Canvas; TagOrId, XPos, YPos: in String) is
   begin
      Execute_Widget_Command
        (CanvasWidget, "moveto", TagOrId & " " & XPos & " " & YPos);
   end MoveTo;

   function Postscript
     (CanvasWidget: in Tk_Canvas; Options: in String) return String is
   begin
      Execute_Widget_Command(CanvasWidget, "postscript", Options);
      return Tcl.Ada.Tcl_GetResult(CanvasWidget.Interp);
   end Postscript;

   procedure Canvas_Raise
     (CanvasWidget: in Tk_Canvas; TagOrId: in String;
      AboveThis: in String := "") is
   begin
      Execute_Widget_Command(CanvasWidget, "raise", TagOrId & " " & AboveThis);
   end Canvas_Raise;

   procedure Rchars
     (CanvasWidget: in Tk_Canvas; TagOrId, First, Last, Text: in String) is
   begin
      Execute_Widget_Command
        (CanvasWidget, "rchars",
         TagOrId & " " & First & " " & Last & " " & Text);
   end Rchars;

   procedure Scale
     (CanvasWidget: in Tk_Canvas;
      TagOrId, XOrgin, YOrgin, XScale, YScale: in String) is
   begin
      Execute_Widget_Command
        (CanvasWidget, "scale",
         TagOrId & " " & XOrgin & " " & YOrgin & " " & XScale & " " & YScale);
   end Scale;

   procedure Select_Adjust
     (CanvasWidget: in Tk_Canvas; TagOrId, Index: in String) is
   begin
      Execute_Widget_Command
        (CanvasWidget, "select adjust", TagOrId & " " & Index);
   end Select_Adjust;

   procedure Select_Clear(CanvasWidget: in Tk_Canvas) is
   begin
      Execute_Widget_Command(CanvasWidget, "select clear");
   end Select_Clear;

   procedure Select_From
     (CanvasWidget: in Tk_Canvas; TagOrId, Index: in String) is
   begin
      Execute_Widget_Command
        (CanvasWidget, "select from", TagOrId & " " & Index);
   end Select_From;

   function Select_Item(CanvasWidget: in Tk_Canvas) return String is
   begin
      Execute_Widget_Command(CanvasWidget, "select item");
      return Tcl.Ada.Tcl_GetResult(CanvasWidget.Interp);
   end Select_Item;

   procedure Select_To
     (CanvasWidget: in Tk_Canvas; TagOrId, Index: in String) is
   begin
      Execute_Widget_Command(CanvasWidget, "select to", TagOrId & " " & Index);
   end Select_To;

   function Canvas_Type
     (CanvasWidget: in Tk_Canvas; TagOrId: in String) return String is
   begin
      Execute_Widget_Command(CanvasWidget, "type", TagOrId);
      return Tcl.Ada.Tcl_GetResult(CanvasWidget.Interp);
   end Canvas_Type;

   function XView(CanvasWidget: in Tk_Canvas) return String is
   begin
      Execute_Widget_Command(CanvasWidget, "xview");
      return Tcl.Ada.Tcl_GetResult(CanvasWidget.Interp);
   end XView;

   procedure Xview_Move_To(CanvasWidget: in Tk_Canvas; Fraction: in String) is
   begin
      Execute_Widget_Command(CanvasWidget, "xview moveto", Fraction);
   end Xview_Move_To;

   procedure Xview_Scroll
     (CanvasWidget: in Tk_Canvas; Number, What: in String) is
   begin
      Execute_Widget_Command
        (CanvasWidget, "xview scroll", Number & " " & What);
   end Xview_Scroll;

   function YView(CanvasWidget: in Tk_Canvas) return String is
   begin
      Execute_Widget_Command(CanvasWidget, "yview");
      return Tcl.Ada.Tcl_GetResult(CanvasWidget.Interp);
   end YView;

end Tcl.Tk.Ada.Widgets.Canvas;

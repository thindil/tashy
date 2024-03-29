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

package body Tcl.Tk.Ada.Widgets.ListBox is

   function Create
     (pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := Null_Interp) return Tk_ListBox is
      The_Widget: Tk_ListBox;
   begin
      if Interp = Null_Interp then
         The_Widget.Interp := Context;
      else
         The_Widget.Interp := Interp;
      end if;
      The_Widget.Name := C.Strings.New_String(pathName);
      Tcl_Eval(The_Widget.Interp, "listbox " & pathName & " " & options);
      return The_Widget;
   end Create;

   procedure Create
     (Widgt: out Tk_ListBox; pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := Null_Interp) is
   begin
      Widgt := Create(pathName, options, Interp);
   end Create;

   overriding function Get_Widget
     (pathName: in String; Interp: in Tcl_Interp := Get_Context)
      return Tk_ListBox is
   begin
      return New_ListBox: Tk_ListBox do
         New_ListBox.Interp := Interp;
         New_ListBox.Name := C.Strings.New_String(pathName);
      end return;
   end Get_Widget;

   procedure Activate(ListboxWidget: in Tk_ListBox; Index: in String) is
   begin
      Execute_Widget_Command(ListboxWidget, "activate", Index);
   end Activate;

   function BBox
     (ListboxWidget: in Tk_ListBox; Index: in String) return String is
   begin
      Execute_Widget_Command(ListboxWidget, "bbox", Index);
      return Tcl.Ada.Tcl_GetResult(ListboxWidget.Interp);
   end BBox;

   function CurSelection(ListboxWidget: in Tk_ListBox) return String is
   begin
      Execute_Widget_Command(ListboxWidget, "curselection");
      return Tcl.Ada.Tcl_GetResult(ListboxWidget.Interp);
   end CurSelection;

   procedure Delete
     (ListboxWidget: in Tk_ListBox; First: in String; Last: in String := "") is
   begin
      Execute_Widget_Command(ListboxWidget, "delete", First & " " & Last);
   end Delete;

   function Get
     (ListboxWidget: in Tk_ListBox; First: in String; Last: in String := "")
      return String is
   begin
      Execute_Widget_Command(ListboxWidget, "get", First & " " & Last);
      return Tcl.Ada.Tcl_GetResult(ListboxWidget.Interp);
   end Get;

   function Index
     (ListboxWidget: in Tk_ListBox; Index: in String) return String is
   begin
      Execute_Widget_Command(ListboxWidget, "index", Index);
      return Tcl.Ada.Tcl_GetResult(ListboxWidget.Interp);
   end Index;

   procedure Insert
     (ListboxWidget: in Tk_ListBox; Index: in String;
      Elements: in String := "") is
   begin
      Execute_Widget_Command(ListboxWidget, "insert", Index & " " & Elements);
   end Insert;

   function Item_Cget
     (ListboxWidget: in Tk_ListBox; Index, Option: in String) return String is
   begin
      Execute_Widget_Command(ListboxWidget, "itemcget", Index & " " & Option);
      return Tcl.Ada.Tcl_GetResult(ListboxWidget.Interp);
   end Item_Cget;

   procedure Item_Configure
     (ListBoxWidget: in Tk_ListBox; Index, Options: in String) is
   begin
      Execute_Widget_Command
        (ListBoxWidget, "itemconfigure", Index & " " & Options);
   end Item_Configure;

   function Item_Configure
     (ListBoxWidget: in Tk_ListBox; Index: in String; Options: in String := "")
      return String is
   begin
      Execute_Widget_Command
        (ListBoxWidget, "itemconfigure", Index & " " & Options);
      return Tcl.Ada.Tcl_GetResult(ListBoxWidget.Interp);
   end Item_Configure;

   function Nearest
     (ListboxWidget: in Tk_ListBox; Y: in String) return String is
   begin
      Execute_Widget_Command(ListboxWidget, "nearest", Y);
      return Tcl.Ada.Tcl_GetResult(ListboxWidget.Interp);
   end Nearest;

   procedure Scan_Mark(ListboxWidget: in Tk_ListBox; X, Y: in String) is
   begin
      Execute_Widget_Command(ListboxWidget, "scan mark", X & " " & Y);
   end Scan_Mark;

   procedure Scan_DragTo(ListboxWidget: in Tk_ListBox; X, Y: in String) is
   begin
      Execute_Widget_Command(ListboxWidget, "scan dragto", X & " " & Y);
   end Scan_DragTo;

   procedure See(ListboxWidget: in Tk_ListBox; Index: in String) is
   begin
      Execute_Widget_Command(ListboxWidget, "see", Index);
   end See;

   procedure Selection_Anchor
     (ListboxWidget: in Tk_ListBox; Index: in String) is
   begin
      Execute_Widget_Command(ListboxWidget, "selection anchor", Index);
   end Selection_Anchor;

   procedure Selection_Clear
     (ListboxWidget: in Tk_ListBox; First: in String; Last: in String := "") is
   begin
      Execute_Widget_Command
        (ListboxWidget, "selection clear", First & " " & Last);
   end Selection_Clear;

   function Selection_Includes
     (ListboxWidget: in Tk_ListBox; Index: in String) return String is
   begin
      Execute_Widget_Command(ListboxWidget, "selection includes", Index);
      return Tcl.Ada.Tcl_GetResult(ListboxWidget.Interp);
   end Selection_Includes;

   procedure Selection_Set
     (ListboxWidget: in Tk_ListBox; First: in String; Last: in String := "") is
   begin
      Execute_Widget_Command
        (ListboxWidget, "selection set", First & " " & Last);
   end Selection_Set;

   function Size(ListboxWidget: in Tk_ListBox) return String is
   begin
      Execute_Widget_Command(ListboxWidget, "size");
      return Tcl.Ada.Tcl_GetResult(ListboxWidget.Interp);
   end Size;

   function XView(ListboxWidget: in Tk_ListBox) return String is
   begin
      Execute_Widget_Command(ListboxWidget, "xview");
      return Tcl.Ada.Tcl_GetResult(ListboxWidget.Interp);
   end XView;

   procedure XView(ListboxWidget: in Tk_ListBox; Index: in String) is
   begin
      Execute_Widget_Command(ListboxWidget, "xview", Index);
   end XView;

   procedure Xview_Move_To
     (ListboxWidget: in Tk_ListBox; Fraction: in String) is
   begin
      Execute_Widget_Command(ListboxWidget, "xview moveto", Fraction);
   end Xview_Move_To;

   procedure Xview_Scroll
     (ListboxWidget: in Tk_ListBox; Number, What: in String) is
   begin
      Execute_Widget_Command
        (ListboxWidget, "xview scroll", Number & " " & What);
   end Xview_Scroll;

   function YView(ListboxWidget: in Tk_ListBox) return String is
   begin
      Execute_Widget_Command(ListboxWidget, "yview");
      return Tcl.Ada.Tcl_GetResult(ListboxWidget.Interp);
   end YView;

   procedure YView(ListboxWidget: in Tk_ListBox; Index: in String) is
   begin
      Execute_Widget_Command(ListboxWidget, "yview", Index);
   end YView;

   procedure Yview_Move_To
     (ListboxWidget: in Tk_ListBox; Fraction: in String) is
   begin
      Execute_Widget_Command(ListboxWidget, "yview moveto", Fraction);
   end Yview_Move_To;

   procedure Yview_Scroll
     (ListboxWidget: in Tk_ListBox; Number, What: in String) is
   begin
      Execute_Widget_Command
        (ListboxWidget, "yview scroll", Number & " " & What);
   end Yview_Scroll;

end Tcl.Tk.Ada.Widgets.ListBox;

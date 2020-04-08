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
      Interp: in Tcl_Interp := null) return Tk_ListBox is
      The_Widget: Tk_ListBox;
   begin
      if Interp = null then
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
      Interp: in Tcl_Interp := null) is
   begin
      Widgt := Create(pathName, options, Interp);
   end Create;

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

end Tcl.Tk.Ada.Widgets.ListBox;

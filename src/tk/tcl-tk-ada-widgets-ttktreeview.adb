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

package body Tcl.Tk.Ada.Widgets.TtkTreeView is

   function Create
     (pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) return Ttk_Tree_View is
      The_Widget: Ttk_Tree_View;
   begin
      if Interp = null then
         The_Widget.Interp := Context;
      else
         The_Widget.Interp := Interp;
      end if;
      The_Widget.Name := C.Strings.New_String(pathName);
      Tcl_Eval(The_Widget.Interp, "ttk::treeview " & pathName & " " & options);
      return The_Widget;
   end Create;

   procedure Create
     (Widgt: out Ttk_Tree_View; pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) is
   begin
      Widgt := Create(pathName, options, Interp);
   end Create;

   procedure Heading
     (TreeViewWidget: in Ttk_Tree_View; Column, Options: in String) is
   begin
      Execute_Widget_Command
        (TreeViewWidget, "heading", Column & " " & Options);
   end Heading;

   function Heading
     (TreeViewWidget: in Ttk_Tree_View; Column: in String;
      Option: in String := "") return String is
   begin
      Execute_Widget_Command(TreeViewWidget, "heading", Column & " " & Option);
      return Tcl.Ada.Tcl_GetResult(TreeViewWidget.Interp);
   end Heading;

   procedure Insert(TreeViewWidget: in Ttk_Tree_View; Options: in String) is
   begin
      Execute_Widget_Command(TreeViewWidget, "insert", Options);
   end Insert;

   procedure Delete(TreeViewWidget: in Ttk_Tree_View; ItemsList: in String) is
   begin
      Execute_Widget_Command(TreeViewWidget, "delete", ItemsList);
   end Delete;

   procedure Item
     (TreeViewWidget: in Ttk_Tree_View; Item, Options: in String) is
   begin
      Execute_Widget_Command(TreeViewWidget, "item", Item & " " & Options);
   end Item;

   function Item
     (TreeViewWidget: in Ttk_Tree_View; Item: in String;
      Options: in String := "") return String is
   begin
      Execute_Widget_Command(TreeViewWidget, "item", Item & " " & Options);
      return Tcl.Ada.Tcl_GetResult(TreeViewWidget.Interp);
   end Item;

   function Selection(TreeViewWidget: in Ttk_Tree_View) return String is
   begin
      Execute_Widget_Command(TreeViewWidget, "selection");
      return Tcl.Ada.Tcl_GetResult(TreeViewWidget.Interp);
   end Selection;

   procedure Selection_Set
     (TreeViewWidget: in Ttk_Tree_View; Items: in String) is
   begin
      Execute_Widget_Command(TreeViewWidget, "selection set", Items);
   end Selection_Set;

   procedure Selection_Add
     (TreeViewWidget: in Ttk_Tree_View; Items: in String) is
   begin
      Execute_Widget_Command(TreeViewWidget, "selection add", Items);
   end Selection_Add;

   procedure Selection_Remove
     (TreeViewWidget: in Ttk_Tree_View; Items: in String) is
   begin
      Execute_Widget_Command(TreeViewWidget, "selection remove", Items);
   end Selection_Remove;

   procedure Selection_Toggle
     (TreeViewWidget: in Ttk_Tree_View; Items: in String) is
   begin
      Execute_Widget_Command(TreeViewWidget, "selection toggle", Items);
   end Selection_Toggle;

   function Children
     (TreeViewWidget: in Ttk_Tree_View; Item: in String) return String is
   begin
      Execute_Widget_Command(TreeViewWidget, "children", Item);
      return Tcl.Ada.Tcl_GetResult(TreeViewWidget.Interp);
   end Children;

   function Exists
     (TreeViewWidget: in Ttk_Tree_View; Item: in String) return String is
   begin
      Execute_Widget_Command(TreeViewWidget, "exists", Item);
      return Tcl.Ada.Tcl_GetResult(TreeViewWidget.Interp);
   end Exists;

   procedure Move
     (TreeViewWidget: in Ttk_Tree_View; Item, Parent, Index: in String) is
   begin
      Execute_Widget_Command
        (TreeViewWidget, "move", Item & " " & Parent & " " & Index);
   end Move;

   function Index
     (TreeViewWidget: in Ttk_Tree_View; Item: in String) return String is
   begin
      Execute_Widget_Command(TreeViewWidget, "index", Item);
      return Tcl.Ada.Tcl_GetResult(TreeViewWidget.Interp);
   end Index;

   procedure Column
     (TreeViewWidget: in Ttk_Tree_View; Col: in String; Options: in String) is
   begin
      Execute_Widget_Command(TreeViewWidget, "column", Col & " " & Options);
   end Column;

   function Column
     (TreeViewWidget: in Ttk_Tree_View; Col: in String;
      Option: in String := "") return String is
   begin
      Execute_Widget_Command(TreeViewWidget, "column", Col & " " & Option);
      return Tcl.Ada.Tcl_GetResult(TreeViewWidget.Interp);
   end Column;

end Tcl.Tk.Ada.Widgets.TtkTreeView;

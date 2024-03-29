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
      Interp: in Tcl_Interp := Null_Interp) return Ttk_Tree_View is
      The_Widget: Ttk_Tree_View;
   begin
      if Interp = Null_Interp then
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
      Interp: in Tcl_Interp := Null_Interp) is
   begin
      Widgt := Create(pathName, options, Interp);
   end Create;

   overriding function Get_Widget
     (pathName: in String; Interp: in Tcl_Interp := Get_Context)
      return Ttk_Tree_View is
   begin
      return New_TreeView: Ttk_Tree_View do
         New_TreeView.Interp := Interp;
         New_TreeView.Name := C.Strings.New_String(pathName);
      end return;
   end Get_Widget;

   function Children
     (TreeViewWidget: in Ttk_Tree_View; Item: in String) return String is
   begin
      Execute_Widget_Command(TreeViewWidget, "children", Item);
      return Tcl.Ada.Tcl_GetResult(TreeViewWidget.Interp);
   end Children;

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

   procedure Delete(TreeViewWidget: in Ttk_Tree_View; ItemsList: in String) is
   begin
      Execute_Widget_Command(TreeViewWidget, "delete", ItemsList);
   end Delete;

   procedure Detach(TreeViewWidget: in Ttk_Tree_View; ItemsList: in String) is
   begin
      Execute_Widget_Command(TreeViewWidget, "detach", ItemsList);
   end Detach;

   function Exists
     (TreeViewWidget: in Ttk_Tree_View; Item: in String) return String is
   begin
      Execute_Widget_Command(TreeViewWidget, "exists", Item);
      return Tcl.Ada.Tcl_GetResult(TreeViewWidget.Interp);
   end Exists;

   procedure Focus(TreeViewWidget: in Ttk_Tree_View; Item: in String) is
   begin
      Execute_Widget_Command(TreeViewWidget, "focus", Item);
   end Focus;

   function Focus(TreeViewWidget: in Ttk_Tree_View) return String is
   begin
      Execute_Widget_Command(TreeViewWidget, "focus");
      return Tcl.Ada.Tcl_GetResult(TreeViewWidget.Interp);
   end Focus;

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

   function Identify_Column
     (TreeViewWidget: in Ttk_Tree_View; X, Y: in String) return String is
   begin
      Execute_Widget_Command(TreeViewWidget, "identify column", X & " " & Y);
      return Tcl.Ada.Tcl_GetResult(TreeViewWidget.Interp);
   end Identify_Column;

   function Identify_Element
     (TreeViewWidget: in Ttk_Tree_View; X, Y: in String) return String is
   begin
      Execute_Widget_Command(TreeViewWidget, "identify element", X & " " & Y);
      return Tcl.Ada.Tcl_GetResult(TreeViewWidget.Interp);
   end Identify_Element;

   function Identify_Item
     (TreeViewWidget: in Ttk_Tree_View; X, Y: in String) return String is
   begin
      Execute_Widget_Command(TreeViewWidget, "identify item", X & " " & Y);
      return Tcl.Ada.Tcl_GetResult(TreeViewWidget.Interp);
   end Identify_Item;

   function Identify_Region
     (TreeViewWidget: in Ttk_Tree_View; X, Y: in String) return String is
   begin
      Execute_Widget_Command(TreeViewWidget, "identify region", X & " " & Y);
      return Tcl.Ada.Tcl_GetResult(TreeViewWidget.Interp);
   end Identify_Region;

   function Index
     (TreeViewWidget: in Ttk_Tree_View; Item: in String) return String is
   begin
      Execute_Widget_Command(TreeViewWidget, "index", Item);
      return Tcl.Ada.Tcl_GetResult(TreeViewWidget.Interp);
   end Index;

   procedure Insert(TreeViewWidget: in Ttk_Tree_View; Options: in String) is
   begin
      Execute_Widget_Command(TreeViewWidget, "insert", Options);
   end Insert;

   function Insert
     (TreeViewWidget: in Ttk_Tree_View; Options: in String) return String is
   begin
      Execute_Widget_Command(TreeViewWidget, "insert", Options);
      return Tcl.Ada.Tcl_GetResult(TreeViewWidget.Interp);
   end Insert;

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

   procedure Move
     (TreeViewWidget: in Ttk_Tree_View; Item, Parent, Index: in String) is
   begin
      Execute_Widget_Command
        (TreeViewWidget, "move", Item & " " & Parent & " " & Index);
   end Move;

   function Next
     (TreeViewWidget: in Ttk_Tree_View; Item: String) return String is
   begin
      Execute_Widget_Command(TreeViewWidget, "next", Item);
      return Tcl.Ada.Tcl_GetResult(TreeViewWidget.Interp);
   end Next;

   function Parent
     (TreeViewWidget: in Ttk_Tree_View; Item: in String) return String is
   begin
      Execute_Widget_Command(TreeViewWidget, "parent", Item);
      return Tcl.Ada.Tcl_GetResult(TreeViewWidget.Interp);
   end Parent;

   function Prev
     (TreeViewWidget: in Ttk_Tree_View; Item: String) return String is
   begin
      Execute_Widget_Command(TreeViewWidget, "prev", Item);
      return Tcl.Ada.Tcl_GetResult(TreeViewWidget.Interp);
   end Prev;

   procedure See(TreeViewWidget: in Ttk_Tree_View; Item: in String) is
   begin
      Execute_Widget_Command(TreeViewWidget, "see", Item);
   end See;

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

   function Set
     (TreeViewWidget: in Ttk_Tree_View; Item: in String;
      Column: in String := "") return String is
   begin
      Execute_Widget_Command(TreeViewWidget, "set", Item & " " & Column);
      return Tcl.Ada.Tcl_GetResult(TreeViewWidget.Interp);
   end Set;

   procedure Set
     (TreeViewWidget: in Ttk_Tree_View; Item, Column, Value: in String) is
   begin
      Execute_Widget_Command
        (TreeViewWidget, "set", Item & " " & Column & " " & Value);
   end Set;

   procedure Tag_Add
     (TreeViewWidget: in Ttk_Tree_View; Tag, Items: in String) is
   begin
      Execute_Widget_Command(TreeViewWidget, "tag add", Tag & " " & Items);
   end Tag_Add;

   procedure Tag_Bind
     (TreeViewWidget: in Ttk_Tree_View;
      TagName, Sequence, Script: in String) is
   begin
      Execute_Widget_Command
        (TreeViewWidget, "tag bind", TagName & " " & Sequence & " " & Script);
   end Tag_Bind;

   function Tag_Bind
     (TreeViewWidget: in Ttk_Tree_View; TagName: in String;
      Sequence: in String := "") return String is
   begin
      Execute_Widget_Command
        (TreeViewWidget, "tag bind", TagName & " " & Sequence);
      return Tcl.Ada.Tcl_GetResult(TreeViewWidget.Interp);
   end Tag_Bind;

   procedure Tag_Configure
     (TreeViewWidget: in Ttk_Tree_View; TagName, Options: in String) is
   begin
      Execute_Widget_Command
        (TreeViewWidget, "tag configure", TagName & " " & Options);
   end Tag_Configure;

   function Tag_Configure
     (TreeViewWidget: in Ttk_Tree_View; TagName: in String;
      Option: in String := "") return String is
   begin
      Execute_Widget_Command
        (TreeViewWidget, "tag configure", TagName & " " & Option);
      return Tcl.Ada.Tcl_GetResult(TreeViewWidget.Interp);
   end Tag_Configure;

   function Tag_Has
     (TreeViewWidget: in Ttk_Tree_View; TagName: in String;
      Item: in String := "") return String is
   begin
      Execute_Widget_Command(TreeViewWidget, "tag has", TagName & " " & Item);
      return Tcl.Ada.Tcl_GetResult(TreeViewWidget.Interp);
   end Tag_Has;

   function Tag_Names(TreeViewWidget: in Ttk_Tree_View) return String is
   begin
      Execute_Widget_Command(TreeViewWidget, "tag names");
      return Tcl.Ada.Tcl_GetResult(TreeViewWidget.Interp);
   end Tag_Names;

   procedure Tag_Remove
     (TreeViewWidget: in Ttk_Tree_View; Tag: in String;
      Items: in String := "") is
   begin
      Execute_Widget_Command(TreeViewWidget, "tag remove", Tag & " " & Items);
   end Tag_Remove;

   function XView(TreeViewWidget: in Ttk_Tree_View) return String is
   begin
      Execute_Widget_Command(TreeViewWidget, "xview");
      return Tcl.Ada.Tcl_GetResult(TreeViewWidget.Interp);
   end XView;

   procedure Xview_Move_To
     (TreeViewWidget: in Ttk_Tree_View; Fraction: in String) is
   begin
      Execute_Widget_Command(TreeViewWidget, "xview moveto", Fraction);
   end Xview_Move_To;

   procedure Xview_Scroll
     (TreeViewWidget: in Ttk_Tree_View; Number, What: in String) is
   begin
      Execute_Widget_Command
        (TreeViewWidget, "xview scroll", Number & " " & What);
   end Xview_Scroll;

   function YView(TreeViewWidget: in Ttk_Tree_View) return String is
   begin
      Execute_Widget_Command(TreeViewWidget, "yview");
      return Tcl.Ada.Tcl_GetResult(TreeViewWidget.Interp);
   end YView;

   procedure Yview_Move_To
     (TreeViewWidget: in Ttk_Tree_View; Fraction: in String) is
   begin
      Execute_Widget_Command(TreeViewWidget, "yview moveto", Fraction);
   end Yview_Move_To;

   procedure Yview_Scroll
     (TreeViewWidget: in Ttk_Tree_View; Number, What: in String) is
   begin
      Execute_Widget_Command
        (TreeViewWidget, "yview scroll", Number & " " & What);
   end Yview_Scroll;

end Tcl.Tk.Ada.Widgets.TtkTreeView;

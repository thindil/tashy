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

-- ****h* Widgets/TtkTreeView
-- FUNCTION
-- Provides code for Tk Ttk::Tree_View
-- SOURCE
package Tcl.Tk.Ada.Widgets.TtkTreeView is
-- ****

   -- ****t* TtkTreeView/Ttk_Tree_View
   -- FUNCTION
   -- This is a non-abstract type derived directly from Tk_Widget.
   -- Each of the derived widgets redefines the Create subprogram
   -- in order to create the correct type of widget.
   -- SOURCE
   type Ttk_Tree_View is new Tk_Widget with private;
   -- ****

   -- ****f* TtkTreeView/Create
   -- FUNCTION
   -- Creates a new Ttk_Tree_View in the specified interpreter.
   -- PARAMETERS
   -- Widgt    - Ttk_Tree_View which will be created
   -- pathName - Tk path (starts with dot) for the widget
   -- options  - Options which will be passed to the widget. Default value is
   --            empty
   -- Interp   - Tcl interpreter to which the widget will be created. If null,
   --            the widget will be created in the "contextual" interpreter.
   --            Default value is null.
   -- RESULT
   -- Newly created Ttk_Tree_View
   -- SOURCE
   function Create
     (pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) return Ttk_Tree_View;
   procedure Create
     (Widgt: out Ttk_Tree_View; pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null);
   -- ****

   -- ****f* TtkTreeView/Heading
   -- FUNCTION
   -- Configure selected column header
   -- PARAMETERS
   -- TreeViewWidget - Ttk_Tree_View in which header will be configured
   -- Column         - Id of column which header will be configured
   -- Options        - Tk options for selected header
   -- SOURCE
   procedure Heading
     (TreeViewWidget: in Ttk_Tree_View; Column, Options: in String);
   -- ****

   -- ****f* TtkTreeView/Heading2
   -- FUNCTION
   -- Get configuration of selected column header
   -- PARAMETERS
   -- TreeViewWidget - Ttk_Tree_View in which header will be queried
   -- Column         - Id of column which header will be queried
   -- RESULT
   -- Configuration options of selected header
   -- SOURCE
   function Heading
     (TreeViewWidget: in Ttk_Tree_View; Column: in String) return String;
   -- ****

   -- ****f* TtkTreeView/Insert
   -- FUNCTION
   -- Insert new item to tree view
   -- PARAMETERS
   -- TreeViewWidget - Ttk_Tree_View in which item will be inserted
   -- Options        - Tk options for the item which will be inserted
   -- SOURCE
   procedure Insert(TreeViewWidget: in Ttk_Tree_View; Options: in String);
   -- ****

   -- ****f* TtkTreeView/Delete
   -- FUNCTION
   -- Delete selected items from the tree view
   -- PARAMETERS
   -- TreeViewWidget - Ttk_Tree_View in which items will be deleted
   -- ItemsList      - List of items to delete
   -- SOURCE
   procedure Delete(TreeViewWidget: in Ttk_Tree_View; ItemsList: in String);
   -- ****

   -- ****f* Tcl.Tk.Ada.Widgets.TtkTreeView/Item
   -- FUNCTION
   -- Modify options of selected item in tree view
   -- PARAMETERS
   -- TreeViewWidget - Ttk_Tree_View in which item options will be modified
   -- Item           - Id of the item to modify
   -- Options        - Tk options to set for the selected item
   -- SOURCE
   procedure Item(TreeViewWidget: in Ttk_Tree_View; Item, Options: in String);
   -- ****

   -- ****f* Tcl.Tk.Ada.Widgets.TtkTreeView/Item2
   -- FUNCTION
   -- Get options of the selected item in tree view
   -- PARAMETERS
   -- TreeViewWidget - Ttk_Tree_View in which item options will be queried
   -- Item           - Id of the item to querry
   -- Options        - Tk options to get from the selected item. If empty, get
   --                  all options. Default is empty.
   -- SOURCE
   function Item
     (TreeViewWidget: in Ttk_Tree_View; Item: in String;
      Options: in String := "") return String;
   -- ****

private

   type Ttk_Tree_View is new Tk_Widget with null record;

end Tcl.Tk.Ada.Widgets.TtkTreeView;

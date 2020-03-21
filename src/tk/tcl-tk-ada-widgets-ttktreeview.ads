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
   overriding function Create
     (pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) return Ttk_Tree_View with
      Pre => pathName /= "";
   overriding procedure Create
     (Widgt: out Ttk_Tree_View; pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) with
      Pre => pathName /= "";
      -- ****

      -- ****f* TtkTreeView/Children
      -- FUNCTION
      -- Get children of the selected item in the selected Ttk_Tree_View
      -- PARAMETERS
      -- TreeViewWidget - Ttk_Tree_View in which items will be queried
      -- Item           - Item ID from TreeViewWidget or {} for root item
      -- RESULT
      -- String with list of items which belong to the selected item
      -- SOURCE
   function Children
     (TreeViewWidget: in Ttk_Tree_View; Item: in String) return String with
      Pre => Item /= "";
      -- ****

      -- ****f* TtkTreeView/Column
      -- FUNCTION
      -- Modify options of the selected column in the selected Ttk_Tree_View
      -- PARAMETERS
      -- TreeViewWidget - Ttk_Tree_View in which column will be modified
      -- Col            - Identificator of the column to modify
      -- Options        - Tk options to pass to the column
      -- SOURCE
   procedure Column
     (TreeViewWidget: in Ttk_Tree_View; Col: in String;
      Options: in String) with
      Pre => Col /= "" and Options /= "";
      -- ****

      -- ****f* TtkTreeView/Column2
      -- FUNCTION
      -- Get value or values of options of the selected column in the selected
      -- Ttk_Tree_View
      -- PARAMETERS
      -- TreeViewWidget - Ttk_Tree_View which will be queried for options
      -- Col            - Identifier of the column from which options will be
      --                  taken
      -- Option         - Option value to take. If empty, return all options
      --                  and their values. Default is empty
      -- RESULT
      -- If Option is set, return value of the selected option for the
      -- selected column. Otherwise return all options with their values for
      -- the selected column.
      -- SOURCE
   function Column
     (TreeViewWidget: in Ttk_Tree_View; Col: in String;
      Option: in String := "") return String with
      Pre => Col /= "";
      -- ****

      -- ****f* TtkTreeView/Delete
      -- FUNCTION
      -- Delete selected items from the tree view
      -- PARAMETERS
      -- TreeViewWidget - Ttk_Tree_View in which items will be deleted
      -- ItemsList      - List of items to delete
      -- SOURCE
   procedure Delete
     (TreeViewWidget: in Ttk_Tree_View; ItemsList: in String) with
      Pre => ItemsList /= "";
      -- ****

      -- ****f* TtkTreeView/Detach
      -- FUNCTION
      -- Unlink the selected items from the tree view. They are still present
      -- and can be reinserted with procedure Move
      -- PARAMETERS
      -- TreeViewWidget - Ttk_Tree_View in which items will be unlinked
      -- ItemsList      - List of items to unlink
      -- SOURCE
   procedure Detach
     (TreeViewWidget: in Ttk_Tree_View; ItemsList: in String) with
      Pre => ItemsList /= "";
      -- ****

      -- ****f* TtkTreeView/Exists
      -- FUNCTION
      -- Check if selected item is presented in the selected Ttk_Tree_View
      -- PARAMETERS
      -- TreeViewWidget - Ttk_Tree_View which will be checked
      -- Item           - Item identifier which will be looking for
      -- RESULT
      -- 0 if item don't exists in the selected TreeViewWidget, otherwise 1.
      -- SOURCE
   function Exists
     (TreeViewWidget: in Ttk_Tree_View; Item: in String) return String with
      Pre => Item /= "";
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
     (TreeViewWidget: in Ttk_Tree_View; Column, Options: in String) with
      Pre => Column /= "" and Options /= "";
      -- ****

      -- ****f* TtkTreeView/Heading2
      -- FUNCTION
      -- Get configuration of selected column header
      -- PARAMETERS
      -- TreeViewWidget - Ttk_Tree_View in which header will be queried
      -- Column         - Id of column which header will be queried
      -- Option         - Tk option to query. Default value is empty
      -- RESULT
      -- Configuration options of selected header. If option is specified,
      -- return selected option value
      -- SOURCE
   function Heading
     (TreeViewWidget: in Ttk_Tree_View; Column: in String;
      Option: in String := "") return String with
      Pre => Column /= "";
      -- ****

      -- ****f* TtkTreeView/Index
      -- FUNCTION
      -- Get index of selected item in the selected Ttk_Tree_View
      -- PARAMETERS
      -- TreeViewWidget - Ttk_Tree_View which will be queried for item
      -- Item           - Identifier of the selected item which will be
      --                  looking for
      -- RESULT
      -- Numeric index of the selected item in the selected Ttk_Tree_View
      -- SOURCE
   function Index
     (TreeViewWidget: in Ttk_Tree_View; Item: in String) return String with
      Pre => Item /= "";
      -- ****

      -- ****f* TtkTreeView/Insert
      -- FUNCTION
      -- Insert new item to tree view
      -- PARAMETERS
      -- TreeViewWidget - Ttk_Tree_View in which item will be inserted
      -- Options        - Tk options for the item which will be inserted
      -- RESULT
      -- Index of newly inserted item
      -- SOURCE
   procedure Insert(TreeViewWidget: in Ttk_Tree_View; Options: in String) with
      Pre => Options /= "";
   function Insert
     (TreeViewWidget: in Ttk_Tree_View; Options: in String) return String with
      Pre => Options /= "";
      -- ****

      -- ****f* TtkTreeView/Item
      -- FUNCTION
      -- Modify options of selected item in tree view
      -- PARAMETERS
      -- TreeViewWidget - Ttk_Tree_View in which item options will be modified
      -- Item           - Id of the item to modify
      -- Options        - Tk options to set for the selected item
      -- SOURCE
   procedure Item
     (TreeViewWidget: in Ttk_Tree_View; Item, Options: in String) with
      Pre => Item /= "" and Options /= "";
      -- ****

      -- ****f* TtkTreeView/Item2
      -- FUNCTION
   -- Get options of the selected item in tree view
   -- PARAMETERS
   -- TreeViewWidget - Ttk_Tree_View in which item options will be queried
   -- Item           - Id of the item to query
   -- Options        - Tk options to get from the selected item. If empty, get
      --                  all options. Default is empty.
      -- SOURCE
   function Item
     (TreeViewWidget: in Ttk_Tree_View; Item: in String;
      Options: in String := "") return String with
      Pre => Item /= "";
      -- ****

      -- ****f* TtkTreeView/Move
      -- FUNCTION
      -- Move selected item to selected parent and on selected index in the
      -- selected Ttk_Tree_View
      -- PARAMETERS
      -- TreeViewWidget - Ttk_Tree_View in which item will be moved
      -- Item           - Identifier of the item which will be moved
      -- Parent         - Parent to which item will be moved. Use {} for
      --                  root item
      -- Index          - Index to which the item will be moved
      -- SOURCE
   procedure Move
     (TreeViewWidget: in Ttk_Tree_View; Item, Parent, Index: in String) with
      Pre => Item /= "" and Parent /= "" and Index /= "";
      -- ****

      -- ****f* TtkTreeView/Next
      -- FUNCTION
      -- Get identifier of next sibling of the item in the selected
      -- Ttk_Tree_View
      -- PARAMETERS
      -- TreeViewWidget - Ttk_Tree_View which will be queried for item
      -- Item           - Identifier of the item which sibling will be looking
      --                  for
      -- RESULT
      -- Identifier of the next sibling of the selected item or empty string if
      -- Item is the last element of its parent
      -- SOURCE
   function Next
     (TreeViewWidget: in Ttk_Tree_View; Item: String) return String with
      Pre => Item /= "";
      -- ****

      -- ****f* TtkTreeView/Parent
      -- FUNCTION
      -- Get ID of the parent of item
      -- PARAMETERS
      -- TreeViewWidget - Ttk_Tree_View in which item will be queried
      -- Item           - Identifier of the item which will be queried for
      --                  parent
      -- RESULT
      -- ID of the parent of the selected Item or empty string if item is at
      -- the top of the hiearchy
      -- SOURCE
   function Parent
     (TreeViewWidget: in Ttk_Tree_View; Item: in String) return String with
      Pre => Item /= "";
      -- ****

      -- ****f* TtkTreeView/Prev
      -- FUNCTION
      -- Get identifier of previous sibling of the item in the selected
      -- Ttk_Tree_View
      -- PARAMETERS
      -- TreeViewWidget - Ttk_Tree_View which will be queried for item
      -- Item           - Identifier of the item which sibling will be looking
      --                  for
      -- RESULT
      -- Identifier of the previous sibling of the selected item or empty
      -- string if Item is the first element of its parent
      -- SOURCE
   function Prev
     (TreeViewWidget: in Ttk_Tree_View; Item: String) return String with
      Pre => Item /= "";
      -- ****

      -- ****f* TtkTreeView/Selection
      -- FUNCTION
      -- Get selected items from the selected Ttk_Tree_View
      -- PARAMETERS
      -- TreeViewWidget - Ttk_Tree_View from which selection will be taken
      -- RESULT
      -- List of items currently selected in TreeViewWidget
      -- SOURCE
   function Selection(TreeViewWidget: in Ttk_Tree_View) return String;
   -- ****

   -- ****f* TtkTreeView/Selection_Set
   -- FUNCTION
   -- Set new selection for the selected Ttk_Tree_View
   -- PARAMETERS
   -- TreeViewWidget - Ttk_Tree_View in which selection will be set
   -- Items          - Tcl list of items to set as selected
   -- SOURCE
   procedure Selection_Set
     (TreeViewWidget: in Ttk_Tree_View; Items: in String) with
      Pre => Items /= "";
      -- ****

   -- ****f* TtkTreeView/Selection_Add
   -- FUNCTION
   -- Add new items to the selection in the selected Ttk_Tree_View
   -- PARAMETERS
   -- TreeViewWidget - Ttk_Tree_View in which items will be added to selection
   -- Items          - Tcl list of items to add to the selection
   -- SOURCE
   procedure Selection_Add
     (TreeViewWidget: in Ttk_Tree_View; Items: in String) with
      Pre => Items /= "";
      -- ****

      -- ****f* TtkTreeView/Selection_Remove
      -- FUNCTION
      -- Remove selected items from the selection of the selected Ttk_Tree_View
      -- PARAMETERS
      -- TreeViewWidget - Ttk_Tree_View from which items will be removed
      -- Items          - Tcl list of items to remove from the selection
      -- SOURCE
   procedure Selection_Remove
     (TreeViewWidget: in Ttk_Tree_View; Items: in String) with
      Pre => Items /= "";
      -- ****

   -- ****f* TtkTreeView/Selection_Toggle
   -- FUNCTION
   -- Toggle selection state for selected items in the selected Ttk_Tree_View
   -- PARAMETERS
   -- TreeViewWidget - Ttk_Tree_View in which items will have toggled selection
      --                  state
      -- Items          - Tcl list of items to toggle
      -- SOURCE
   procedure Selection_Toggle
     (TreeViewWidget: in Ttk_Tree_View; Items: in String) with
      Pre => Items /= "";
      -- ****

private

   type Ttk_Tree_View is new Tk_Widget with null record;

end Tcl.Tk.Ada.Widgets.TtkTreeView;

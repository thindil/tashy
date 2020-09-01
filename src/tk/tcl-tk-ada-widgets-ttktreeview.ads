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

   -- ****f* TtkTreeView/Create (function)
   -- FUNCTION
   -- Creates a new Ttk_Tree_View in the specified interpreter.
   -- PARAMETERS
   -- pathName - Tk path (starts with dot) for the widget
   -- options  - Options which will be passed to the widget. Default value is
   --            empty
   -- Interp   - Tcl interpreter to which the widget will be created. If null,
   --            the widget will be created in the "contextual" interpreter.
   --            Default value is null.
   -- RESULT
   -- Newly created Ttk_Tree_View
   -- HISTORY
   -- 8.6.1 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- EXAMPLE
   -- -- Create a new treeview with pathname .myview and with columns name and amount
   -- My_View: constant Ttk_Tree_View := Create(".myview", "-columns [list name amount]");
   -- COMMANDS
   -- ttk::treeview pathName ?options?
   -- SEE ALSO
   -- Create (procedure)
   -- SOURCE
   overriding function Create
     (pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) return Ttk_Tree_View with
      Pre => pathName /= "";
     -- ****

     -- ****f* TtkTreeView/Create (procedure)
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
     -- HISTORY
     -- 8.6.1 - Added
     -- TODO
     -- Replace it with higher level of binding
     -- EXAMPLE
     -- -- Create treeview My_View with pathname .myview on the current Tcl interpreter and hide columns headings
     -- declare
     --    My_View: Ttk_Tree_View;
     -- begin
     --    Create(My_Viewm, ".myview", "-show tree");
     -- end;
     -- COMMANDS
     -- ttk::treeview pathName ?options?
     -- SEE ALSO
     -- Create (function)
     -- SOURCE
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
     -- HISTORY
     -- 8.6.2 - Added
     -- TODO
     -- Replace it with higher level of binding
     -- EXAMPLE
     -- -- Get the names of the children of the root item in My_View treeview
     -- Children_Names: constant String := Children(My_View, "{}");
     -- COMMANDS
     -- TreeViewWidget children item
     -- SOURCE
   function Children
     (TreeViewWidget: in Ttk_Tree_View; Item: in String) return String with
      Pre => Item /= "";
      -- ****

      -- ****f* TtkTreeView/Column (procedure)
      -- FUNCTION
      -- Modify options of the selected column in the selected Ttk_Tree_View
      -- PARAMETERS
      -- TreeViewWidget - Ttk_Tree_View in which column will be modified
      -- Col            - Identificator of the column to modify
      -- Options        - Tk options to pass to the column
      -- HISTORY
      -- 8.6.2 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- EXAMPLE
      -- -- Set width of column name in My_View treeview to 200 pixels
      -- Column(My_View, "name", "-width 200");
      -- COMMANDS
      -- TreeViewWidget column col ?options?
      -- SEE ALSO
      -- Column (function)
      -- SOURCE
   procedure Column
     (TreeViewWidget: in Ttk_Tree_View; Col: in String;
      Options: in String) with
      Pre => Col /= "" and Options /= "";
      -- ****

      -- ****f* TtkTreeView/Column (function)
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
      -- HISTORY
      -- 8.6.2 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- EXAMPLE
      -- -- Get the minimum width of the column name in My_View
      -- Min_Width: constant String := Column(My_View, "name", "-minwidth");
      -- COMMANDS
      -- TreeViewWidget column col ?option?
      -- SEE ALSO
      -- Column (procedure)
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
      -- HISTORY
      -- 8.6.1 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- EXAMPLE
      -- -- Delete item with index myitem from My_View treeview
      -- Delete(My_View, "[list myitem]");
      -- COMMANDS
      -- TreeViewWidget delete itemList
      -- SEE ALSO
      -- Detach
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
      -- HISTORY
      -- 8.6.3 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- EXAMPLE
      -- -- Hide item with index I001 from My_View treeview
      -- Detach(My_View, "[list I001]");
      -- COMMANDS
      -- TreeViewWidget detach itemList
      -- SEE ALSO
      -- Delete
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
      -- HISTORY
      -- 8.6.2 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- EXAMPLE
      -- -- Check if item with index MyItem12 exists in My_View treeview
      -- Item_Exists: constant String := Exists(My_View, "MyItem12");
      -- COMMANDS
      -- TreeViewWidget exists item
      -- SOURCE
   function Exists
     (TreeViewWidget: in Ttk_Tree_View; Item: in String) return String with
      Pre => Item /= "";
      -- ****

      -- ****f* TtkTreeView/Focus (procedure)
      -- FUNCTION
      -- Set focus item in the selected Ttk_Tree_View
      -- PARAMETERS
      -- TreeViewWidget - Ttk_Tree_View in which item will be set
      -- Item           - Identifier of the item which will be set as focused
      -- HISTORY
      -- 8.6.3 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   procedure Focus(TreeViewWidget: in Ttk_Tree_View; Item: in String) with
      Pre => Item /= "";
      -- ****

      -- ****f* TtkTreeView/Focus (function)
      -- FUNCTION
      -- Get currently focused item in the selected Ttk_Tree_View
      -- PARAMETERS
      -- TreeViewWidget - TreeViewWidget which will be queried for focused
      --                  item
      -- RESULT
      -- Identifier ot the currently focused item or empty string if none
      -- HISTORY
      -- 8.6.3 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Focus(TreeViewWidget: in Ttk_Tree_View) return String;
   -- ****

   -- ****f* TtkTreeView/Heading (procedure)
   -- FUNCTION
   -- Configure selected column header
   -- PARAMETERS
   -- TreeViewWidget - Ttk_Tree_View in which header will be configured
   -- Column         - Id of column which header will be configured
   -- Options        - Tk options for selected header
   -- HISTORY
   -- 8.6.1 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   procedure Heading
     (TreeViewWidget: in Ttk_Tree_View; Column, Options: in String) with
      Pre => Column /= "" and Options /= "";
      -- ****

      -- ****f* TtkTreeView/Heading (function)
      -- FUNCTION
      -- Get configuration of selected column header
      -- PARAMETERS
      -- TreeViewWidget - Ttk_Tree_View in which header will be queried
      -- Column         - Id of column which header will be queried
      -- Option         - Tk option to query. Default value is empty
      -- RESULT
      -- Configuration options of selected header. If option is specified,
      -- return selected option value
      -- HISTORY
      -- 8.6.1 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Heading
     (TreeViewWidget: in Ttk_Tree_View; Column: in String;
      Option: in String := "") return String with
      Pre => Column /= "";
      -- ****

      -- ****f* TtkTreeView/Identify_Column
      -- FUNCTION
      -- Get the identifier of the column of the selected Ttk_Tree_View at the
      -- selected position
      -- PARAMETERS
      -- TreeViewWidget - Ttk_Tree_View which will be queried for the columns
      -- X              - X coordinate to check for the column
      -- Y              - Y coordinate to check for the column
      -- RESULT
      -- Identifier of the column at the selected position
      -- HISTORY
      -- 8.6.6 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Identify_Column
     (TreeViewWidget: in Ttk_Tree_View; X, Y: in String) return String with
      Pre => X /= "" and Y /= "";
      -- ****

      -- ****f* TtkTreeView/Identify_Element
      -- FUNCTION
      -- Get the identifier of the element of the selected Ttk_Tree_View at the
      -- selected position
      -- PARAMETERS
      -- TreeViewWidget - Ttk_Tree_View which will be queried for the element
      -- X              - X coordinate to check for the element
      -- Y              - Y coordinate to check for the element
      -- RESULT
      -- Identifier of the element at the selected position
      -- HISTORY
      -- 8.6.6 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Identify_Element
     (TreeViewWidget: in Ttk_Tree_View; X, Y: in String) return String with
      Pre => X /= "" and Y /= "";
      -- ****

      -- ****f* TtkTreeView/Identify_Item
      -- FUNCTION
      -- Get the identifier of the item of the selected Ttk_Tree_View at the
      -- selected position
      -- PARAMETERS
      -- TreeViewWidget - Ttk_Tree_View which will be queried for the items
      -- X              - X coordinate to check for the item
      -- Y              - Y coordinate to check for the item
      -- RESULT
      -- Identifier of the item at the selected position
      -- HISTORY
      -- 8.6.6 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Identify_Item
     (TreeViewWidget: in Ttk_Tree_View; X, Y: in String) return String with
      Pre => X /= "" and Y /= "";
      -- ****

      -- ****f* TtkTreeView/Identify_Region
      -- FUNCTION
      -- Get the type of the element of the selected Ttk_Tree_View at the
      -- selected position
      -- PARAMETERS
      -- TreeViewWidget - Ttk_Tree_View which will be queried for the elements
      -- X              - X coordinate to check for the element
      -- Y              - Y coordinate to check for the element
      -- RESULT
      -- Type of the element at selected position. Can be one of: "heading",
      -- "separator", "tree" and "cell"
      -- HISTORY
      -- 8.6.6 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Identify_Region
     (TreeViewWidget: in Ttk_Tree_View; X, Y: in String) return String with
      Pre => X /= "" and Y /= "";
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
      -- HISTORY
      -- 8.6.2 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Index
     (TreeViewWidget: in Ttk_Tree_View; Item: in String) return String with
      Pre => Item /= "";
      -- ****

      -- ****f* TtkTreeView/Insert (procedure)
      -- FUNCTION
      -- Insert new item to tree view
      -- PARAMETERS
      -- TreeViewWidget - Ttk_Tree_View in which item will be inserted
      -- Options        - Tk options for the item which will be inserted
      -- HISTORY
      -- 8.6.1 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   procedure Insert(TreeViewWidget: in Ttk_Tree_View; Options: in String) with
      Pre => Options /= "";
      -- ****

      -- ****f* TtkTreeView/Insert (function)
      -- FUNCTION
      -- Insert new item to tree view
      -- PARAMETERS
      -- TreeViewWidget - Ttk_Tree_View in which item will be inserted
      -- Options        - Tk options for the item which will be inserted
      -- RESULT
      -- Index of newly inserted item
      -- HISTORY
      -- 8.6.3 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Insert
     (TreeViewWidget: in Ttk_Tree_View; Options: in String) return String with
      Pre => Options /= "";
      -- ****

      -- ****f* TtkTreeView/Item (procedure)
      -- FUNCTION
      -- Modify options of selected item in tree view
      -- PARAMETERS
      -- TreeViewWidget - Ttk_Tree_View in which item options will be modified
      -- Item           - Id of the item to modify
      -- Options        - Tk options to set for the selected item
      -- HISTORY
      -- 8.6.1 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   procedure Item
     (TreeViewWidget: in Ttk_Tree_View; Item, Options: in String) with
      Pre => Item /= "" and Options /= "";
      -- ****

      -- ****f* TtkTreeView/Item (function)
      -- FUNCTION
      -- Get options of the selected item in tree view
      -- PARAMETERS
      -- TreeViewWidget - Ttk_Tree_View in which item options will be queried
      -- Item           - Id of the item to query
      -- Options        - Tk options to get from the selected item. If empty, get
      --                  all options. Default is empty.
      -- HISTORY
      -- 8.6.1 - Added
      -- TODO
      -- Replace it with higher level of binding
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
      -- HISTORY
      -- 8.6.2 - Added
      -- TODO
      -- Replace it with higher level of binding
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
      -- HISTORY
      -- 8.6.3 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Next
     (TreeViewWidget: in Ttk_Tree_View; Item: in String) return String with
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
      -- HISTORY
      -- 8.6.3 - Added
      -- TODO
      -- Replace it with higher level of binding
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
      -- HISTORY
      -- 8.6.3 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Prev
     (TreeViewWidget: in Ttk_Tree_View; Item: in String) return String with
      Pre => Item /= "";
      -- ****

      -- ****f* TtkTreeView/See
      -- FUNCTION
      -- Make the selected item visible (scroll Ttk_Tree_View and open its
      -- ancestor if needed)
      -- PARAMETERS
      -- TreeViewWidget - Ttk_Tree_View in which the item will be visible
      -- Item           - Identifier of the item which will be visible
      -- HISTORY
      -- 8.6.6 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   procedure See(TreeViewWidget: in Ttk_Tree_View; Item: in String) with
      Pre => Item /= "";
      -- ****

      -- ****f* TtkTreeView/Selection
      -- FUNCTION
      -- Get selected items from the selected Ttk_Tree_View
      -- PARAMETERS
      -- TreeViewWidget - Ttk_Tree_View from which selection will be taken
      -- RESULT
      -- List of items currently selected in TreeViewWidget
      -- HISTORY
      -- 8.6.2 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Selection(TreeViewWidget: in Ttk_Tree_View) return String;
   -- ****

   -- ****f* TtkTreeView/Selection_Set
   -- FUNCTION
   -- Set new selection for the selected Ttk_Tree_View
   -- PARAMETERS
   -- TreeViewWidget - Ttk_Tree_View in which selection will be set
   -- Items          - Tcl list of items to set as selected
   -- HISTORY
   -- 8.6.2 - Added
   -- TODO
   -- Replace it with higher level of binding
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
      -- HISTORY
      -- 8.6.2 - Added
      -- TODO
      -- Replace it with higher level of binding
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
      -- HISTORY
      -- 8.6.2 - Added
      -- TODO
      -- Replace it with higher level of binding
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
      -- HISTORY
      -- 8.6.2 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   procedure Selection_Toggle
     (TreeViewWidget: in Ttk_Tree_View; Items: in String) with
      Pre => Items /= "";
      -- ****

      -- ****f* TtkTreeView/Set (function)
      -- FUNCTION
      -- Get the value(s) of the selected item in the selected Ttk_Tree_View
      -- PARAMETERS
      -- TreeViewWidget - Ttk_Tree_View in which the selected item will be
      --                  queried
      -- Item           - Identifier of the item which values will be taken
      -- Column         - Identifier of the column of the item which value
      --                  will be taken. Can be empty. Default value is empty
      -- RESULT
      -- If Column is empty, return a dictionary of columns/values pairs for
      -- the selected item. Otherwise return value for the selected column
      -- HISTORY
      -- 8.6.6 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Set
     (TreeViewWidget: in Ttk_Tree_View; Item: in String;
      Column: in String := "") return String with
      Pre => Item /= "";
      -- ****

      -- ****f* TtkTreeView/Set (procedure)
      -- FUNCTION
      -- Set the value of the selected column of the selected item in the
      -- selected Ttk_Tree_View
      -- PARAMETERS
      -- TreeViewWidget - Ttk_Tree_View in which the selected item will be set
      -- Item           - Identifier of the item which value will be set
      -- Column         - Identifier of the column which value will be set
      -- Value          - A new value for the selected Column
      -- HISTORY
      -- 8.6.6 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   procedure Set
     (TreeViewWidget: in Ttk_Tree_View; Item, Column, Value: in String) with
      Pre => Item /= "" and Column /= "" and Value /= "";
      -- ****

      -- ****f* TtkTreeView/Tag_Add
      -- FUNCTION
      -- Add the selected tag to the selected items in the selcted
      -- Ttk_Tree_View
      -- PARAMETERS
      -- TreeViewWidget - Ttk_Tree_View in which tag will be added
      -- Tag            - Name of the tag to add
      -- Items          - List of the items to which the Tag will be added
      -- HISTORY
      -- 8.6.6 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   procedure Tag_Add
     (TreeViewWidget: in Ttk_Tree_View; Tag, Items: in String) with
      Pre => Tag /= "" and Items /= "";
      -- ****

      -- ****f* TtkTreeView/Tag_Bind (procedure)
      -- FUNCTION
      -- Bind the selected script to the selected sequence on the selected tag
      -- PARAMETERS
      -- TreeViewWidget - Ttk_Tree_View in which script will be bound
      -- TagName        - Name of the tag to which script will be bound
      -- Sequence       - Name of the sequence to which script will be bound
      -- Script         - Tcl commands which will be bound
      -- HISTORY
      -- 8.6.6 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   procedure Tag_Bind
     (TreeViewWidget: in Ttk_Tree_View;
      TagName, Sequence, Script: in String) with
      Pre => TagName /= "" and Sequence /= "" and Script /= "";
      -- ****

      -- ****f* TtkTreeView/Tag_Bind (function)
      -- FUNCTION
      -- Get scrips bounded to the selected tag in the selected Ttk_Tree_View
      -- PARAMETERS
      -- TreeViewWidget - Ttk_Tree_View in which information will be queried
      -- TagName        - Name of the tag which bindings will be queried
      -- Sequence       - Name of the sequence. Can be empty. Default value is
      --                  empty
      -- RESULT
      -- If Sequence is empty, return all binded sequences. Otherwise, return
      -- script associated with the selected Sequence.
      -- HISTORY
      -- 8.6.6 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Tag_Bind
     (TreeViewWidget: in Ttk_Tree_View; TagName: in String;
      Sequence: in String := "") return String with
      Pre => TagName /= "";
      -- ****

      -- ****f* TtkTreeView/Tag_Configure (procedure)
      -- FUNCTION
      -- Configure the selected tag in the selected Ttk_Tree_View widget
      -- PARAMETERS
      -- TreeViewWidget - Ttk_Tree_View in which tag will be configured
      -- TagName        - Name of the tag to configure
      -- Options        - Tag options with values to set
      -- HISTORY
      -- 8.6.6 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   procedure Tag_Configure
     (TreeViewWidget: in Ttk_Tree_View; TagName, Options: in String) with
      Pre => TagName /= "" and Options /= "";
      -- ****

      -- ****f* TtkTreeView/Tag_Configure (function)
      -- FUNCTION
      -- Get configuration of the selected tag in the selected Ttk_Tree_View
      -- widget
      -- PARAMETERS
      -- TreeViewWidget - Ttk_Tree_View in which the tag will be queried for
      --                  options
      -- TagName        - Name of the tag which configuration will be queried
      -- Option         - Configuration option which value to get. Default value
      --                  is empty
      -- RESULT
      -- The selected configuration option value. If Option is empty, return
      -- string with all options and their values.
      -- HISTORY
      -- 8.6.6 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Tag_Configure
     (TreeViewWidget: in Ttk_Tree_View; TagName: in String;
      Option: in String := "") return String with
      Pre => TagName /= "";
      -- ****

      -- ****f* TtkTreeView/Tag_Has
      -- FUNCTION
      -- Get if the selected item has the selected tag or list of items with
      -- the tag
      -- PARAMETERS
      -- TreeViewWidget - Ttk_Tree_View in which the selected tag will be
      --                  queried
      -- TagName        - Name of the tag to check
      -- Item           - Index of the item to query. Can be empty. Default
      --                  value is empty
      -- RESULT
      -- If Item is specified, return "1" when item has that tag, otherwise
      -- return "0". If Item is not specified return list of items which have
      -- the selected tag.
      -- HISTORY
      -- 8.6.6 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Tag_Has
     (TreeViewWidget: in Ttk_Tree_View; TagName: in String;
      Item: in String := "") return String with
      Pre => TagName /= "";
      -- ****

      -- ****f* TtkTreeView/Tag_Names
      -- FUNCTION
      -- Get the names of the all available tags in the selected Ttk_Tree_View
      -- PARAMETERS
      -- TreeViewWidget - Ttk_Tree_View which will be queried for tags names
      -- RESULT
      -- List of names of all available tags
      -- HISTORY
      -- 8.6.6 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Tag_Names(TreeViewWidget: in Ttk_Tree_View) return String;
   -- ****

   -- ****f* TtkTreeView/Tag_Remove
   -- FUNCTION
   -- Remove the selected tag from the selected items in the selected
   -- Ttk_Tree_View
   -- PARAMETERS
   -- TreeViewWidget - Ttk_Tree_View in which the selected tag will be removed
   -- Tag            - The name of the tag to remove
   -- Items          - List of the items to remove. If empty, remove the
   --                  selected tag from all items in TreeViewWidget. Default
   --                  value is empty
   -- HISTORY
   -- 8.6.6 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   procedure Tag_Remove
     (TreeViewWidget: in Ttk_Tree_View; Tag: in String;
      Items: in String := "") with
      Pre => Tag /= "";
      -- ****

   -- ****f* TtkTreeView/XView
   -- FUNCTION
   -- Get which horizontal fraction of the Ttk_Tree_View is visible
   -- PARAMETERS
   -- TreeViewWidget - Ttk_Tree_View which will be queried for visibility
   -- RESULT
   -- Pair of elements: first element is the start of horizontal fraction of
   -- the TreeViewWidget which is visible, second is the end of horizontal
   -- fraction of the TreeViewWidget which is visible.
   -- HISTORY
   -- 8.6.6 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   function XView(TreeViewWidget: in Ttk_Tree_View) return String;
   -- ****

   -- ****f* TtkTreeView/Xview_Move_To
   -- FUNCTION
   -- Adjusts the view in the window so that fraction of the total width of
   -- the Ttk_Tree_View is off-screen to the left.
   -- PARAMETERS
   -- TreeViewWidget - Ttk_Tree_View which view will be adjusted
   -- Fraction       - Fraction of the TreeViewWidget to move. Must be between 0
   --                  and 1
   -- HISTORY
   -- 8.6.6 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   procedure Xview_Move_To
     (TreeViewWidget: in Ttk_Tree_View; Fraction: in String) with
      Pre => Fraction /= "";
      -- ****

      -- ****f* TtkTreeView/Xview_Scroll
      -- FUNCTION
      -- Shift the view in the window on left or right according to Number and
      -- What.
      -- PARAMETERS
      -- TreeViewWidget - Ttk_Tree_View which view will be shifted
      -- Number         - The amount of What to shift the TreeViewWidget
      -- What           - Type of amount to move. Can be "units" or "pages"
      -- HISTORY
      -- 8.6.6 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   procedure Xview_Scroll
     (TreeViewWidget: in Ttk_Tree_View; Number, What: in String) with
      Pre => Number /= "" and (What = "units" or What = "pages");
      -- ****

      -- ****f* TtkTreeView/YView
      -- FUNCTION
      -- Get which vertical fraction of the Ttk_Tree_View is visible
      -- PARAMETERS
      -- TreeViewWidget - Ttk_Tree_View which will be queried for visibility
      -- RESULT
      -- Pair of elements: first element is the start of vertical fraction of
      -- the TreeViewWidget which is visible, second is the end of vertical
      -- fraction of the TreeViewWidget which is visible.
      -- HISTORY
      -- 8.6.6 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function YView(TreeViewWidget: in Ttk_Tree_View) return String;
   -- ****

   -- ****f* TtkTreeView/Yview_Move_To
   -- FUNCTION
   -- Adjusts the view in the window so that fraction of the total height of
   -- the Ttk_Tree_View is off-screen to the top.
   -- PARAMETERS
   -- TreeViewWidget - Ttk_Tree_View which view will be adjusted
   -- Fraction       - Fraction of the TreeViewWidget to move. Must be between 0
   --                  and 1
   -- HISTORY
   -- 8.6.6 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   procedure Yview_Move_To
     (TreeViewWidget: in Ttk_Tree_View; Fraction: in String) with
      Pre => Fraction /= "";
      -- ****

      -- ****f* TtkTreeView/Yview_Scroll
      -- FUNCTION
      -- Shift the view in the window on top or bottom according to Number and
      -- What.
      -- PARAMETERS
      -- TreeViewWidget - Ttk_Tree_View which view will be shifted
      -- Number         - The amount of What to shift the TreeViewWidget
      -- What           - Type of amount to move. Can be "units" or "pages"
      -- HISTORY
      -- 8.6.6 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   procedure Yview_Scroll
     (TreeViewWidget: in Ttk_Tree_View; Number, What: in String) with
      Pre => Number /= "" and (What = "units" or What = "pages");
      -- ****
private

   type Ttk_Tree_View is new Tk_Widget with null record;

end Tcl.Tk.Ada.Widgets.TtkTreeView;

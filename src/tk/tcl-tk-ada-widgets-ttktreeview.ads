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

     -- ****f* TtkTreeView/Get_Widget
     -- FUNCTION
     -- Get the existing Ttk_Tree_View widget
     -- PARAMETERS
     -- pathName - Tk path (starts with dot) for the widget
     -- Interp   - Tcl interpreter on which the widget exists. Can be empty.
     --            Default value is current Tcl interpreter
     -- RESULT
     -- Existing Ttk_Tree_View widget
     -- HISTORY
     -- 8.6.9 - Added
     -- EXAMPLE
     -- -- Get treeview widget with name .myview on the current Tcl interpreter
     -- My_View: constant Ttk_Tree_View := Get_Widget(".myview");
     -- SOURCE
   overriding function Get_Widget
     (pathName: in String; Interp: in Tcl_Interp := Get_Context)
      return Ttk_Tree_View;
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
      -- EXAMPLE
      -- -- Set the focus on item I001 in My_View treeview
      -- Focus(My_View, "I001");
      -- COMMANDS
      -- TreeViewWidget focus item
      -- SEE ALSO
      -- Focus (function)
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
      -- EXAMPLE
      -- -- Get the currently focused item index in My_View treeview
      -- Focus_Index: constant String := Focus(My_View);
      -- COMMANDS
      -- TreeViewWidget focus
      -- SEE ALSO
      -- Focus (procedure)
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
   -- EXAMPLE
   -- -- Set text displayed on header of tree column to # in My_View treeview
   -- Heading(My_View, "#0", "-text {#}");
   -- COMMANDS
   -- TreeViewWidget heading column options
   -- SEE ALSO
   -- Heading (function)
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
      -- EXAMPLE
      -- Get the text displayed on header of column name in My_View treeview
      -- Text: constant String := Heading(My_View, "name", "-text");
      -- COMMANDS
      -- TreeViewWidget heading column ?option?
      -- SEE ALSO
      -- Heading (procedure)
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
      -- EXAMPLE
      -- -- Get the identifier of column at point (23, 48) in My_View treeview
      -- Identifier: constant String := Identify_Column(My_View, "23", "48");
      -- COMMANDS
      -- TreeViewWidget identify column x y
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
      -- EXAMPLE
      -- -- Get the element name at point (12, 87) in My_View treeview
      -- Element_Name: constant String := Identify_Element(My_View, "12", "87");
      -- COMMANDS
      -- TreeViewWidget identify element x y
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
      -- EXAMPLE
      -- -- Get the identifier of the item at point (76, 23) in My_View treeview
      -- Item_Index: constant String := Identify_Item(My_View, "76", "23");
      -- COMMANDS
      -- TreeViewWidget identify item x y
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
      -- EXAMPLE
      -- -- Get the element type at point (45, 89) in My_View treeview
      -- Element_Type: constant String := Identify_Region(My_View, "45", "89");
      -- COMMANDS
      -- TreeViewWidget identify region x y
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
      -- EXAMPLE
      -- -- Get the numeric idex of item with index I012 in My_View treeview
      -- Item_Index: constant String := Index(My_View, "I012");
      -- COMMANDS
      -- TreeViewWidget index item
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
      -- EXAMPLE
      -- -- Insert a new top-level item with id myitem1 and text my item text at the end of My_View treeview
      -- Insert(My_View, "{} end -id myitem1 -text {my item text}");
      -- COMMANDS
      -- TreeViewWidget insert options
      -- SEE ALSO
      -- Insert (function)
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
      -- -- Insert a new top-level item with text my new text at the end of My_View treeview
      -- Item_Index: constant String := Insert(My_View, "{} end -text {my new text}");
      -- COMMANDS
      -- TreeViewWidget insert options
      -- SEE ALSO
      -- Insert (procedure)
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
      -- EXAMPLE
      -- -- Set the text of item I001 to new text in My_View treeview
      -- Item(My_View, "I001", "-text {new text}");
      -- COMMANDS
      -- TreeViewWidget item item options
      -- SEE ALSO
      -- Item (function)
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
      -- EXAMPLE
      -- -- Get the text of item I001 from My_View treeview
      -- Text: constant String := Item(My_View, "I001", "-text");
      -- COMMANDS
      -- TreeViewWidget item item ?options?
      -- SEE ALSO
      -- Item (procedure)
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
      -- EXAMPLE
      -- -- Move item I001 to first row in root in My_View treeview
      -- Move(My_View, "I001", "{}", "0");
      -- COMMANDS
      -- TreeViewWidget move item parent index
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
      -- EXAMPLE
      -- -- Get the identifier of next item after item I001 in My_View treeview
      -- Identifier: constant String := Next(My_View, "I001");
      -- COMMANDS
      -- TreeViewWidget next item
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
      -- EXAMPLE
      -- -- Get the identifier of the parent of item I001 in My_View treeview
      -- Parent_ID := constant String := Parent(My_View, "I001");
      -- COMMANDS
      -- TreeViewWidget parent item
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
      -- EXAMPLE
      -- -- Get the identifier of item before item I010 in My_View treeview
      -- Identifier: constant String := Prev(My_View, "I010");
      -- COMMANDS
      -- TreeViewWidget prev item
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
      -- EXAMPLE
      -- -- Scroll the My_View treeview to item I001
      -- See(My_View, "I001");
      -- COMMANDS
      -- TreeViewWidget see item
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
      -- EXAMPLE
      -- -- Get the selected items from My_View treeview
      -- Selected_Items: constant String := Selection(My_View);
      -- COMMANDS
      -- TreeViewWidget selection
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
   -- EXAMPLE
   -- -- Set the selection in My_View treeview to item I001
   -- Selection_Set(My_View, "[list I001]");
   -- COMMANDS
   -- TreeViewWidget selection set items
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
      -- EXAMPLE
      -- -- Add item I001 to the selection in My_View treeview
      -- Selection_Add(My_View, "[list I001]");
      -- COMMANDS
      -- TreeViewWidget selection add items
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
      -- EXAMPLE
      -- -- Remove item I001 from the selection in My_View treeview
      -- Selection_Remove(My_View, "[list I001]");
      -- COMMANDS
      -- TreeViewWidget selection remove items
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
      -- EXAMPLE
      -- -- Toggle selection state for items I001 and I010 in My_View treeview
      -- Selection_Toggle(My_View, "[list I001 I010]");
      -- COMMANDS
      -- TreeViewWidget selection toggle items
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
      -- EXAMPLE
      -- -- Get the value for column name for item I001 in My_View treeview
      -- Item_Name: constant String := Set(My_View, "I001", "name");
      -- COMMANDS
      -- TreeViewWidget set item ?column?
      -- SEE ALSO
      -- Set (procedure)
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
      -- EXAMPLE
      -- -- Set name of the item I001 in My_View treeview to new name
      -- Set(My_View, "I001", "name", "{new name}");
      -- COMMANDS
      -- TreeViewWidget set item column value
      -- SEE ALSO
      -- Set (function)
      -- SOURCE
   procedure Set
     (TreeViewWidget: in Ttk_Tree_View; Item, Column, Value: in String) with
      Pre => Item /= "" and Column /= "" and Value /= "";
      -- ****

      -- ****f* TtkTreeView/Tag_Add
      -- FUNCTION
      -- Add the selected tag to the selected items in the selected
      -- Ttk_Tree_View
      -- PARAMETERS
      -- TreeViewWidget - Ttk_Tree_View in which tag will be added
      -- Tag            - Name of the tag to add
      -- Items          - List of the items to which the Tag will be added
      -- HISTORY
      -- 8.6.6 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- EXAMPLE
      -- -- Add tag mytag to the item I001 in My_View treeview
      -- Tag_Add(My_View, "mytag", "[list I001]");
      -- COMMANDS
      -- TreeViewWidget tag add tag items
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
      -- EXAMPLE
      -- -- Bind the tcl command MyCommand to tag mytag in My_View treeview when someone left click mouse on it
      -- Tag_Bind(My_View, "mytag", "<1>","MyCommand");
      -- COMMANDS
      -- TreeViewWidget tag bind tagName sequence script
      -- SEE ALSO
      -- Tag_Bind (function)
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
      -- -- Get the script bounded to left click mouse event on tag mytag in My_View treeview
      -- Script: constant String := Tag_Bind(My_View, "mytag", "<1>");
      -- COMMANDS
      -- TreeViewWidget tag bind tagName ?sequence?
      -- SEE ALSO
      -- Tag_Bind (procedure)
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
      -- EXAMPLE
      -- -- Create a new tag with name mytag and text color white in My_View treeview
      -- Tag_Configure(My_View, "mytag", "-foreground white");
      -- COMMANDS
      -- TreeViewWidget tag configure tagName options
      -- SEE ALSO
      -- Tag_Configure (function)
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
      -- EXAMPLE
      -- -- Get the configuration for the tag mytag in My_View treeview
      -- Options: constant String := Tag_Configure(My_View, "mytag");
      -- COMMANDS
      -- TreeViewWidget tag configure tagName ?option?
      -- SEE ALSO
      -- Tag_Configure (procedure)
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
      -- EXAMPLE
      -- -- Check if the item I001 has the tag mytag in My_View treeview
      -- Has_Tag: constant String := Tag_Has(My_View, "mytag", "I001");
      -- COMMANDS
      -- TreeViewWidget tag has tagName ?item?
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
      -- EXAMPLE
      -- -- Get the names of all tags in My_View treeview
      -- Tags_Names: constant String := Tag_Names(My_View);
      -- COMMANDS
      -- TreeViewWidget tag names
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
   -- EXAMPLE
   -- -- Remove tag mytag from the item I001 in My_View treeview
   -- Tag_Remove(My_View, "mytag", "I001");
   -- COMMANDS
   -- TreeViewWidget tag remove tag ?items?
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
      -- EXAMPLE
      -- -- Get the horizontal fraction of the My_View treeview
      -- Horizontal_Fraction: constant String := XView(My_View);
      -- COMMANDS
      -- TreeViewWidget xview
      -- SEE ALSO
      -- YView
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
   -- EXAMPLE
   -- -- Show the first half of the My_View treeview
   -- Xview_Move_To(My_View, "0.5");
   -- COMMANDS
   -- TreeViewWidget xview moveto fraction
   -- SEE ALSO
   -- Yview_Move_To
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
      -- EXAMPLE
      -- -- Move the view in the My_View treeview by 10 units to right
      -- Xview_Scroll(My_View, "10", "units");
      -- COMMANDS
      -- TreeViewWidget xview scroll number what
      -- SEE ALSO
      -- Yview_Scroll
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
      -- EXAMPLE
      -- -- Get the vertical fraction of the My_View treeview
      -- Vertical_Fraction: constant String := YView(My_View);
      -- COMMANDS
      -- TreeViewWidget yview
      -- SEE ALSO
      -- XView
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
   -- EXAMPLE
   -- -- Show the first half of the My_View treeview
   -- Yview_Move_To(My_View, "0.5");
   -- COMMANDS
   -- TreeViewWidget yview moveto fraction
   -- SEE ALSO
   -- Xview_Move_To
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
      -- EXAMPLE
      -- -- Move the view in the My_View treeview by 10 units to top
      -- Yview_Scroll(My_View, "-10", "units");
      -- COMMANDS
      -- TreeViewWidget yview scroll number what
      -- SEE ALSO
      -- Xview_Scroll
      -- SOURCE
   procedure Yview_Scroll
     (TreeViewWidget: in Ttk_Tree_View; Number, What: in String) with
      Pre => Number /= "" and (What = "units" or What = "pages");
      -- ****
private

   type Ttk_Tree_View is new Tk_Widget with null record;

end Tcl.Tk.Ada.Widgets.TtkTreeView;

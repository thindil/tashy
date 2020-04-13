-- Copyright (c) 2020 Bartek thindil Jasicki <thindil@laeran.pl>
--
-- This program is free software: you can redistribute it and/or modify
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

-- ****h* Widgets/ListBox
-- FUNCTION
-- Provides code for manipulate Tk widget ListBox
-- SOURCE
package Tcl.Tk.Ada.Widgets.ListBox is
-- ****

   -- ****t* ListBox/Tk_ListBox
   -- FUNCTION
   -- This is a non-abstract type derived directly from Tk_Widget.
   -- Each of the derived widgets redefines the Create subprogram
   -- in order to create the correct type of widget.
   -- SOURCE
   type Tk_ListBox is new Tk_Widget with private;
   -- ****

   -- ****f* ListBox/Create
   -- FUNCTION
   -- Creates a new Tk_ListBox in the specified interpreter.
   -- PARAMETERS
   -- Widgt    - Tk_ListBox which will be created
   -- pathName - Tk path (starts with dot) for the widget
   -- options  - Options which will be passed to the widget. Default value is
   --            empty
   -- Interp   - Tcl interpreter to which the widget will be created. If null,
   --            the widget will be created in the "contextual" interpreter.
   --            Default value is null.
   -- RESULT
   -- Newly created Tk_ListBox
   -- SOURCE
   overriding function Create
     (pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) return Tk_ListBox with
      Pre => pathName /= "";
   overriding procedure Create
     (Widgt: out Tk_ListBox; pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) with
      Pre => pathName /= "";
      -- ****

      -- ****f* ListBox/Activate
      -- FUNCTION
      -- Set the active element of Tk_ListBox to the selected index.
      -- PARAMETERS
      -- ListboxWidget - Tk_ListBox in which element will be set as active
      -- Index         - Index of element to set as active
      -- HISTORY
      -- 8.6.4 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   procedure Activate(ListboxWidget: in Tk_ListBox; Index: in String) with
      Pre => Index /= "";
      -- ****

      -- ****f* ListBox/BBox
      -- FUNCTION
      -- Get size of bounding box of the selected item text in the selected
      -- Tk_ListBox
      -- PARAMETERS
      -- ListboxWidget - Tk_ListBox which will be queried
      -- Index         - Index of item from which bounding box will be
      --                 taken
      -- RESULT
      -- Four values: x1, y1 - coordinates of starting point of bounding box
      -- from top left, x2, y2 - coordinates of ending point from bottom right
      -- of bounding box.
      -- HISTORY
      -- 8.6.4 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function BBox
     (ListboxWidget: in Tk_ListBox; Index: in String) return String with
      Pre => Index /= "";
      -- ****

      -- ****f* ListBox/CurSelection
      -- FUNCTION
      -- Get the current selected items in the selected Tk_ListBox
      -- PARAMETERS
      -- ListboxWidget - Tk_ListBox which will be queried for selection
      -- RESULT
      -- List of numerical indices of all of the elements in ListboxWidget
      -- that are currently selected or {} if no elements selected.
      -- HISTORY
      -- 8.6.4 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function CurSelection(ListboxWidget: in Tk_ListBox) return String;
   -- ****

   -- ****f* ListBox/Delete
   -- FUNCTION
   -- Delete the selected elements from the selected Tk_ListBox
   -- PARAMETERS
   -- ListboxWidget - Tk_ListBox in which elements will be deleted
   -- First         - Index of first element to delete
   -- Last          - Index of last element to delete. If empty, only one
   --                 element will be deleted. Default value is empty
   -- HISTORY
   -- 8.6.4 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   procedure Delete
     (ListboxWidget: in Tk_ListBox; First: in String;
      Last: in String := "") with
      Pre => First /= "";
      -- ****

      -- ****f* Tcl.Tk.Ada.Widgets.ListBox/Get
      -- FUNCTION
      -- Get the content of the selected elements in the selected Tk_ListBox
      -- PARAMETERS
      -- ListboxWidget - Tk_ListBox which will be queried for elements
      -- First         - Index of first element to get
      -- Last          - Index of last element to get. Default value is empty
      -- RESULT
      -- If Last is empty, return only one element, marked by First argument.
      -- If both are present, return list of elements from First to Last. If
      -- no elements are in range, return {}
      -- HISTORY
      -- 8.6.4 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Get
     (ListboxWidget: in Tk_ListBox; First: in String; Last: in String := "")
      return String with
      Pre => First /= "";
      -- ****

      -- ****f* ListBox/Index
      -- FUNCTION
      -- Get the index for the selected element in the selected Tk_ListBox
      -- PARAMETERS
      -- ListboxWidget - Tk_ListBox which will be queried for index
      -- Index         - Index of the element to get
      -- RESULT
      -- Numerical index of the selected element. If Index is set to "end",
      -- return count of numbers of the elements in the ListboxWidget
      -- HISTORY
      -- 8.6.4 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Index
     (ListboxWidget: in Tk_ListBox; Index: in String) return String with
      Pre => Index /= "";
      -- ****

      -- ****f* ListBox/Insert
      -- FUNCTION
      -- Insert zero or more elements to the selected Tk_ListBox
      -- PARAMETERS
      -- ListboxWidget - Tk_ListBox to which elements will be added
      -- Index         - Index in ListboxWidget where add the elements
      -- Elements      - Elements to add. Default value is empty
      -- HISTORY
      -- 8.6.4 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   procedure Insert
     (ListboxWidget: in Tk_ListBox; Index: in String;
      Elements: in String := "") with
      Pre => Index /= "";
      -- ****

      -- ****f* ListBox/Item_Cget
      -- FUNCTION
   -- Get the selected option of the selected item in the selected Tk_ListBox
   -- PARAMETERS
   -- ListboxWidget - Tk_ListBox which will be queried for the option
   -- Index         - Index of the item in ListboxWidget which will be
      --                 queried for the option
      -- Option        - Tk option to get
      -- HISTORY
      -- 8.6.4 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Item_Cget
     (ListboxWidget: in Tk_ListBox; Index, Option: in String)
      return String with
      Pre => Index /= "" and Option /= "";
      -- ****

   -- ****f* ListBox/Item_Configure
   -- FUNCTION
   -- Queries or modifies the configuration options of the selected item
   -- PARAMETERS
   -- ListBoxWidget - Tk_ListBox which will be queried or modified for options
   -- Index         - Index of the item which will be queried or modified
      --                 for options
      -- Options       - Options to modify or get.
      -- RESULT
      -- If Options is empty, return all available options and their values for
      -- the selected item. Otherwise, return selected option's value for the
      -- selected item
      -- HISTORY
      -- 8.6.4 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   procedure Item_Configure
     (ListBoxWidget: in Tk_ListBox; Index, Options: in String) with
      Pre => Index /= "" and Options /= "";
   function Item_Configure
     (ListBoxWidget: in Tk_ListBox; Index: in String; Options: in String := "")
      return String with
      Pre => Index /= "";
      -- ****

      -- ****f* ListBox/Nearest
      -- FUNCTION
      -- Get nearest element to the selected point in the selected Tk_ListBox
      -- PARAMETERS
      -- ListboxWidget - Tk_ListBox which will be queried for the item
      -- Y             - Y coordinate to find the element
      -- RESULT
      -- Index of the nearest to Y visible element
      -- HISTORY
      -- 8.6.4 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Nearest
     (ListboxWidget: in Tk_ListBox; Y: in String) return String with
      Pre => Y /= "";
      -- ****

      -- ****f* ListBox/Scan_Mark
      -- FUNCTION
      -- Sets starting position for scan in the selected Tk_ListBox
      -- PARAMETERS
      -- ListboxWidget - Tk_ListBox in which mark will be set
      -- X             - X coordinate of the mark to set
      -- Y             - Y coordinate of the mark to set
      -- HISTORY
      -- 8.6.4 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   procedure Scan_Mark(ListboxWidget: in Tk_ListBox; X, Y: in String) with
      Pre => X /= "" and Y /= "";
      -- ****

      -- ****f* ListBox/Scan_DragTo
      -- FUNCTION
      -- Computes the difference between its X and Y arguments and the X and Y
      -- arguments to the last Scan_Mark procedure for the Tk_ListBox. It then
      -- adjusts the view by 10 times the difference in coordinates.
      -- PARAMETERS
      -- ListboxWidget - Tk_ListBox in which difference will be computed
      -- X             - X coordinate which difference will be computed
      -- Y             - Y coordinate which difference will be computed
      -- HISTORY
      -- 8.6.4 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   procedure Scan_DragTo(ListboxWidget: in Tk_ListBox; X, Y: in String) with
      Pre => X /= "" and Y /= "";
      -- ****

      -- ****f* ListBox/See
      -- FUNCTION
      -- Make the selected element of the selected Tk_ListBox visible. If the
      -- element is visible, this procedure do nothing.
      -- PARAMETERS
      -- ListboxWidget - Tk_ListBox in which the selected element will be
      --                 visible
      -- Index         - Index of the element to make visible
      -- HISTORY
      -- 8.6.4 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   procedure See(ListboxWidget: in Tk_ListBox; Index: in String) with
      Pre => Index /= "";
      -- ****

      -- ****f* ListBox/Selection_Anchor
      -- FUNCTION
      -- Set the selection anchor to the selected element in the selected
      -- Tk_ListBox
      -- PARAMETERS
      -- ListboxWidget - Tk_ListBox in which anchor will be set
      -- Index         - Index of the element on which anchor will be set. If
      --                 item doesn't exists, the anchor will be set to the
      --                 closest item
      -- HISTORY
      -- 8.6.4 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   procedure Selection_Anchor
     (ListboxWidget: in Tk_ListBox; Index: in String) with
      Pre => Index /= "";
      -- ****

      -- ****f* ListBox/Selection_Clear
      -- FUNCTION
      -- Deselect elements in the Tk_ListBox between First and Last indexes
      -- PARAMETERS
      -- ListboxWidget - Tk_ListBox in which selection will be removed
      -- First         - Index of the first element to deselect
      -- Last          - Index of the last element to deselect. If empty,
      --                 deselect only one element. Default value is empty
      -- HISTORY
      -- 8.6.4 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   procedure Selection_Clear
     (ListboxWidget: in Tk_ListBox; First: in String;
      Last: in String := "") with
      Pre => First /= "";
      -- ****

      -- ****f* ListBox/Selection_Includes
      -- FUNCTION
      -- Check if the selected element is in the selection in the selected
      -- Tk_ListBox
      -- PARAMETERS
      -- ListboxWidget - Tk_ListBox in which the selection will be queried
      -- Index         - Index of the element to check if is in the selection
      -- RESULT
      -- 1 if the selected element is in the selection, otherwise 0
      -- HISTORY
      -- 8.6.4 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Selection_Includes
     (ListboxWidget: in Tk_ListBox; Index: in String) return String with
      Pre => Index /= "";
      -- ****

      -- ****f* ListBox/Selection_Set
      -- FUNCTION
      -- Add the selected elements to the Tk_ListBox selection
      -- PARAMETERS
      -- ListboxWidget - Tk_ListBox in which the elements will be added to
      --                 the selection
      -- First         - Index of the first element to add
      -- Last          - Index of the last element to add. If empty, add only
      --                 one element. Default value is empty
      -- HISTORY
      -- 8.6.4 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   procedure Selection_Set
     (ListboxWidget: in Tk_ListBox; First: in String;
      Last: in String := "") with
      Pre => First /= "";
      -- ****

      -- ****f* ListBox/Size
      -- FUNCTION
      -- Get amount of the elements in the selected Tk_ListBox
      -- PARAMETERS
      -- ListboxWidget - Tk_ListBox which will be queried for the elements
      -- RESULT
      -- Amount of the elements in the ListboxWidget
      -- HISTORY
      -- 8.6.4 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Size(ListboxWidget: in Tk_ListBox) return String;
   -- ****

   -- ****f* ListBox/XView (function)
   -- FUNCTION
   -- Get which horizontal fraction of the Tk_ListBox is visible
   -- PARAMETERS
   -- ListboxWidget - Tk_ListBox which will be queried for visibility
   -- RESULT
   -- Pair of elements: first element is the start of horizontal fraction of
   -- the ListboxWidget which is visible, second is the end of horizontal
   -- fraction of the ListboxWidget which is visible.
   -- HISTORY
   -- 8.6.4 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   function XView(ListboxWidget: in Tk_ListBox) return String;
   -- ****

   -- ****f* ListBox/XView (procedure)
   -- FUNCTION
   -- Adjusts the view in the window so that the character position given by
   -- index is displayed at the left edge of the window
   -- PARAMETERS
   -- ListboxWidget - Tk_ListBox which will be adjusted
   -- Index         - Character index to which ListboxWidget will be adjusted.
   --                 Character position starts from 0
   -- HISTORY
   -- 8.6.4 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   procedure XView(ListboxWidget: in Tk_ListBox; Index: in String) with
      Pre => Index /= "";
      -- ****

   -- ****f* ListBox/Xview_Move_To
   -- FUNCTION
   -- Adjusts the view in the window so that fraction of the total width of
   -- the Tk_ListBox is off-screen to the left.
   -- PARAMETERS
   -- ListboxWidget - Tk_ListBox which view will be adjusted
   -- Fraction      - Fraction of the CanvasWidget to move. Must be between 0
      --                 and 1
      -- HISTORY
      -- 8.6.4 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   procedure Xview_Move_To
     (ListboxWidget: in Tk_ListBox; Fraction: in String) with
      Pre => Fraction /= "";
      -- ****

      -- ****f* ListBox/Xview_Scroll
      -- FUNCTION
      -- Shift the view in the window on left or right according to Number and
      -- What.
      -- PARAMETERS
      -- ListboxWidget - Tk_ListBox which view will be shifted
      -- Number        - The amount of What to shift the CanvasWidget
      -- What          - Type of amount to move. Can be "units" or "pages"
      -- HISTORY
      -- 8.6.4 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   procedure Xview_Scroll
     (ListboxWidget: in Tk_ListBox; Number, What: in String) with
      Pre => Number /= "" and (What = "units" or What = "pages");
      -- ****

   -- ****f* ListBox/YView (function)
   -- FUNCTION
   -- Get which vertical fraction of the Tk_ListBox is visible
   -- PARAMETERS
   -- ListboxWidget - Tk_ListBox which will be queried for visibility
   -- RESULT
   -- Pair of elements: first element is the start of vertical fraction of
   -- the ListboxWidget which is visible, second is the end of vertical
   -- fraction of the ListboxWidget which is visible.
   -- HISTORY
   -- 8.6.4 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   function YView(ListboxWidget: in Tk_ListBox) return String;
   -- ****

   -- ****f* ListBox/YView (procedure)
   -- FUNCTION
   -- Adjusts the view in the window so that the character position given by
   -- index is displayed at the top edge of the window
   -- PARAMETERS
   -- ListboxWidget - Tk_ListBox which will be adjusted
   -- Index         - Character index to which ListboxWidget will be adjusted.
   --                 Character position starts from 0
   -- HISTORY
   -- 8.6.4 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   procedure YView(ListboxWidget: in Tk_ListBox; Index: in String) with
      Pre => Index /= "";
      -- ****

private

   type Tk_ListBox is new Tk_Widget with null record;

end Tcl.Tk.Ada.Widgets.ListBox;

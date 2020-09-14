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

   -- ****f* ListBox/Create (function)
   -- FUNCTION
   -- Creates a new Tk_ListBox in the specified interpreter.
   -- PARAMETERS
   -- pathName - Tk path (starts with dot) for the widget
   -- options  - Options which will be passed to the widget. Default value is
   --            empty
   -- Interp   - Tcl interpreter to which the widget will be created. If null,
   --            the widget will be created in the "contextual" interpreter.
   --            Default value is null.
   -- RESULT
   -- Newly created Tk_ListBox
   -- HISTORY
   -- 8.6.2 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- EXAMPLE
   -- -- Create a new listbox with pathname .mylistbox
   -- My_Listbox: constant Tk_ListBox := Create(".mylistbox");
   -- COMMANDS
   -- listbox pathName ?options?
   -- SEE ALSO
   -- Create (procedure)
   -- SOURCE
   overriding function Create
     (pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) return Tk_ListBox with
      Pre => pathName /= "";
     -- ****

     -- ****f* ListBox/Create (procedure)
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
     -- HISTORY
     -- 8.6.2 - Added
     -- TODO
     -- Replace it with higher level of binding
     -- EXAMPLE
     -- -- Create listbox My_Listbox with pathname .mylistbox and with black background on the current Tcl interpreter
     -- declare
     --    My_Listbox: Tk_Listbox;
     -- begin
     --    Create(My_Listbox, ".mylistbox", "-background black");
     -- end;
     -- COMMANDS
     -- listbox pathName ?options?
     -- SEE ALSO
     -- Create (function)
     -- SOURCE
   overriding procedure Create
     (Widgt: out Tk_ListBox; pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) with
      Pre => pathName /= "";
     -- ****

     -- ****f* ListBox/Get_Widget
     -- FUNCTION
     -- Get the existing Tk_ListBox widget
     -- PARAMETERS
     -- pathName - Tk path (starts with dot) for the widget
     -- Interp   - Tcl interpreter on which the widget exists. Can be empty.
     --            Default value is current Tcl interpreter
     -- RESULT
     -- Existing Tk_ListBox widget
     -- HISTORY
     -- 8.6.9 - Added
     -- EXAMPLE
     -- -- Get listbox widget with name .mylist on the current Tcl interpreter
     -- My_ListBox: constant Tk_ListBox := Get_Widget(".mylist");
     -- SOURCE
   overriding function Get_Widget
     (pathName: in String; Interp: in Tcl_Interp := Get_Context)
      return Tk_ListBox;
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
     -- EXAMPLE
     -- -- Set second element as active in My_Listbox
     -- Activate(My_Listbox, "1");
     -- COMMANDS
     -- ListboxWidget activate index
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
      -- EXAMPLE
      -- -- Get the bounding box of My_Listbox listbox for third element
      -- Bounding_Box: constant String := BBox(My_Listbox, "2");
      -- COMMANDS
      -- ListboxWidget bbox index
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
      -- EXAMPLE
      -- -- Get the current seelction in My_Listbox listbox
      -- Selection: constant String := CurSelection(My_Listbox);
      -- COMMANDS
      -- ListboxWidget curselection
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
   -- EXAMPLE
   -- -- Delete second item from My_Listbox listbox
   -- Delete(My_Listbox, "1");
   -- COMMANDS
   -- ListboxWidget delete first ?last?
   -- SOURCE
   procedure Delete
     (ListboxWidget: in Tk_ListBox; First: in String;
      Last: in String := "") with
      Pre => First /= "";
      -- ****

      -- ****f* ListBox/Get
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
      -- EXAMPLE
      -- -- Get the content of the second and third element in My_Listbox listbox
      -- Elements: constant String := Get(My_Listbox, "1", "2");
      -- COMMANDS
      -- ListboxWidget get first ?last?
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
      -- EXAMPLE
      -- -- Get the index of the active element in My_Listbox listbox
      -- ActiveIndex: constant String := Index(My_Listbox, "active");
      -- COMMANDS
      -- ListboxWidget index index
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
      -- EXAMPLE
      -- -- Insert elements one and two elements at the end of the My_Listbox listbox
      -- Insert(My_Listbox, "end", "one two");
      -- COMMANDS
      -- ListboxWidget insert index ?elements?
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
      -- EXAMPLE
      -- -- Get the background color of the second element in My_Listbox listbox
      -- Options := constant String := Item_Cget(My_Listbox, "1", "-background");
      -- COMMANDS
      -- ListboxWidget itemcget index option
      -- SOURCE
   function Item_Cget
     (ListboxWidget: in Tk_ListBox; Index, Option: in String)
      return String with
      Pre => Index /= "" and Option /= "";
      -- ****

      -- ****f* ListBox/Item_Configure (procedure)
      -- FUNCTION
      -- Modifies the configuration options of the selected item
      -- PARAMETERS
      -- ListBoxWidget - Tk_ListBox which will be modified for options
      -- Index         - Index of the item which options will be modified
      -- Options       - Options to modify.
      -- HISTORY
      -- 8.6.4 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- EXAMPLE
      -- -- Set the background color of the third item in the My_Listbox listbox to green
      -- Item_Configure(My_Listbox, "2", "-background green");
      -- COMMANDS
      -- ListBoxWidget itemconfigure index options
      -- SEE ALSO
      -- Item_Configure (function)
      -- SOURCE
   procedure Item_Configure
     (ListBoxWidget: in Tk_ListBox; Index, Options: in String) with
      Pre => Index /= "" and Options /= "";
      -- ****

      -- ****f* ListBox/Item_Configure (function)
      -- FUNCTION
      -- Queries or modifies the configuration options of the selected item
      -- PARAMETERS
      -- ListBoxWidget - Tk_ListBox which will be queried or modified for options
      -- Index         - Index of the item which will be queried or modified
      --                 for options
      -- Options       - Options to modify or get. Can be empty. Default value
      --                 is empty
      -- RESULT
      -- If Options is empty, return all available options and their values for
      -- the selected item. Otherwise, return selected option's value for the
      -- selected item
      -- HISTORY
      -- 8.6.4 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- EXAMPLE
      -- -- Get the all options of the last element in the My_Listbox listbox
      -- Options: constant String := Item_Configure(My_Listbox, "end");
      -- COMMANDS
      -- ListBoxWidget itemconfigure index ?options?
      -- SEE ALSO
      -- Item_Configure (procedure)
      -- SOURCE
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
      -- EXAMPLE
      -- -- Get the index of the element at 10px in My_Listbox listbox
      -- Index := constant String := Nearest(My_Listbox, "10");
      -- COMMANDS
      -- ListboxWidget nearest y
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
      -- EXAMPLE
      -- -- Set the starting point for scan at point (10, 24) in My_Listbox listbox
      -- Scan_Mark(My_Listbox, "10", "24");
      -- COMMANDS
      -- ListboxWidget scan mark x y
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
      -- EXAMPLE
      -- -- Adjust the view of My_Listbox listbox to point (12, 84)
      -- Scan_DragTo(My_Listbox, "12", "84");
      -- COMMANDS
      -- ListboxWidget scan dragto x y
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
      -- EXAMPLE
      -- -- Make visible third element in My_Listbox listbox
      -- See(My_Listbox, "2");
      -- COMMANDS
      -- ListboxWidget see index
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
      -- EXAMPLE
      -- -- Set the selection anchor to the active element at the My_Listbox listbox
      -- Selection_Anchor(My_Listbox, "active");
      -- COMMANDS
      -- ListboxWidget selection anchor index
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
      -- EXAMPLE
      -- -- Deselect first element in My_Listbox listbox
      -- Selection_Clear(My_Listbox, "0");
      -- COMMANDS
      -- ListboxWidget selection clear first ?last?
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
      -- EXAMPLE
      -- -- Check if second element in My_Listbox listbox is selected
      -- Is_Selected: constant String := Selection_Includes(My_Listbox, "1");
      -- COMMANDS
      -- ListboxWidget selection includes index
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
      -- EXAMPLE
      -- -- Select all elements in the My_Listbox listbox
      -- Selection_Set(My_Listbox, "0", "end");
      -- COMMANDS
      -- ListboxWidget selection set first ?last?
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
      -- EXAMPLE
      -- -- Get the amount of the elements in the My_Listbox listbox
      -- Elements: constant String := Size(My_Listbox);
      -- COMMANDS
      -- ListboxWidget size
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
   -- EXAMPLE
   -- -- Get the horizontal fraction of the My_Listbox listbox
   -- Horizontal_Fraction: constant String := XView(My_Listbox);
   -- COMMANDS
   -- ListboxWidget xview
   -- SEE ALSO
   -- YView (function), XView (procedure), YView (procedure)
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
   -- EXAMPLE
   -- -- Adjust the view in the My_Listbox listbox to second character index
   -- XView(My_Listbox, "1");
   -- COMMANDS
   -- ListboxWidget xview index
   -- SEE ALSO
   -- YView (function), XView (function), YView (procedure)
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
      -- Fraction      - Fraction of the ListboxWidget to move. Must be between 0
      --                 and 1
      -- HISTORY
      -- 8.6.4 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- EXAMPLE
      -- -- Show the first half of the listbox My_Listbox
      -- Xview_Move_To(My_Listbox, "0.5");
      -- COMMANDS
      -- ListboxWidget xview moveto fraction
      -- SEE ALSO
      -- Yview_Move_To
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
      -- Number        - The amount of What to shift the ListboxWidget
      -- What          - Type of amount to move. Can be "units" or "pages"
      -- HISTORY
      -- 8.6.4 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- EXAMPLE
      -- -- Move the view in the My_Listbox listbox by 10 units to right
      -- Xview_Scroll(My_Listbox, "10", "units");
      -- COMMANDS
      -- ListboxWidget xview scroll number what
      -- SEE ALSO
      -- Yview_Scroll
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
      -- EXAMPLE
      -- -- Get the vertical fraction of the My_Listbox listbox
      -- Vertical_Fraction: constant String := YView(My_Listbox);
      -- COMMANDS
      -- ListboxWidget yview
      -- SEE ALSO
      -- YView (procedure), XView (function), XView (procedure)
      -- SOURCE
   function YView(ListboxWidget: in Tk_ListBox) return String;
   -- ****

   -- ****f* ListBox/YView (procedure)
   -- FUNCTION
   -- Adjusts the view in the window so that the element given by index is
   -- displayed at the top edge of the window
   -- PARAMETERS
   -- ListboxWidget - Tk_ListBox which will be adjusted
   -- Index         - Element index to which ListboxWidget will be adjusted.
   --                 Element position starts from 0
   -- HISTORY
   -- 8.6.4 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- EXAMPLE
   -- -- Adjust the view in the My_Listbox listbox to show the first element
   -- YView(My_Listbox, "0");
   -- COMMANDS
   -- ListboxWidget yview index
   -- SEE ALSO
   -- XView (procedure), XView (function), YView (procedure)
   -- SOURCE
   procedure YView(ListboxWidget: in Tk_ListBox; Index: in String) with
      Pre => Index /= "";
      -- ****

      -- ****f* ListBox/Yview_Move_To
      -- FUNCTION
      -- Adjusts the view in the window so that fraction of the total height of
      -- the Tk_ListBox is off-screen to the top.
      -- PARAMETERS
      -- ListboxWidget - Tk_ListBox which view will be adjusted
      -- Fraction      - Fraction of the ListboxWidget to move. Must be between 0
      --                 and 1
      -- HISTORY
      -- 8.6.4 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- EXAMPLE
      -- -- Show the first half of the listbox My_Listbox
      -- Yview_Move_To(My_Listbox, "0.5");
      -- COMMANDS
      -- ListboxWidget yview moveto fraction
      -- SEE ALSO
      -- Xview_Move_To
      -- SOURCE
   procedure Yview_Move_To
     (ListboxWidget: in Tk_ListBox; Fraction: in String) with
      Pre => Fraction /= "";
      -- ****

      -- ****f* ListBox/Yview_Scroll
      -- FUNCTION
      -- Shift the view in the window on up or down according to Number and
      -- What.
      -- PARAMETERS
      -- ListboxWidget - Tk_ListBox which view will be shifted
      -- Number        - The amount of What to shift the ListboxWidget
      -- What          - Type of amount to move. Can be "units" or "pages"
      -- HISTORY
      -- 8.6.4 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- EXAMPLE
      -- -- Move the view in the My_Listbox listbox by 10 units to top
      -- Yview_Scroll(My_Listbox, "-10", "units");
      -- COMMANDS
      -- ListboxWidget yview scroll number what
      -- SEE ALSO
      -- Xview_Scroll
      -- SOURCE
   procedure Yview_Scroll
     (ListboxWidget: in Tk_ListBox; Number, What: in String) with
      Pre => Number /= "" and (What = "units" or What = "pages");
      -- ****

private

   type Tk_ListBox is new Tk_Widget with null record;

end Tcl.Tk.Ada.Widgets.ListBox;

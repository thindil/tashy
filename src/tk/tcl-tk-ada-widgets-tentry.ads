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

-- ****h* Widgets/TEntry
-- FUNCTION
-- Provides code for manipulate Tk widget Entry
-- SOURCE
package Tcl.Tk.Ada.Widgets.TEntry is
-- ****

   -- ****t* TEntry/Tk_Entry
   -- FUNCTION
   -- This is a non-abstract type derived directly from Tk_Widget.
   -- Each of the derived widgets redefines the Create subprogram
   -- in order to create the correct type of widget.
   -- SOURCE
   type Tk_Entry is new Tk_Widget with private;
   -- ****

   -- ****f* TEntry/Create (function)
   -- Creates a new Tk_Entry in the specified interpreter.
   -- PARAMETERS
   -- pathName - Tk path (starts with dot) for the widget
   -- options  - Options which will be passed to the widget. Default value is
   --            empty
   -- Interp   - Tcl interpreter to which the widget will be created. If null,
   --            the widget will be created in the "contextual" interpreter.
   --            Default value is null.
   -- RESULT
   -- Newly created Tk_Entry
   -- HISTORY
   -- 8.6.1 - Moved from Tcl.Tk.Ada.Widgets
   -- TODO
   -- Replace it with higher level of binding
   -- EXAMPLE
   -- -- Create a new tentry with pathname .myentry and width of 10 characters
   -- My_Entry: constant Tk_Entry := Create(".myentry", "-width 10");
   -- COMMANDS
   -- entry pathName ?options?
   -- SEE ALSO
   -- Create (procedure)
   -- SOURCE
   overriding function Create
     (pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) return Tk_Entry with
      Pre => pathName /= "";
     -- ****

     -- ****f* TEntry/Create (procedure)
     -- Creates a new Tk_Entry in the specified interpreter.
     -- PARAMETERS
     -- Widgt    - Tk_Entry which will be created
     -- pathName - Tk path (starts with dot) for the widget
     -- options  - Options which will be passed to the widget. Default value is
     --            empty
     -- Interp   - Tcl interpreter to which the widget will be created. If null,
     --            the widget will be created in the "contextual" interpreter.
     --            Default value is null.
     -- HISTORY
     -- 8.6.1 - Moved from Tcl.Tk.Ada.Widgets
     -- TODO
     -- Replace it with higher level of binding
     -- EXAMPLE
     -- -- Create tentry My_Entry with pathname .myentry and state readonly on the current Tcl interpreter
     -- declare
     --    My_Entry: Tk_Entry;
     -- begin
     --    Create(My_Entry, ".myentry", "-state readonly");
     -- end;
     -- COMMANDS
     -- entry pathName ?options?
     -- SEE ALSO
     -- Create (function)
     -- SOURCE
   overriding procedure Create
     (Widgt: out Tk_Entry; pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) with
      Pre => pathName /= "";
     -- ****

     -- ****f* TEntry/Get_Widget
     -- FUNCTION
     -- Get the existing Tk_Entry widget
     -- PARAMETERS
     -- pathName - Tk path (starts with dot) for the widget
     -- Interp   - Tcl interpreter on which the widget exists. Can be empty.
     --            Default value is current Tcl interpreter
     -- RESULT
     -- Existing Tk_Entry widget
     -- HISTORY
     -- 8.6.9 - Added
     -- EXAMPLE
     -- -- Get entry widget with name .myentry on the current Tcl interpreter
     -- My_Entry: constant Tk_Entry := Get_Widget(".myentry");
     -- SOURCE
   overriding function Get_Widget
     (pathName: in String; Interp: in Tcl_Interp := Get_Context)
      return Tk_Entry;
     -- ****

     -- ****f* TEntry/BBox
     -- FUNCTION
     -- Get size of bounding box of the selected character in the selected
     -- Tk_Entry
     -- PARAMETERS
     -- EntryWidget - Tk_Entry which will be queried
     -- Index       - Index of the character which bounding box will be
     -- taken
     -- RESULT
     -- Four values: x1, y1 - coordinates of starting point of bounding box
     -- from top left, x2, y2 - coordinates of ending point from bottom right
     -- of bounding box.
     -- HISTORY
     -- 8.6.5 - Added
     -- TODO
     -- Replace it with higher level of binding
     -- EXAMPLE
     -- -- Get the bounding box of the whole My_Entry entry
     -- Coords: constant String := BBox(My_Entry, "all");
     -- COMMANDS
     -- TextEntry bbox index
     -- SOURCE
   function BBox
     (TextEntry: in Tk_Entry'Class; Index: in String) return String with
      Pre => Index /= "";
      -- ****

      -- ****f* TEntry/Delete
      -- FUNCTION
      -- Delete part of text from the selected entry
      -- PARAMETERS
      -- TextEntry  - Tk_Entry in which text will be deleted
      -- FirstIndex - Index of text from which delete will start. Index starts from 0
      -- LastIndex  - End index to which text will be deleted. If empty, delete only one
      --              character. Default is empty.
      -- HISTORY
      -- 8.6.2 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- EXAMPLE
      -- -- Delete second character from My_Entry entry
      -- Delete(My_Entry, "1");
      -- COMMANDS
      -- TextEntry delete first ?last?
      -- SOURCE
   procedure Delete
     (TextEntry: in Tk_Entry'Class; FirstIndex: in String;
      LastIndex: in String := "") with
      Pre => FirstIndex /= "";
      -- ****

      -- ****f* TEntry/Get
      -- FUNCTION
      -- Get entry's text.
      -- PARAMETERS
      -- Widgt - Tk_Entry from which text will be taken
      -- RESULT
      -- Returns the entry's string.
      -- HISTORY
      -- 8.6.1 - Moved from Tcl.Tk.Ada.Widgets
      -- TODO
      -- Replace it with higher level of binding
      -- EXAMPLE
      -- -- Get the text of My_Entry entry
      -- Text: constant String := Get(My_Entry);
      -- COMMANDS
      -- Widgt get
      -- SOURCE
   function Get(Widgt: in Tk_Entry'Class) return String;
   -- ****

   -- ****f* TEntry/ICursor
   -- FUNCTION
   -- Place insertion cursor in the selected Tk_Entry just before the
   -- selected character
   -- PARAMETERS
   -- TextEntry - Tk_Entry in which insertion cursor will be placed
   -- Index     - Index of the character before which insertion cursor will be
   --             placed
   -- HISTORY
   -- 8.6.5 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- EXAMPLE
   -- -- Place the insertion cursor in My_Entry entry at start
   -- ICursor(My_Entry, "0");
   -- COMMANDS
   -- TextEntry icursor index
   -- SOURCE
   procedure ICursor(TextEntry: in Tk_Entry'Class; Index: in String) with
      Pre => Index /= "";
      -- ****

      -- ****f* TEntry/Entry_Index
      -- FUNCTION
      -- Get numerical index of character from the selected Index
      -- PARAMETERS
      -- TextEntry - Tk_Entry which will be queried for index
      -- Index     - Index of character which numeric index will be taken
      -- RESULT
      -- Numerical index of the selected character
      -- HISTORY
      -- 8.6.5 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- -- Get the numerical index of the last character in My_Entry entry
      -- Index: constant String := Entry_Index(My_Entry, "end");
      -- COMMANDS
      -- TextEntry index index
      -- SOURCE
   function Entry_Index
     (TextEntry: in Tk_Entry'Class; Index: in String) return String with
      Pre => Index /= "";
      -- ****

      -- ****f* TEntry/Insert
      -- FUNCTION
      -- Insert text at selected index to the selected Tk_Entry
      -- PARAMETERS
      -- TextEntry - Tk_Entry to which text will be inserted
      -- Index     - Index in which position text will be inserted
      -- Text      - Text to insert
      -- HISTORY
      -- 8.6.2 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- -- Insert hello world text at the end of the My_Entry entry current text
      -- Insert(My_Entry, "end", "{hello world}");
      -- COMMANDS
      -- TextEntry insert index text
      -- SOURCE
   procedure Insert
     (TextEntry: in Tk_Entry'Class; Index: in String; Text: in String) with
      Pre => Index /= "" and Text /= "";
      -- ****

      -- ****f* TEntry/Scan_Mark
      -- FUNCTION
      -- Sets starting position for scan in the selected Tk_Entry
      -- PARAMETERS
      -- TextEntry - Tk_Entry in which mark will be set
      -- X         - X coordinate of the mark to set
      -- HISTORY
      -- 8.6.5 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- EXAMPLE
      -- -- Set the starting position for scan in My_Entry entry to X coordinate 18
      -- Scan_Mark(My_Entry, "18");
      -- COMMANDS
      -- TextEntry scan mark x
      -- SOURCE
   procedure Scan_Mark(TextEntry: in Tk_Entry'Class; X: in String) with
      Pre => X /= "";
      -- ****

      -- ****f* TEntry/Scan_DragTo
      -- FUNCTION
      -- Computes the difference between its X argument and the X argument to
      -- the last Scan_Mark procedure for the Tk_Entry. It then adjusts the
      -- view by 10 times the difference in coordinates.
      -- PARAMETERS
      -- TextEntry - Tk_Entry in which difference will be computed
      -- X         - X coordinate which difference will be computed
      -- HISTORY
      -- 8.6.5 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- EXAMPLE
      -- -- Drag view of My_Entry entry to X coordinate 24
      -- Scan_DragTo(My_Entry, "24");
      -- COMMANDS
      -- TextEntry scan dragto x
      -- SOURCE
   procedure Scan_DragTo(TextEntry: in Tk_Entry'Class; X: in String) with
      Pre => X /= "";
      -- ****

      -- ****f* TEntry/Selection_Adjust
      -- FUNCTION
      -- Add characters to the Tk_Entry selection. If nothing is selected,
      -- create a new selection from the beginning to the selected by Index
      -- character
      -- PARAMETERS
      -- TextEntry - Tk_Entry in which selection will be adjusted
      -- Index     - Index of character to set as the last in the
      --             selection
      -- HISTORY
      -- 8.6.5 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- EXAMPLE
      -- -- Add second character in My_Entry entry to the selection
      -- Selection_Adjust(My_Entry, "1");
      -- COMMANDS
      -- TextEntry selection adjust index
      -- SOURCE
   procedure Selection_Adjust
     (TextEntry: in Tk_Entry'Class; Index: in String) with
      Pre => Index /= "";
      -- ****

      -- ****f* TEntry/Selection_Clear
      -- FUNCTION
      -- Remove the selection from the selected Tk_Entry
      -- PARAMETERS
      -- TextEntry - Tk_Entry in which the selection will be cleared
      -- HISTORY
      -- 8.6.5 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- EXAMPLE
      -- -- Remove the selection from My_Entry entry
      -- Selection_Clear(My_Entry);
      -- COMMANDS
      -- TextEntry selection clear
      -- SOURCE
   procedure Selection_Clear(TextEntry: in Tk_Entry'Class);
   -- ****

   -- ****f* TEntry/Selection_From
   -- FUNCTION
   -- Set the selection anchor at the selected character in the selected
   -- Tk_Entry. Does not change the selection
   -- PARAMETERS
   -- TextEntry - Tk_Entry in which the selection anchor will be set
   -- Index     - Index of the character before which the selection anchor
   --             will be set
   -- HISTORY
   -- 8.6.5 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- EXAMPLE
   -- -- Set the selection anchor to the 10th character in My_Entry entry
   -- Selection_From(My_Entry, "9");
   -- COMMANDS
   -- TextEntry selection from index
   -- SOURCE
   procedure Selection_From
     (TextEntry: in Tk_Entry'Class; Index: in String) with
      Pre => Index /= "";
      -- ****

      -- ****f* TEntry/Selection_Present
      -- FUNCTION
      -- Check if any character is selected in the selected Tk_Entry
      -- PARAMETERS
      -- TextEntry - Tk_Entry which will be queried for the selection
      -- RESULT
      -- "1" if any character in TextEntry is selected, otherwise "0"
      -- HISTORY
      -- 8.6.5 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- EXAMPLE
      -- -- Check if any character is selected in My_Entry entry
      -- Is_Selected: constant String := Selection_Present(My_Entry);
      -- COMMANDS
      -- TextEntry selection present
      -- SOURCE
   function Selection_Present(TextEntry: in Tk_Entry'Class) return String;
   -- ****

   -- ****f* TEntry/Selection_Range
   -- FUNCTION
   -- Set the characters selection in the selected Tk_Entry
   -- PARAMETERS
   -- TextEntry  - Tk_Entry in which the selection will be set
   -- StartIndex - Start index of character of the selection
   -- EndIndex   - End index of character of the selection
   -- HISTORY
   -- 8.6.5 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- EXAMPLE
   -- -- Set the selection in My_Entry entry from first character to 5th
   -- Selection_Range(My_Entry, "0", "4");
   -- COMMANDS
   -- TextEntry selection range startindex endindex
   -- SOURCE
   procedure Selection_Range
     (TextEntry: in Tk_Entry'Class; StartIndex, EndIndex: in String) with
      Pre => StartIndex /= "" and EndIndex /= "";
      -- ****

      -- ****f* TEntry/Selection_To
      -- FUNCTION
      -- Set selection in the selected Tk_Entry
      -- PARAMETERS
      -- TextEntry - Tk_Entry in which the selection will be set
      -- Index     - Index of character from which the selection will be set.
      --             If is before the selection anchor point, the selection
      --             will be to the anchor point. If after, the selection will
      --             be from the anchor point to the Index
      -- HISTORY
      -- 8.6.5 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- EXAMPLE
      -- -- Set the selection from anchor point to the last character in My_Entry
      -- Selection_To(My_Entry, "end");
      -- COMMANDS
      -- TextEntry selection to index
      -- SOURCE
   procedure Selection_To(TextEntry: in Tk_Entry'Class; Index: in String) with
      Pre => Index /= "";
      -- ****

      -- ****f* TEntry/Validate
      -- FUNCTION
      -- Force the Tk_Entry to revalidate its value
      -- PARAMETERS
      -- TextEntry - Tk_Entry which value will be validated
      -- RESULT
      -- "1" if value of TextEntry is valid, otherwise "0"
      -- HISTORY
      -- 8.6.5 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- EXAMPLE
      -- -- Revalidate value of My_Entry entry
      -- Valid: constant String := Validate(My_Entry);
      -- COMMANDS
      -- TextEntry validate
      -- SOURCE
   function Validate(TextEntry: in Tk_Entry'Class) return String;
   -- ****

   -- ****f* TEntry/XView (function)
   -- FUNCTION
   -- Get which horizontal fraction of the Tk_Entry is visible
   -- PARAMETERS
   -- TextEntry - Tk_Entry which will be queried for visibility
   -- RESULT
   -- Pair of elements: first element is the start of horizontal fraction of
   -- the TextEntry which is visible, second is the end of horizontal
   -- fraction of the TextEntry which is visible.
   -- HISTORY
   -- 8.6.5 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- EXAMPLE
   -- -- Get the horizontal fraction of the My_Entry entry
   -- Horizontal_Fraction: constant String := XView(My_Entry);
   -- COMMANDS
   -- TextEntry xview
   -- SEE ALSO
   -- XView (procedure)
   -- SOURCE
   function XView(TextEntry: in Tk_Entry'Class) return String;
   -- ****

   -- ****f* TEntry/XView (procedure)
   -- FUNCTION
   -- Adjusts the view in the window so that the character position given by
   -- index is displayed at the left edge of the window
   -- PARAMETERS
   -- TextEntry - Tk_Entry which will be adjusted
   -- Index         - Character index to which TextEntry will be adjusted.
   --                 Character position starts from 0
   -- HISTORY
   -- 8.6.5 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- EXAMPLE
   -- -- Set view of My_Entry entry to second character
   -- XView(My_Entry, "1");
   -- COMMANDS
   -- TextEntry xview index
   -- SEE ALSO
   -- XView (function)
   -- SOURCE
   procedure XView(TextEntry: in Tk_Entry'Class; Index: in String) with
      Pre => Index /= "";
      -- ****

      -- ****f* TEntry/Xview_Move_To
      -- FUNCTION
      -- Adjusts the view in the window so that fraction of the total width of
      -- the Tk_Entry is off-screen to the left.
      -- PARAMETERS
      -- TextEntry - Tk_Entry which view will be adjusted
      -- Fraction      - Fraction of the TextEntry to move. Must be between 0
      --                 and 1
      -- HISTORY
      -- 8.6.5 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- EXAMPLE
      -- -- Show the first half of the entry My_Entry
      -- Xview_Move_To(My_Entry, "0.5");
      -- COMMANDS
      -- TextEntry xview moveto fraction
      -- SOURCE
   procedure Xview_Move_To
     (TextEntry: in Tk_Entry'Class; Fraction: in String) with
      Pre => Fraction /= "";
      -- ****

      -- ****f* TEntry/Xview_Scroll
      -- FUNCTION
      -- Shift the view in the window on left or right according to Number and
      -- What.
      -- PARAMETERS
      -- TextEntry - Tk_Entry which view will be shifted
      -- Number        - The amount of What to shift the TextEntry
      -- What          - Type of amount to move. Can be "units" or "pages"
      -- HISTORY
      -- 8.6.5 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- EXAMPLE
      -- -- Move the view in the My_Entry entry by 10 units to right
      -- Xview_Scroll(My_Entry, "10", "units");
      -- COMMANDS
      -- TextEntry xview scroll number what
      -- SOURCE
   procedure Xview_Scroll
     (TextEntry: in Tk_Entry'Class; Number, What: in String) with
      Pre => Number /= "" and (What = "units" or What = "pages");
      -- ****

private

   type Tk_Entry is new Tk_Widget with null record;

end Tcl.Tk.Ada.Widgets.TEntry;

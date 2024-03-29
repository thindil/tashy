-- Copyright (c) 2020-2021 Bartek thindil Jasicki <thindil@laeran.pl>
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

-- As a special exception, if other files instantiate generics from this
-- unit, or you link this unit with other files to produce an executable,
-- this unit does not by itself cause the resulting executable to be
-- covered by the GNU General Public License. This exception does not
-- however invalidate any other reasons why the executable file might be
-- covered by the GNU Public License.

-- ****h* Widgets/TtkEntry
-- FUNCTION
-- Provides code for manipulate Tk widget Entry
-- SOURCE
package Tcl.Tk.Ada.Widgets.TtkEntry with
   SPARK_Mode
is
   pragma Elaborate_Body;
-- ****

   -- ****t* TtkEntry/TtkEntry.Ttk_Entry
   -- FUNCTION
   -- This is a non-abstract type derived directly from Tk_Widget.
   -- Each of the derived widgets redefines the Create subprogram
   -- in order to create the correct type of widget.
   -- SOURCE
   type Ttk_Entry is new Tk_Widget with private;
   -- ****

   -- ****f* TtkEntry/TtkEntry.Create_(function)
   -- FUNCTION
   -- Creates a new Ttk_Entry in the specified interpreter.
   -- PARAMETERS
   -- pathName - Tk path (starts with dot) for the widget
   -- options  - Options which will be passed to the widget. Default value is
   --            empty
   -- Interp   - Tcl interpreter to which the widget will be created. If null,
   --            the widget will be created in the "contextual" interpreter.
   --            Default value is null.
   -- RESULT
   -- Newly created Ttk_Entry
   -- HISTORY
   -- 8.6.2 - Added
   -- EXAMPLE
   -- -- Create a new entry with pathname .myentry and state readonly
   -- My_Entry: constant Ttk_Entry := Create(".myentry", "-state readonly");
   -- COMMANDS
   -- ttk::entry pathName ?options?
   -- SEE ALSO
   -- TtkEntry.Create_(procedure)
   -- SOURCE
   overriding function Create
     (pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := Null_Interp) return Ttk_Entry with
      Global => null;
     -- ****

     -- ****f* TtkEntry/TtkEntry.Create_(procedure)
     -- FUNCTION
     -- Creates a new Ttk_Entry in the specified interpreter.
     -- PARAMETERS
     -- Widgt    - Ttk_Entry which will be created
     -- pathName - Tk path (starts with dot) for the widget
     -- options  - Options which will be passed to the widget. Default value is
     --            empty
     -- Interp   - Tcl interpreter to which the widget will be created. If null,
     --            the widget will be created in the "contextual" interpreter.
     --            Default value is null.
     -- OUTPUT
     -- Newly created Ttk_Entry as parameter Widgt
     -- HISTORY
     -- 8.6.2 - Added
     -- EXAMPLE
     -- -- Create entry My_Entry with pathname .myentry and width 10 characters on the current Tcl interpreter
     -- declare
     --    My_Entry: Ttk_Entry;
     -- begin
     --    Create(My_Entry, ".myentry", "-width 10");
     -- end;
     -- COMMANDS
     -- ttk::entry pathName ?options?
     -- SEE ALSO
     -- TtkEntry.Create_(function)
     -- SOURCE
   overriding procedure Create
     (Widgt: out Ttk_Entry; pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := Null_Interp) with
      Global => null;
      -- ****

     -- ****f* TtkEntry/TtkEntry.Get_Widget
     -- FUNCTION
     -- Get the existing Ttk_Entry widget
     -- PARAMETERS
     -- pathName - Tk path (starts with dot) for the widget
     -- Interp   - Tcl interpreter on which the widget exists. Can be empty.
     --            Default value is current Tcl interpreter
     -- RESULT
     -- Existing Ttk_Entry widget
     -- HISTORY
     -- 8.6.9 - Added
     -- EXAMPLE
     -- -- Get entry widget with name .myentry on the current Tcl interpreter
     -- My_Entry: constant Ttk_Entry := Get_Widget(".myentry");
     -- SOURCE
   overriding function Get_Widget
     (pathName: in String; Interp: in Tcl_Interp := Get_Context)
      return Ttk_Entry with
      Global => null;
     -- ****

      -- ****f* TtkEntry/TtkEntry.BBox
      -- FUNCTION
      -- Get size of bounding box of the selected character in the selected
      -- Ttk_Entry
      -- PARAMETERS
      -- EntryWidget - Ttk_Entry which will be queried
      -- Index       - Index of the character which bounding box will be
      -- taken
      -- RESULT
      -- Four values: x1, y1 - coordinates of starting point of bounding box
      -- from top left, x2, y2 - coordinates of ending point from bottom right
      -- of bounding box.
      -- HISTORY
      -- 8.6.5 - Added
      -- EXAMPLE
      -- -- Get the bouding box for the first character in My_Entry entry
      -- Bounding_Box: constant String := BBox(My_Entry, "0");
      -- COMMANDS
      -- TextEntry bbox index
      -- SOURCE
   function BBox
     (TextEntry: in Ttk_Entry'Class; Index: in String) return String with
      Pre => Index /= "";
      -- ****

      -- ****f* TtkEntry/TtkEntry.Delete
      -- FUNCTION
      -- Delete part of text from the selected entry
      -- PARAMETERS
      -- TextEntry  - Ttk_Entry in which text will be deleted
      -- FirstIndex - Index of text from which delete will start. Index starts from 0
      -- LastIndex  - End index to which text will be deleted. If empty, delete only one
      --              character. Default is empty.
      -- HISTORY
      -- 8.6.3 - Added
      -- EXAMPLE
      -- -- Delete the whole text of My_Entry entry
      -- Delete(My_Entry, "0", "end");
      -- COMMANDS
      -- TextEntry delete first ?last?
      -- SOURCE
   procedure Delete
     (TextEntry: in Ttk_Entry; FirstIndex: in String;
      LastIndex: in String := "") with
      Pre'Class => FirstIndex /= "";
      -- ****

      -- ****f* TtkEntry/TtkEntry.Get
      -- FUNCTION
      -- Get entry's text.
      -- PARAMETERS
      -- Widgt - Ttk_Entry from which text will be taken
      -- RESULT
      -- Returns the entry's string.
      -- HISTORY
      -- 8.6.2 - Added
      -- EXAMPLE
      -- -- Get the text of My_Entry entry
      -- Text: constant String := Get(My_Entry);
      -- COMMANDS
      -- Widgt get
      -- SOURCE
   function Get(Widgt: in Ttk_Entry) return String;
   -- ****

   -- ****f* TtkEntry/TtkEntry.ICursor
   -- FUNCTION
   -- Place insertion cursor in the selected Ttk_Entry just before the
   -- selected character
   -- PARAMETERS
   -- TextEntry - Ttk_Entry in which insertion cursor will be placed
   -- Index     - Index of the character before which insertion cursor will be
   --             placed
   -- HISTORY
   -- 8.6.5 - Added
   -- EXAMPLE
   -- -- Place insertion cursor at the end of My_Entry entry
   -- ICursor(My_Entry, "end");
   -- COMMANDS
   -- TextEntry icursor index
   -- SOURCE
   procedure ICursor(TextEntry: in Ttk_Entry'Class; Index: in String) with
      Pre => Index /= "";
      -- ****

      -- ****f* TtkEntry/TtkEntry.Index
      -- FUNCTION
      -- Get numerical index of character from the selected Index
      -- PARAMETERS
      -- TextEntry - Ttk_Entry which will be queried for index
      -- Index     - Index of character which numeric index will be taken
      -- RESULT
      -- Numerical index of the selected character
      -- HISTORY
      -- 8.6.5 - Added
      -- EXAMPLE
      -- -- Get the index of the last character in My_Entry entry
      -- Character_Index: constant String := Index(My_Entry, "end");
      -- COMMANDS
      -- TextEntry index index
      -- SOURCE
   function Index
     (TextEntry: in Ttk_Entry'Class; Index: in String) return String with
      Pre => Index /= "";
      -- ****

      -- ****f* TtkEntry/TtkEntry.Insert
      -- FUNCTION
      -- Insert text at selected index to the selected Ttk_Entry
      -- PARAMETERS
      -- TextEntry - Ttk_Entry to which text will be inserted
      -- Index     - Index in which position text will be inserted
      -- Text      - Text to insert
      -- HISTORY
      -- 8.6.3 - Added
      -- EXAMPLE
      -- -- Insert hello world text at start of My_Entry entry
      -- Insert(My_Entry, "0", "{hello world}");
      -- COMMANDS
      -- TextEntry insert index text
      -- SOURCE
   procedure Insert
     (TextEntry: in Ttk_Entry; Index: in String; Text: in String) with
      Pre'Class => Index /= "" and Text /= "";
      -- ****

      -- ****f* TtkEntry/TtkEntry.Selection_Clear
      -- FUNCTION
      -- Remove the selection from the selected Ttk_Entry
      -- PARAMETERS
      -- TextEntry - Ttk_Entry in which the selection will be cleared
      -- HISTORY
      -- 8.6.5 - Added
      -- EXAMPLE
      -- -- Remove selection from My_Entry entry
      -- Selection_Clear(My_Entry);
      -- COMMANDS
      -- TextEntry selection clear
      -- SOURCE
   procedure Selection_Clear(TextEntry: in Ttk_Entry'Class);
   -- ****

   -- ****f* TtkEntry/TtkEntry.Selection_Present
   -- FUNCTION
   -- Check if any character is selected in the selected Ttk_Entry
   -- PARAMETERS
   -- TextEntry - Ttk_Entry which will be queried for the selection
   -- RESULT
   -- "1" if any character in TextEntry is selected, otherwise "0"
   -- HISTORY
   -- 8.6.5 - Added
   -- EXAMPLE
   -- -- Check if something is selected in My_Entry entry
   -- Check_Selection: constant String := Selection_Present(My_Entry);
   -- COMMANDS
   -- TextEntry selection present
   -- SOURCE
   function Selection_Present(TextEntry: in Ttk_Entry'Class) return String;
   -- ****

   -- ****f* TtkEntry/TtkEntry.Selection_Range
   -- FUNCTION
   -- Set the characters selection in the selected Ttk_Entry
   -- PARAMETERS
   -- TextEntry  - Ttk_Entry in which the selection will be set
   -- StartIndex - Start index of character of the selection
   -- EndIndex   - End index of character of the selection
   -- HISTORY
   -- 8.6.5 - Added
   -- EXAMPLE
   -- -- Select the whole text of My_Entry entry
   -- Selection_Range(My_Entry, "0", "end");
   -- COMMANDS
   -- TextEntry selection range startindex endindex
   -- SOURCE
   procedure Selection_Range
     (TextEntry: in Ttk_Entry'Class; StartIndex, EndIndex: in String) with
      Pre => StartIndex /= "" and EndIndex /= "";
      -- ****

      -- ****f* TtkEntry/TtkEntry.Validate
      -- FUNCTION
      -- Force the Ttk_Entry to revalidate its value
      -- PARAMETERS
      -- TextEntry - Ttk_Entry which value will be validated
      -- RESULT
      -- "1" if value of TextEntry is valid, otherwise "0"
      -- HISTORY
      -- 8.6.5 - Added
      -- EXAMPLE
      -- -- Revalidate My_Entry entry value
      -- Valid: constant String := Validate(My_Entry);
      -- COMMANDS
      -- TextEntry validate
      -- SOURCE
   function Validate(TextEntry: in Ttk_Entry'Class) return String;
   -- ****

   -- ****f* TtkEntry/TtkEntry.XView_(function)
   -- FUNCTION
   -- Get which horizontal fraction of the Ttk_Entry is visible
   -- PARAMETERS
   -- TextEntry - Ttk_Entry which will be queried for visibility
   -- RESULT
   -- Pair of elements: first element is the start of horizontal fraction of
   -- the TextEntry which is visible, second is the end of horizontal
   -- fraction of the TextEntry which is visible.
   -- HISTORY
   -- 8.6.5 - Added
   -- EXAMPLE
   -- -- Get the horizontal fraction of the My_Entry entry
   -- Horizontal_Fraction: constant String := XView(My_Entry);
   -- COMMANDS
   -- TextEntry xview
   -- SEE ALSO
   -- TtkEntry.XView_(procedure)
   -- SOURCE
   function XView(TextEntry: in Ttk_Entry'Class) return String;
   -- ****

   -- ****f* TtkEntry/TtkEntry.XView_(procedure)
   -- FUNCTION
   -- Adjusts the view in the window so that the character position given by
   -- index is displayed at the left edge of the window
   -- PARAMETERS
   -- TextEntry - Ttk_Entry which will be adjusted
   -- Index     - Character index to which TextEntry will be adjusted.
   --             Character position starts from 0
   -- HISTORY
   -- 8.6.5 - Added
   -- EXAMPLE
   -- -- Set view of My_Entry entry to second character
   -- XView(My_Entry, "1");
   -- COMMANDS
   -- TextEntry xview index
   -- SEE ALSO
   -- TtkEntry.XView_(function)
   -- SOURCE
   procedure XView(TextEntry: in Ttk_Entry'Class; Index: in String) with
      Pre => Index /= "";
      -- ****

      -- ****f* TtkEntry/TtkEntry.Xview_Move_To
      -- FUNCTION
      -- Adjusts the view in the window so that fraction of the total width of
      -- the Ttk_Entry is off-screen to the left.
      -- PARAMETERS
      -- TextEntry - Ttk_Entry which view will be adjusted
      -- Fraction  - Fraction of the TextEntry to move. Must be between 0
      --             and 1
      -- HISTORY
      -- 8.6.5 - Added
      -- EXAMPLE
      -- -- Show the first half of the entry My_Entry
      -- Xview_Move_To(My_Entry, "0.5");
      -- COMMANDS
      -- TextEntry xview moveto fraction
      -- SOURCE
   procedure Xview_Move_To
     (TextEntry: in Ttk_Entry'Class; Fraction: in String) with
      Pre => Fraction /= "";
      -- ****

      -- ****f* TtkEntry/TtkEntry.Xview_Scroll
      -- FUNCTION
      -- Shift the view in the window on left or right according to Number and
      -- What.
      -- PARAMETERS
      -- TextEntry - Ttk_Entry which view will be shifted
      -- Number    - The amount of What to shift the TextEntry
      -- What      - Type of amount to move. Can be "units" or "pages"
      -- HISTORY
      -- 8.6.5 - Added
      -- EXAMPLE
      -- -- Move the view in the My_Entry entry by 10 units to right
      -- Xview_Scroll(My_Entry, "10", "units");
      -- COMMANDS
      -- TextEntry xview scroll number what
      -- SOURCE
   procedure Xview_Scroll
     (TextEntry: in Ttk_Entry'Class; Number, What: in String) with
      Pre => Number /= "" and (What = "units" or What = "pages");
      -- ****

private

   type Ttk_Entry is new Tk_Widget with null record;

end Tcl.Tk.Ada.Widgets.TtkEntry;

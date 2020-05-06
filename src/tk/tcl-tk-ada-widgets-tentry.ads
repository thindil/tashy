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
      -- SOURCE
   overriding procedure Create
     (Widgt: out Tk_Entry; pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) with
      Pre => pathName /= "";
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
      -- SOURCE
   function BBox(TextEntry: in Tk_Entry; Index: in String) return String with
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
      -- SOURCE
   procedure Delete
     (TextEntry: in Tk_Entry; FirstIndex: in String;
      LastIndex: in String := "") with
      Pre => FirstIndex /= "";
      -- ****

      -- ****f* TEntry/get
      -- FUNCTION
      -- Get entry's text.
      -- PARAMETERS
      -- Widgt - Tk_Entry from which text will be taken
      -- RESULT
      -- Returns the entry's string.
      -- SOURCE
   function Get(Widgt: in Tk_Entry) return String;
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
   -- SOURCE
   procedure ICursor(TextEntry: in Tk_Entry; Index: in String) with
      Pre => Index /= "";
      -- ****

      -- ****f* TEntry/Entry_Index
      -- FUNCTION
      -- Get numerical index of character from the selected Index
      -- PARAMETERS
      -- TextEntry - Tk_Entry which will be queried for index
      -- Index         - Index of character which numeric index will be taken
      -- RESULT
      -- Numerical index of the selected character
      -- HISTORY
      -- 8.6.5 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Entry_Index
     (TextEntry: in Tk_Entry; Index: in String) return String with
      Pre => Index /= "";
      -- ****

      -- ****f* TEntry/Insert
      -- FUNCTION
      -- Insert text at selected index to the selected Tk_Entry
      -- PARAMETERS
      -- TextEntry - Tk_Entry to which text will be inserted
      -- Index     - Index in which position text will be inserted
      -- Text      - Text to insert
      -- SOURCE
   procedure Insert
     (TextEntry: in Tk_Entry; Index: in String; Text: in String) with
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
      -- SOURCE
   procedure Scan_Mark(TextEntry: in Tk_Entry; X: in String) with
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
      -- SOURCE
   procedure Scan_DragTo(TextEntry: in Tk_Entry; X: in String) with
      Pre => X /= "";
      -- ****

private

   type Tk_Entry is new Tk_Widget with null record;

end Tcl.Tk.Ada.Widgets.TEntry;

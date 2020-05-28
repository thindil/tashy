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
package Tcl.Tk.Ada.Widgets.TtkEntry is
-- ****

   -- ****t* TtkEntry/Ttk_Entry
   -- FUNCTION
   -- This is a non-abstract type derived directly from Tk_Widget.
   -- Each of the derived widgets redefines the Create subprogram
   -- in order to create the correct type of widget.
   -- SOURCE
   type Ttk_Entry is new Tk_Widget with private;
   -- ****

   -- ****f* TtkEntry/Create (function)
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
   -- SOURCE
   overriding function Create
     (pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) return Ttk_Entry with
      Pre => pathName /= "";
     -- ****

   -- ****f* TtkEntry/Create (procedure)
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
   -- SOURCE
   overriding procedure Create
     (Widgt: out Ttk_Entry; pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) with
      Pre => pathName /= "";
      -- ****

      -- ****f* TtkEntry/BBox
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
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function BBox
     (TextEntry: in Ttk_Entry'Class; Index: in String) return String with
      Pre => Index /= "";
      -- ****

      -- ****f* TtkEntry/Delete
      -- FUNCTION
      -- Delete part of text from the selected entry
      -- PARAMETERS
      -- TextEntry  - Ttk_Entry in which text will be deleted
      -- FirstIndex - Index of text from which delete will start. Index starts from 0
      -- LastIndex  - End index to which text will be deleted. If empty, delete only one
      --              character. Default is empty.
      -- SOURCE
   procedure Delete
     (TextEntry: in Ttk_Entry; FirstIndex: in String;
      LastIndex: in String := "") with
      Pre => FirstIndex /= "";
      -- ****

      -- ****f* TtkEntry/Get
      -- FUNCTION
      -- Get entry's text.
      -- PARAMETERS
      -- Widgt - Ttk_Entry from which text will be taken
      -- RESULT
      -- Returns the entry's string.
      -- SOURCE
   function Get(Widgt: in Ttk_Entry) return String;
   -- ****

   -- ****f* TtkEntry/ICursor
   -- FUNCTION
   -- Place insertion cursor in the selected Ttk_Entry just before the
   -- selected character
   -- PARAMETERS
   -- TextEntry - Ttk_Entry in which insertion cursor will be placed
   -- Index     - Index of the character before which insertion cursor will be
   --             placed
   -- HISTORY
   -- 8.6.5 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   procedure ICursor(TextEntry: in Ttk_Entry'Class; Index: in String) with
      Pre => Index /= "";
      -- ****

   -- ****f* TtkEntry/Insert
   -- FUNCTION
   -- Insert text at selected index to the selected Ttk_Entry
   -- PARAMETERS
   -- TextEntry - Ttk_Entry to which text will be inserted
   -- Index     - Index in which position text will be inserted
   -- Text      - Text to insert
   -- SOURCE
   procedure Insert
     (TextEntry: in Ttk_Entry; Index: in String; Text: in String) with
      Pre => Index /= "" and Text /= "";
      -- ****

private

   type Ttk_Entry is new Tk_Widget with null record;

end Tcl.Tk.Ada.Widgets.TtkEntry;

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

private

   type Tk_Entry is new Tk_Widget with null record;

end Tcl.Tk.Ada.Widgets.TEntry;

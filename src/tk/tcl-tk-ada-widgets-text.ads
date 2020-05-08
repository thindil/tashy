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

-- ****h* Widgets/Text
-- FUNCTION
-- Provides code for manipulate Tk widget Text
-- SOURCE
package Tcl.Tk.Ada.Widgets.Text is
-- ****

   -- ****t* Text/Tk_Text
   -- FUNCTION
   -- This is a non-abstract type derived directly from Tk_Widget.
   -- Each of the derived widgets redefines the Create subprogram
   -- in order to create the correct type of widget.
   -- SOURCE
   type Tk_Text is new Tk_Widget with private;
   -- ****

   -- ****f* Text/Create (function)
   -- FUNCTION
   -- Creates a new Tk_Text in the specified interpreter.
   -- PARAMETERS
   -- pathName - Tk path (starts with dot) for the widget
   -- options  - Options which will be passed to the widget. Default value is
   --            empty
   -- Interp   - Tcl interpreter to which the widget will be created. If null,
   --            the widget will be created in the "contextual" interpreter.
   --            Default value is null.
   -- RESULT
   -- Newly created Tk_Text
   -- SOURCE
   overriding function Create
     (pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) return Tk_Text with
      Pre => pathName /= "";
      -- ****

   -- ****f* Text/Create (procedure)
   -- FUNCTION
   -- Creates a new Tk_Text in the specified interpreter.
   -- PARAMETERS
   -- Widgt    - Tk_Text which will be created
   -- pathName - Tk path (starts with dot) for the widget
   -- options  - Options which will be passed to the widget. Default value is
      --            empty
   -- Interp   - Tcl interpreter to which the widget will be created. If null,
      --            the widget will be created in the "contextual" interpreter.
      --            Default value is null.
      -- SOURCE
   overriding procedure Create
     (Widgt: out Tk_Text; pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) with
      Pre => pathName /= "";
      -- ****

      -- ****f* Text/BBox
      -- FUNCTION
      -- Get size of bounding box of the selected character in the selected
      -- Tk_Text
      -- PARAMETERS
      -- TextWidget - Tk_Text which will be queried
      -- Index      - Index of the character which bounding box will be taken
      -- RESULT
      -- Four values: x1, y1 - coordinates of starting point of bounding box
      -- from top left, x2, y2 - coordinates of ending point from bottom right
      -- of bounding box.
      -- HISTORY
      -- 8.6.5 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function BBox(TextWidget: in Tk_Text; Index: in String) return String with
      Pre => Index /= "";
      -- ****

      -- ****f* Text/Compare
      -- FUNCTION
      -- Compare two indexes of a characters in the selected Tk_Text
      -- PARAMETERS
      -- TextWidget - Tk_Text in which indexes will be compared
      -- Index1     - First index of the character to compare
      -- Op         - Relationship operator for comparison
      -- Index2     - Second index of the character to compare
      -- RESULT
      -- if Op is "<" return "1" if Index1 refers to earlier character in text,
      -- if Op is "==" return "1" if both Index1 and Index2 are refer to the
      -- same character, and so on.
      -- SOURCE
   function Compare
     (TextWidget: in Tk_Text; Index1, Op, Index2: in String) return String with
      Pre => Index1 /= "" and Op in "<" | "<=" | "==" | ">=" | ">" | "!=" and
      Index2 /= "";
      -- ****

      -- ****f* Text/Delete
      -- FUNCTION
      -- Delete text from the selected Tk_Text
      -- PARAMETERS
      -- TextWidget - Tk_Text in which text will be deleted
      -- StartIndex - Start index of character which will be deleted
      -- Indexes    - End index of character before which delete will be done.
      --              It can be also values for another ranges of text to
      --              delete. If empty, delete only one character. Default
      --              value is empty.
      -- SOURCE
   procedure Delete
     (TextWidget: in Tk_Text; StartIndex: in String;
      Indexes: in String := "") with
      Pre => StartIndex /= "";
      -- ****

      -- ****f* Text/Insert
      -- FUNCTION
      -- Insert text into text widget at selected index
      -- PARAMETERS
      -- TextWidget - Tk_Text to which text will be inserted
      -- Index      - Tk_Text position on which text will be inserted. Lines
      --              starts from 1, characters starts from 0
      -- Text       - Text to insert to Tk_Text widget
      -- SOURCE
   procedure Insert(TextWidget: in Tk_Text; Index, Text: in String) with
      Pre => Index /= "" and Text /= "";
      -- ****

      -- ****f* Text/Tag_Add
      -- FUNCTION
      -- Add the selected tag to the text in Tk_Text
      -- PARAMETERS
      -- TextWidget - Tk_Text in which the new tag will be added
      -- TagName    - Name of the tag to add
      -- StartIndex - Starting position on which add the tag
      -- Indexes    - End position for adding the tag or more ranges for add
      --              the tag. If empty, tag will be added only for one
      --              character. Default value is empty
      -- SOURCE
   procedure Tag_Add
     (TextWidget: in Tk_Text; TagName, StartIndex: in String;
      Indexes: in String := "") with
      Pre => TagName /= "" and StartIndex /= "";
      -- ****

      -- ****f* Text/Tag_Configure (procedure)
      -- FUNCTION
      -- Configure the selected tag in the selected Tk_Text widget
      -- PARAMETERS
      -- TextWidget - Tk_Text in which tag will be configured
      -- TagName    - Name of the tag to configure
      -- Options    - Tag options with values to set
      -- SOURCE
   procedure Tag_Configure
     (TextWidget: in Tk_Text; TagName, Options: in String) with
      Pre => TagName /= "" and Options /= "";
      -- ****

      -- ****f* Text/Tag_Configure (function)
      -- FUNCTION
      -- Get configuration of the selected tag in the selected Tk_Text widget
      -- PARAMETERS
      -- TextWidget - Tk_Text in which the tag will be queried for options
      -- TagName    - Name of the tag which configuration will be queried
      -- Option     - Configuration option which value to get. Default value
      --              is empty
      -- RESULT
      -- The selected configuration option value. If Option is empty, return
      -- string with all options and their values.
      -- SOURCE
   function Tag_Configure
     (TextWidget: in Tk_Text; TagName: in String; Option: in String := "")
      return String with
      Pre => TagName /= "";
      -- ****

private

   type Tk_Text is new Tk_Widget with null record;

end Tcl.Tk.Ada.Widgets.Text;

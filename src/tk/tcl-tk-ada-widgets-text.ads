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
      -- HISTORY
      -- 8.6.5 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Compare
     (TextWidget: in Tk_Text; Index1, Op, Index2: in String) return String with
      Pre => Index1 /= "" and Op in "<" | "<=" | "==" | ">=" | ">" | "!=" and
      Index2 /= "";
      -- ****

      -- ****f* Text/Count
      -- FUNCTION
      -- Count the selected items in the selected Tk_Text between selected
      -- indexes
      -- PARAMETERS
      -- TextWidget - Tk_Text in which items will be counted
      -- Options    - Type of items to count. Can be one or more types.
      --              Possible values are "-chars" (elided and not characters),
      --              "-displaychars" (non-elided characters),
      --              "-displayindices" (non-elided characters, widgets,
      --              images), "-displaylines" (displayed lines), "-indices"
      --              (elided and not characters, widgets, images), "-lines"
      --              (logical lines), "-xpixels" (horizontal pixels),
      --              "-ypixels" (vertical pixels)
      -- Index1     - Index where count starts
      -- Index2     - Index where count ends
      -- RESULT
      -- Values of counting the selected options. Amount of returned values
      -- depends on the amount of the selected options.
      -- HISTORY
      -- 8.6.5 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Count
     (TextWidget: in Tk_Text; Options, Index1, Index2: in String)
      return String with
      Pre => Options /= "" and Index1 /= "" and Index2 /= "";
      -- ****

      -- ****f* Text/Debug (procedure)
      -- FUNCTION
      -- Enable or disable internal consistency checks on B-tree code
      -- associated with the selected Tk_Text
      -- PARAMETERS
      -- TextWidget - Tk_Text which debug will be enabled or disabled
      -- Enable     - If "true" enable debug, when "false" disable
      -- HISTORY
      -- 8.6.5 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   procedure Debug(TextWidget: in Tk_Text; Enable: in String) with
      Pre => Enable in "true" | "false";
      -- ****

      -- ****f* Text/Debug (function)
      -- FUNCTION
      -- Get the current state of internal consistency checks on B-tree code
      -- associated with the selected Tk_Text
      -- PARAMETERS
      -- TextWidget - Tk_Text which debug state will be queried
      -- RESULT
      -- "on" if checks are enabled, otherwise "off"
      -- HISTORY
      -- 8.6.5 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Debug(TextWidget: in Tk_Text) return String;
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

      -- ****f* Text/DLineInfo
      -- FUNCTION
      -- Get information about the selected displayed line in the selected
      -- Tk_Text
      -- PARAMETERS
      -- TextWidget - Tk_Text in which information will be queried
      -- Index      - Index of the character in the line which information
      --              will be get
      -- RESULT
      -- The first two elements of the list give the x and y coordinates of
      -- the upper-left corner of the area occupied by the line, the third and
      -- fourth elements give the width and height of the area, and the fifth
      -- element gives the position of the baseline for the line, measured down
      -- from the top of the area. All of this information is measured in
      -- pixels. If the current wrap mode is none and the line extends beyond
      -- the boundaries of the window, the area returned reflects the entire
      -- area of the line, including the portions that are out of the window.
      -- If the line is shorter than the full width of the window then the area
      -- returned reflects just the portion of the line that is occupied by
      -- characters and embedded windows. If the display line containing Index
      -- is not visible on the screen then the return value is {}.
      -- HISTORY
      -- 8.6.5 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function DLineInfo
     (TextWidget: in Tk_Text; Index: in String) return String with
      Pre => Index /= "";
      -- ****

      -- ****f* Text/Dump
      -- FUNCTION
      -- Get the content (text but also information about marks, images,
      -- widgets, etc) of the selected Tk_Text
      -- PARAMETERS
      -- TextWidget - Tk_Text which will be queried for the content
      -- Switches   - What the content type get from the TextWidget. Possible
      --              options are (also combination of them): "-all",
      --              "-command", "-image", "-mark", "-tag", "-text",
      --              "-window"
      -- Index1     - Index of the character from which starts to get the
      --              content
      -- Index2     - Index of the character before which stops to get the
      --              content
      -- RESULT
      -- String with information in following format: "key1 value1 index1 key2
      -- value2 index2 ..."
      -- HISTORY
      -- 8.6.5 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Dump
     (TextWidget: in Tk_Text; Switches: in String := "-all"; Index1: in String;
      Index2: in String := "") return String with
      Pre => Index1 /= "";
      -- ****

      -- ****f* Text/Edit_CanRedo
      -- FUNCTION
      -- Check if redo action is possible or not
      -- PARAMETERS
      -- TextWidget - Tk_Text which will be queried for redo state
      -- RESULT
      -- "true" if redo action is possible, otherwise "false"
      -- HISTORY
      -- 8.6.5 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Edit_CanRedo(TextWidget: in Tk_Text) return String;
   -- ****

   -- ****f* Text/Edit_CanRedo
   -- FUNCTION
   -- Check if undo action is possible or not
   -- PARAMETERS
   -- TextWidget - Tk_Text which will be queried for undo state
   -- RESULT
   -- "true" if undo action is possible, otherwise "false"
   -- HISTORY
   -- 8.6.5 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   function Edit_CanUndo(TextWidget: in Tk_Text) return String;
   -- ****

   -- ****f* Text/Edit_Modified (procedure)
   -- FUNCTION
   -- Set flag Modified for the selected Tk_Text on the selected value
   -- PARAMETERS
   -- TextWidget - Tk_Text which flag Modified will be set
   -- Value      - A new value for the flag Modified. Possible values are
   --              "0", "1", "true", "false"
   -- HISTORY
   -- 8.6.5 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   procedure Edit_Modified(TextWidget: in Tk_Text; Value: in String) with
      Pre => Value in "0" | "1" | "true" | "false";
      -- ****

      -- ****f* Text/Edit_Modified (function)
      -- FUNCTION
      -- Get the flag Modified for the selected Tk_Text
      -- PARAMETERS
      -- TextWidget - Tk_Text which flag Modified will be set
      -- HISTORY
      -- 8.6.5 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- RESULT
      -- Value of the flag Modified of TextWidget
      -- SOURCE
   function Edit_Modified(TextWidget: in Tk_Text) return String;
   -- ****

   -- ****f* Text/Edit_Redo
   -- FUNCTION
   -- When the -undo option of Tk_Text is true, reapplies the last undone edits
   -- provided no other edits were done since then. Generates an error when
   -- the redo stack is empty. Does nothing when the -undo option of Tk_Text
   -- is false.
   -- PARAMETERS
   -- TextWidget - Tk_Text in which the last undone edit will be reapplied
   -- HISTORY
   -- 8.6.5 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   procedure Edit_Redo(TextWidget: in Tk_Text);
   -- ****

   -- ****f* Text/Edit_Reset
   -- FUNCTION
   -- Clears the selected Tk_Text undo and redo stacks
   -- PARAMETERS
   -- TextWidget - Tk_Text which undo and redo stacks will be cleared
   -- HISTORY
   -- 8.6.5 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   procedure Edit_Reset(TextWidget: in Tk_Text);
   -- ****

   -- ****f* Text/Edit_Separator
   -- FUNCTION
   -- Inserts a separator (boundary) on the undo stack. Does nothing when the
   -- -undo option is false
   -- PARAMETERS
   -- TextWidget - Tk_Text in which the separator will be inserted
   -- HISTORY
   -- 8.6.5 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   procedure Edit_Separator(TextWidget: in Tk_Text);
   -- ****

   -- ****f* Text/Edit_Undo
   -- FUNCTION
   -- Undoes the last edit action when the -undo option is true. An edit
   -- action is defined as all the insert and delete commands that are
   -- recorded on the undo stack in between two separators. Generates an error
   -- when the undo stack is empty. Does nothing when the -undo option is
   -- false.
   -- PARAMETERS
   -- TextWidget - Tk_Text in which the last edit action will be undoed
   -- HISTORY
   -- 8.6.5 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   procedure Edit_Undo(TextWidget: in Tk_Text);
   -- ****

   -- ****f* Text/Get
   -- FUNCTION
   -- Get the selected characters from the selected Tk_Text
   -- PARAMETERS
   -- TextWidget - Tk_Text which will be queried for characters
   -- Options    - Indexes of the characters to get.
   -- RESULT
   -- If Options starts with "-displaycharacters" then only non elided
   -- characters are returned. If Options is only one index, return only one
   -- character. If Options contains more than one range of indexes, return
   -- characters for each range.
   -- HISTORY
   -- 8.6.5 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   function Get(TextWidget: in Tk_Text; Options: in String) return String with
      Pre => Options /= "";
      -- ****

      -- ****f* Text/Image_Cget
      -- FUNCTION
      -- Get the selected option for the selected image in the selected Tk_Text
      -- PARAMETERS
      -- TextWidget - Tk_Text which will be queried for the option's value
      -- Index      - Index of the image which option's value will be get
      -- Option     - Name of the image's option to get
      -- RESULT
      -- Value of the selected Option of the selected image
      -- HISTORY
      -- 8.6.5 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Image_Cget
     (TextWidget: in Tk_Text; Index, Option: in String) return String with
      Pre => Index /= "" and Option /= "";
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

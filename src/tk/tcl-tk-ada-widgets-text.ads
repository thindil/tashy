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

   -- ****f* Text/Edit_CanUndo
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

      -- ****f* Text/Image_Configure (procedure)
      -- FUNCTION
      -- Configure the selected options of the selected image in the selected
      -- Tk_Text
      -- PARAMETERS
      -- TextWidget - Tk_Text in which the image's options will be set
      -- Index      - Index of the image which options will be set
      -- Options    - Options in "name value" pairs to set
      -- HISTORY
      -- 8.6.5 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   procedure Image_Configure
     (TextWidget: in Tk_Text; Index, Options: in String) with
      Pre => Index /= "" and Options /= "";
      -- ****

      -- ****f* Text/Image_Configure (function)
      -- FUNCTION
      -- Get the selected options of the selected image in the selected Tk_Text
      -- PARAMETERS
      -- TextWidget - Tk_Text in which the image's options will be get
      -- Index      - Index of the image which options will be get
      -- Options    - Option name to get or empty string to get all available
      --              options. Default value is empty
      -- RESULT
      -- Value of selected option or values of all options if Option is empty
      -- string
      -- HISTORY
      -- 8.6.5 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Image_Configure
     (TextWidget: in Tk_Text; Index: in String; Option: in String := "")
      return String with
      Pre => Index /= "";
      -- ****

      -- ****f* Text/Image_Create
      -- FUNCTION
      -- Create a new image inside Tk_Text at the selected index
      -- PARAMETERS
      -- TextWidget - Tk_Text in which an image will be created
      -- Index      - Index in the TextWidget at which an image will be created
      -- Options    - Options for the newly created image
      -- RESULT
      -- Unique identifier for the newly created image
      -- HISTORY
      -- 8.6.5 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Image_Create
     (TextWidget: in Tk_Text; Index: in String; Options: in String := "")
      return String with
      Pre => Index /= "";
      -- ****

      -- ****f* Text/Image_Names
      -- FUNCTION
      -- Get the names of the all images which are embedded in the Tk_Text
      -- PARAMETERS
      -- TextWidget - Tk_Text which will be queried for images names
      -- RESULT
      -- The list of all images names currently embedded into TextWidget
      -- HISTORY
      -- 8.6.5 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Image_Names(TextWidget: in Tk_Text) return String;
   -- ****

   -- ****f* Text/Index
   -- FUNCTION
   -- Get index of the selected item
   -- PARAMETERS
   -- TextWidget - Tk_Text which will be queried for the index
   -- TextIndex  - Can be in line.char, mark name, item name, pixel
   --              coordinates, tag.first, tag.last
   -- RESULT
   -- Index of the selected item in form "line.character"
   -- HISTORY
   -- 8.6.5 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   function Index
     (TextWidget: in Tk_Text; TextIndex: in String) return String with
      Pre => TextIndex /= "";
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

      -- ****f* Text/Mark_Gravity (procedure)
      -- FUNCTION
      -- Set to which adjacent character the selected mark is attached
      -- PARAMETERS
      -- TextWidget - Tk_Text in which mark gravity will be set
      -- MarkName   - Name of mark which gravity will be set
      -- Direction  - A new value for the gravity of the mark. Can be "left" or
      --              "right"
      -- HISTORY
      -- 8.6.5 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   procedure Mark_Gravity
     (TextWidget: in Tk_Text; MarkName, Direction: in String) with
      Pre => MarkName /= "" and Direction in "left" | "right";
      -- ****

      -- ****f* Text/Mark_Gravity (function)
      -- FUNCTION
      -- Get the gravity of the selected mark in the selected Tk_Text
      -- PARAMETERS
      -- TextWidget - Tk_Text which will be queried for mark gravity
      -- MarkName   - Name of the mark which gravity will be get
      -- RESULT
      -- Direction to the adjacent character to which mark is attached.
      -- Possible values are "left" and "right"
      -- HISTORY
      -- 8.6.5 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Mark_Gravity
     (TextWidget: in Tk_Text; MarkName: in String) return String with
      Pre => MarkName /= "";
      -- ****

      -- ****f* Text/Mark_Names
      -- FUNCTION
      -- Get names of all marks that are currently set
      -- PARAMETERS
      -- TextWidget - Tk_Text which will be queried for names
      -- RESULT
      -- List of names of all existing marks in the TextWidget
      -- HISTORY
      -- 8.6.5 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Mark_Names(TextWidget: in Tk_Text) return String;
   -- ****

   -- ****f* Text/Mark_Next
   -- FUNCTION
   -- Get next mark at or after the selected index in the selected Tk_Text
   -- PARAMETERS
   -- TextWidget - Tk_Text in which mark will be looking for
   -- Index      - Numerical index of character at which search begins or name
   --              of mark after which search begins
   -- RESULT
   -- Name of the next mark or {} if no mark was found
   -- HISTORY
   -- 8.6.5 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   function Mark_Next
     (TextWidget: in Tk_Text; Index: in String) return String with
      Pre => Index /= "";
      -- ****

      -- ****f* Text/Mark_Previous
      -- FUNCTION
      -- Get previous mark at or before the selected index in the selected
      -- Tk_Text
      -- PARAMETERS
      -- TextWidget - Tk_Text in which mark will be looking for
      -- Index      - Numerical index of character at which search begins or
      --              name of mark before which search begins
      -- RESULT
      -- Name of the previous mark or {} if no mark was found
      -- HISTORY
      -- 8.6.5 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Mark_Previous
     (TextWidget: in Tk_Text; Index: in String) return String with
      Pre => Index /= "";
      -- ****

      -- ****f* Text/Mark_Set
      -- FUNCTION
      -- Set the selected mark before the character at the selected index in
      -- the selected Tk_Text.
      -- PARAMETERS
      -- TextWidget - Tk_Text in which the mark will be set
      -- MarkName   - Name of the mark to set. If mark with that name exists,
      --              it will be moved to the new position. Otherwise, create
      --              a new mark with the selected name
      -- Index      - Index of the character before which the selected mark
      --              will be added
      -- HISTORY
      -- 8.6.5 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   procedure Mark_Set(TextWidget: in Tk_Text; MarkName, Index: in String) with
      Pre => MarkName /= "" and Index /= "";
      -- ****

      -- ****f* Text/Mark_Unset
      -- FUNCTION
      -- Remove the selected mark(s) from the selected Tk_Text
      -- PARAMETERS
      -- TextWidget - Tk_Text from which the selected mark(s) will be removed
      -- MarkName   - Name(s) of the marks to remove. If more than one mark
      --              should be removed, separate they name by space
      -- HISTORY
      -- 8.6.5 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   procedure Mark_Unset(TextWidget: in Tk_Text; MarkName: in String) with
      Pre => MarkName /= "";
      -- ****

      -- ****f* Text/Peer_Create
      -- FUNCTION
      -- Create a new peer text widget with the selected name and options
      -- PARAMETERS
      -- TextWidget  - Tk_Text for which peer widget will be created
      -- NewPathName - A name of a peer widget to create
      -- Options     - Standard options for Tk_Text widget passed to the new
      --               peer widget. Can be empty. Default value is empty
      -- HISTORY
      -- 8.6.5 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   procedure Peer_Create
     (TextWidget: in Tk_Text; NewPathName: in String;
      Options: in String := "") with
      Pre => NewPathName /= "";
      -- ****

      -- ****f* Text/Peer_Names
      -- FUNCTION
      -- Get the list of names of all peers widgets for the selected Tk_Text
      -- PARAMETERS
      -- TextWidget - Tk_Text which peers will be queried
      -- RESULT
      -- List of names of all peers of the selected TextWidget or {} if no
      -- peers are available. Order of the list is undefined
      -- HISTORY
      -- 8.6.5 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Peer_Names(TextWidget: in Tk_Text) return String;
   -- ****

   -- ****f* Text/PendingSync
   -- FUNCTION
   -- Check if line heights calculation is up to date or not
   -- PARAMETERS
   -- TextWidget - Tk_Text which state of synchronization will be check
   -- RESULT
   -- "1" if line heights calculations is not up to date or "0" if is
   -- synchronized
   -- HISTORY
   -- 8.6.5 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   function PendingSync(TextWidget: in Tk_Text) return String;
   -- ****

   -- ****f* Text/Replace
   -- FUNCTION
   -- Replace range of characters with new characters and tags
   -- PARAMETERS
   -- TextWidget - Tk_Text in which characters will be replaced
   -- Index1     - Index of the first character to replace
   -- Index2     - Index of the last character to replace
   -- Chars      - Characters and tags which will replace current characters
   -- HISTORY
   -- 8.6.5 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   procedure Replace
     (TextWidget: in Tk_Text; Index1, Index2, Chars: in String) with
      Pre => Index1 /= "" and Index2 /= "" and Chars /= "";
      -- ****

      -- ****f* Text/Scan_Mark
      -- FUNCTION
      -- Sets starting position for scan in the selected Tk_Text
      -- PARAMETERS
      -- TextWidget - Tk_Text in which mark will be set
      -- X          - X coordinate of the mark to set
      -- Y          - Y coordinate of the mark to set
      -- HISTORY
      -- 8.6.5 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   procedure Scan_Mark(TextWidget: in Tk_Text; X, Y: in String) with
      Pre => X /= "" and Y /= "";
      -- ****

      -- ****f* Text/Scan_DragTo
      -- FUNCTION
      -- Computes the difference between its X argument and the X argument to
      -- the last Scan_Mark procedure for the Tk_Entry. It then adjusts the
      -- view by 10 times the difference in coordinates.
      -- PARAMETERS
      -- TextWidget - Tk_Text in which difference will be computed
      -- X          - X coordinate which difference will be computed
      -- Y          - Y coordinate which difference will be computed
      -- HISTORY
      -- 8.6.5 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   procedure Scan_DragTo(TextWidget: in Tk_Text; X, Y: in String) with
      Pre => X /= "" and Y /= "";
      -- ****

      -- ****f* Text/Search
      -- FUNCTION
      -- Search for the selected pattern in the selected Tk_Text
      -- PARAMETERS
      -- TextWidget - Tk_Text in which the selected Pattern will be looking for
      -- Switches   - Switches for command search. Can be empty. Default value
      --              is empty
      -- Pattern    - Pattern to search
      -- Index      - Index of character from which start search
      -- StopIndex  - Index of character at which stop searching
      -- RESULT
      -- Index of first character matching Pattern or {} if nothing was found
      -- HISTORY
      -- 8.6.5 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Search
     (TextWidget: in Tk_Text; Switches: in String := "";
      Pattern, Index: in String; StopIndex: in String := "") return String with
      Pre => Pattern /= "" and Index /= "";
      -- ****

      -- ****f* Text/See
      -- FUNCTION
      -- Made the selected character visible (scroll Tk_Text to it if needed)
      -- PARAMETERS
      -- TextWidget - Tk_Text in which the selected character will be visible
      -- Index      - Index of character show show
      -- HISTORY
      -- 8.6.5 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   procedure See(TextWidget: in Tk_Text; Index: in String) with
      Pre => Index /= "";
      -- ****

      -- ****f* Text/Sync
      -- FUNCTION
      -- Update line metrics by computing lines heights
      -- PARAMETERS
      -- TextWidget - Tk_Text which line metrics will be updated
      -- HISTORY
      -- 8.6.5 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   procedure Sync(TextWidget: in Tk_Text);
   -- ****

   -- ****f* Text/Sync_Command
   -- FUNCTION
   -- Execute the selected Tcl command once all lines heights are up to date
   -- PARAMETERS
   -- TextWidget - Tk_Text in which command will be executed
   -- Command    - Tcl command to execute
   -- HISTORY
   -- 8.6.5 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   procedure Sync_Command(TextWidget: in Tk_Text; Command: in String) with
      Pre => Command /= "";
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

      -- ****f* Text/Tag_Bind (procedure)
      -- FUNCTION
      -- Bind the selected script to the selected sequence on the selected tag
      -- PARAMETERS
      -- TextWidget - Tk_Text in which script will be bound
      -- TagName    - Name of the tag to which script will be bound
      -- Sequence   - Name of the sequence to which script will be bound
      -- Script     - Tcl commands which will be bound
      -- HISTORY
      -- 8.6.5 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   procedure Tag_Bind
     (TextWidget: in Tk_Text; TagName, Sequence, Script: in String) with
      Pre => TagName /= "" and Sequence /= "" and Script /= "";
      -- ****

      -- ****f* Text/Tag_Bind (function)
      -- FUNCTION
      -- Get scrips bounded to the selected tag in the selected Tk_Text
      -- PARAMETERS
      -- TextWidget - Tk_Text in which information will be queried
      -- TagName    - Name of the tag which bindings will be queried
      -- Sequence   - Name of the sequence. Can be empty. Default value is
      --              empty
      -- RESULT
      -- If Sequence is empty, return all binded sequences. Otherwise, return
      -- script associated with the selected Sequence.
      -- HISTORY
      -- 8.6.5 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Tag_Bind
     (TextWidget: in Tk_Text; TagName: in String; Sequence: in String := "")
      return String with
      Pre => TagName /= "";
      -- ****

      -- ****f* Text/Tag_Cget
      -- FUNCTION
      -- Get the current value of the selected option of the selected tag in
      -- the selected Tk_Text
      -- PARAMETERS
      -- TextWidget - Tk_Text in which tag's options will be queried
      -- TagName    - Name of the tag which options will be queried
      -- Option     - Name of the option which value will be taken
      -- RESULT
      -- The current value of the selected option
      -- HISTORY
      -- 8.6.5 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Tag_Cget
     (TextWidget: in Tk_Text; TagName, Option: in String) return String with
      Pre => TagName /= "" and Option /= "";
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

      -- ****f* Text/Tag_Delete
      -- FUNCTION
      -- Delete the selected tag(s) from the selected Tk_Text
      -- PARAMETERS
      -- TextWidget - Tk_Text from which the selected tag(s) will be removed
      -- TagName    - Name of the tag to remove. It can be list of names
      --              separated by spaces
      -- HISTORY
      -- 8.6.5 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   procedure Tag_Delete(TextWidget: in Tk_Text; TagName: in String) with
      Pre => TagName /= "";
      -- ****

      -- ****f* Text/Tag_Lower
      -- FUNCTION
      -- Lower the priority of the selected tag
      -- PARAMETERS
      -- TextWidget - Tk_Text in which the selected tag's priority will be
      --              lowered
      -- TagName    - Name of the tag which priority will be lowered
      -- BelowThis  - Name of the tag which priority will be above the
      --              selected tag name. If it is empty, made the selected tag
      --              lowest priority. Default value is empty.
      -- HISTORY
      -- 8.6.5 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   procedure Tag_Lower
     (TextWidget: in Tk_Text; TagName: in String;
      BelowThis: in String := "") with
      Pre => TagName /= "";
      -- ****

      -- ****f* Text/Tag_Names
      -- FUNCTION
      -- Get the names of tags in the selected Tk_Text
      -- PARAMETERS
      -- TextWidget - Tk_Text which will be queried for the tags
      -- Index      - Index of the character at which tags will be taken.
      --              Can be empty. Default value is empty.
      -- RESULT
      -- If Index is empty, return list of names of all tags in the TextWidget.
      -- Otherwise return list of names of tags at the selected position
      -- HISTORY
      -- 8.6.5 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Tag_Names
     (TextWidget: in Tk_Text; Index: in String := "") return String;
     -- ****

     -- ****f* Text/Tag_NextRange
     -- FUNCTION
     -- Get the characters with the selected tag name found in the selected
     -- range in the selected Tk_Text
     -- PARAMETERS
     -- TextWidget - Tk_Text which will be queried for text
     -- TagName    - Name of the tag which is looking for
     -- Index1     - Index of the character from which search for starts
     -- Index2     - Index of the character at which search for ends. If empty
     --              search to the end of the text. Default value is empty
     -- RESULT
     -- List with two values: the first index of the character in range and
     -- the last index of character in range with the selected tag. If no
     -- characters are in range, return {}
     -- HISTORY
     -- 8.6.5 - Added
     -- TODO
     -- Replace it with higher level of binding
     -- SOURCE
   function Tag_NextRange
     (TextWidget: in Tk_Text; TagName, Index1: in String;
      Index2: in String := "") return String with
      Pre => TagName /= "" and Index1 /= "";
      -- ****

      -- ****f* Text/Tag_PrevRange
      -- FUNCTION
      -- Get the characters with the selected tag name found in the selected
      -- range in the selected Tk_Text. Search is done in the reverse direction.
      -- PARAMETERS
      -- TextWidget - Tk_Text which will be queried for text
      -- TagName    - Name of the tag which is looking for
      -- Index1     - Index of the character from which search for starts
      -- Index2     - Index of the character at which search for ends. If empty
      --              search to the beginning of the text. Default value is
      --              empty
      -- RESULT
      -- List with two values: the first index of the character in range and
      -- the last index of character in range with the selected tag. If no
      -- characters are in range, return {}
      -- HISTORY
      -- 8.6.5 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Tag_PrevRange
     (TextWidget: in Tk_Text; TagName, Index1: in String;
      Index2: in String := "") return String with
      Pre => TagName /= "" and Index1 /= "";
      -- ****

      -- ****f* Text/Tag_Raise
      -- FUNCTION
      -- Raise the priority of the selected tag
      -- PARAMETERS
      -- TextWidget - Tk_Text in which the selected tag's priority will be
      --              raised
      -- TagName    - The name of the tag which priority will be raised
      -- AboveThis  - The name of the tag which priority will be below the
      --              selected tag. If empty, the selected tag will be the
      --              first in the priority. Default value is empty
      -- HISTORY
      -- 8.6.5 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   procedure Tag_Raise
     (TextWidget: in Tk_Text; TagName: in String;
      AboveThis: in String := "") with
      Pre => TagName /= "";
      -- ****

      -- ****f* Text/Tag_Ranges
      -- FUNCTION
      -- Get the ranges of text that have been tagged with the selected tag
      -- PARAMETERS
      -- TextWidget - Tk_Text in which ranges will be queried
      -- TagName    - Name of the tag which will be queried
      -- RESULT
      -- List of values, first value is the index of the first character in
      -- the first found range, second value is the index of the last character
      -- in the first found range and so on. If no text is tagged with the
      -- selected TagName, returns {}
      -- HISTORY
      -- 8.6.5 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Tag_Ranges
     (TextWidget: in Tk_Text; TagName: in String) return String with
      Pre => TagName /= "";
      -- ****

      -- ****f* Text/Tag_Remove
      -- FUNCTION
      -- Remove the selected tag from the selected characters in the selected
      -- Tk_Text
      -- PARAMETERS
      -- TextWidget - Tk_Text in which the selected tag will be removed from
      --              characters
      -- TagName    - Name of the tag to remove
      -- Index1     - Index of the starting character from which tag will be
      --              removed
      -- Index2     - Index of the last character from which tag will be
      --              removed. If empty, then tag is removed from the first
      --              character only. Default value is empty
      -- HISTORY
      -- 8.6.5 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   procedure Tag_Remove
     (TextWidget: in Tk_Text; TagName, Index1: in String;
      Index2: in String := "") with
      Pre => TagName /= "" and Index1 /= "";
      -- ****

private

   type Tk_Text is new Tk_Widget with null record;

end Tcl.Tk.Ada.Widgets.Text;

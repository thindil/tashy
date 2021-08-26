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

   -- ****t* Text/Text.Tk_Text
   -- FUNCTION
   -- This is a non-abstract type derived directly from Tk_Widget.
   -- Each of the derived widgets redefines the Create subprogram
   -- in order to create the correct type of widget.
   -- SOURCE
   type Tk_Text is new Tk_Widget with private;
   -- ****

   -- ****f* Text/Text.Create_(function)
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
   -- HISTORY
   -- 8.6.1 - Added
   -- EXAMPLE
   -- -- Create a new text with pathname .mytext and height of 10 characters
   -- My_Text: constant Tk_Text := Create(".text", "-height 10");
   -- COMMANDS
   -- text pathName ?options?
   -- SEE ALSO
   -- Text.Create_(procedure)
   -- SOURCE
   overriding function Create
     (pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := Null_Interp) return Tk_Text with
      Pre => pathName /= "";
     -- ****

     -- ****f* Text/Text.Create_(procedure)
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
     -- OUTPUT
     -- Newly created Tk_Text as parameter Widgt
     -- HISTORY
     -- 8.6.1 - Added
     -- EXAMPLE
     -- -- Create text My_Text with pathname .mytext and state readonly on the current Tcl interpreter
     -- declare
     --    My_Text: Tk_Text;
     -- begin
     --    Create(My_Text, ".mytext", "-state readonly");
     -- end;
     -- COMMANDS
     -- text pathName ?options?
     -- SEE ALSO
     -- Text.Create_(function)
     -- SOURCE
   overriding procedure Create
     (Widgt: out Tk_Text; pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := Null_Interp) with
      Pre => pathName /= "";
     -- ****

     -- ****f* Text/Text.Get_Widget
     -- FUNCTION
     -- Get the existing Tk_Text widget
     -- PARAMETERS
     -- pathName - Tk path (starts with dot) for the widget
     -- Interp   - Tcl interpreter on which the widget exists. Can be empty.
     --            Default value is current Tcl interpreter
     -- RESULT
     -- Existing Tk_Text widget
     -- HISTORY
     -- 8.6.9 - Added
     -- EXAMPLE
     -- -- Get text widget with name .mytext on the current Tcl interpreter
     -- My_Text: constant Tk_Text := Get_Widget(".mytext");
     -- SOURCE
   overriding function Get_Widget
     (pathName: in String; Interp: in Tcl_Interp := Get_Context)
      return Tk_Text;
     -- ****

     -- ****f* Text/Text.BBox
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
     -- EXAMPLE
     -- -- Get the bouding box for the first character in My_Text text
     -- Bounding_Box: constant String := BBox(My_Text, "1.0");
     -- COMMANDS
     -- TextWidget bbox index
     -- SOURCE
   function BBox(TextWidget: in Tk_Text; Index: in String) return String with
      Pre => Index /= "";
      -- ****

      -- ****f* Text/Text.Compare
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
      -- EXAMPLE
      -- -- Check if the first character in My_Text text is that same as the last
      -- Equal: constant String := Compare(My_Text, "1.0", "==", "end");
      -- COMMANDS
      -- TextWidget compare index1 op index2
      -- SOURCE
   function Compare
     (TextWidget: in Tk_Text; Index1, Op, Index2: in String) return String with
      Pre => Index1 /= "" and Op in "<" | "<=" | "==" | ">=" | ">" | "!=" and
      Index2 /= "";
      -- ****

      -- ****f* Text/Text.Count
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
      -- EXAMPLE
      -- -- Get the amount of the selected item in My_Text between first and 10th character in second line
      -- Amount: constant String := Count(My_Text, "-indices", "2.0", "2.9");
      -- COMMANDS
      -- TextWidget count options index1 index2
      -- SOURCE
   function Count
     (TextWidget: in Tk_Text; Options, Index1, Index2: in String)
      return String with
      Pre => Options /= "" and Index1 /= "" and Index2 /= "";
      -- ****

      -- ****f* Text/Text.Debug_(procedure)
      -- FUNCTION
      -- Enable or disable internal consistency checks on B-tree code
      -- associated with the selected Tk_Text
      -- PARAMETERS
      -- TextWidget - Tk_Text which debug will be enabled or disabled
      -- Enable     - If "true" enable debug, when "false" disable
      -- HISTORY
      -- 8.6.5 - Added
      -- EXAMPLE
      -- -- Enable consistency checks in My_Text text
      -- Debug(My_Text, "true");
      -- COMMANDS
      -- TextWidget debug boolean
      -- SEE ALSO
      -- Text.Debug_(function)
      -- SOURCE
   procedure Debug(TextWidget: in Tk_Text; Enable: in String) with
      Pre => Enable in "true" | "false";
      -- ****

      -- ****f* Text/Text.Debug_(function)
      -- FUNCTION
      -- Get the current state of internal consistency checks on B-tree code
      -- associated with the selected Tk_Text
      -- PARAMETERS
      -- TextWidget - Tk_Text which debug state will be queried
      -- RESULT
      -- "on" if checks are enabled, otherwise "off"
      -- HISTORY
      -- 8.6.5 - Added
      -- EXAMPLE
      -- -- Get the state of consistency checks in My_Text text
      -- Debug_State: constant String := Debug(My_Text);
      -- COMMANDS
      -- TextWidget debug
      -- SEE ALSO
      -- Text.Debug_(function)
      -- SOURCE
   function Debug(TextWidget: in Tk_Text) return String;
   -- ****

   -- ****f* Text/Text.Delete
   -- FUNCTION
   -- Delete text from the selected Tk_Text
   -- PARAMETERS
   -- TextWidget - Tk_Text in which text will be deleted
   -- StartIndex - Start index of character which will be deleted
   -- Indexes    - End index of character before which delete will be done.
   --              It can be also values for another ranges of text to
   --              delete. If empty, delete only one character. Default
   --              value is empty.
   -- HISTORY
   -- 8.6.3 - Added
   -- EXAMPLE
   -- -- Delete the whole first line in the My_Text text
   -- Delete(My_Text, "1.0", "1.end");
   -- COMMANDS
   -- TextWidget delete startindex ?indexes?
   -- SOURCE
   procedure Delete
     (TextWidget: in Tk_Text; StartIndex: in String;
      Indexes: in String := "") with
      Pre => StartIndex /= "";
      -- ****

      -- ****f* Text/Text.DLineInfo
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
      -- EXAMPLE
      -- -- Get the information about 10th character in third line in My_Text text
      -- Info: constant String := DLineInfo(My_Text, "3.9");
      -- COMMANDS
      -- TextWidget dlineinfo index
      -- SOURCE
   function DLineInfo
     (TextWidget: in Tk_Text; Index: in String) return String with
      Pre => Index /= "";
      -- ****

      -- ****f* Text/Text.Dump
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
      -- EXAMPLE
      -- -- Get the whole content of My_Text text
      -- Content: constant String := Dump(My_Text, "-all", "1.0", "end");
      -- COMMANDS
      -- TextWidget dump ?switches? index1 ?index2?
      -- SOURCE
   function Dump
     (TextWidget: in Tk_Text; Switches: in String := "-all"; Index1: in String;
      Index2: in String := "") return String with
      Pre => Index1 /= "";
      -- ****

      -- ****f* Text/Text.Edit_CanRedo
      -- FUNCTION
      -- Check if redo action is possible or not
      -- PARAMETERS
      -- TextWidget - Tk_Text which will be queried for redo state
      -- RESULT
      -- "true" if redo action is possible, otherwise "false"
      -- HISTORY
      -- 8.6.5 - Added
      -- EXAMPLE
      -- -- Check if redo action is available for My_Text text
      -- Can_Redo: constant String := Edit_CanRedo(My_Text);
      -- COMMANDS
      -- TextWidget edit canredo
      -- SOURCE
   function Edit_CanRedo(TextWidget: in Tk_Text) return String;
   -- ****

   -- ****f* Text/Text.Edit_CanUndo
   -- FUNCTION
   -- Check if undo action is possible or not
   -- PARAMETERS
   -- TextWidget - Tk_Text which will be queried for undo state
   -- RESULT
   -- "true" if undo action is possible, otherwise "false"
   -- HISTORY
   -- 8.6.5 - Added
   -- EXAMPLE
   -- -- Check if undo action is available for My_Text text
   -- Can_Undo: constant String := Edit_CanUndo(My_Text);
   -- COMMANDS
   -- TextWidget edit canundo
   -- SOURCE
   function Edit_CanUndo(TextWidget: in Tk_Text) return String;
   -- ****

   -- ****f* Text/Text.Edit_Modified_(procedure)
   -- FUNCTION
   -- Set flag Modified for the selected Tk_Text on the selected value
   -- PARAMETERS
   -- TextWidget - Tk_Text which flag Modified will be set
   -- Value      - A new value for the flag Modified. Possible values are
   --              "0", "1", "true", "false"
   -- HISTORY
   -- 8.6.5 - Added
   -- EXAMPLE
   -- -- Set the modified flag for the My_Text text to true
   -- Edit_Modified(My_Text, "true");
   -- COMMANDS
   -- TextWidget edit modified value
   -- SEE ALSO
   -- Text.Edit_Modified_(function)
   -- SOURCE
   procedure Edit_Modified(TextWidget: in Tk_Text; Value: in String) with
      Pre => Value in "0" | "1" | "true" | "false";
      -- ****

      -- ****f* Text/Text.Edit_Modified_(function)
      -- FUNCTION
      -- Get the flag Modified for the selected Tk_Text
      -- PARAMETERS
      -- TextWidget - Tk_Text which flag Modified will be set
      -- HISTORY
      -- 8.6.5 - Added
      -- RESULT
      -- Value of the flag Modified of TextWidget
      -- EXAMPLE
      -- -- Get the modified flag of My_Text text
      -- Modified_Flag: constant String := Edit_Modified(My_Text);
      -- COMMANDS
      -- TextWidget edit modified
      -- SEE ALSO
      -- Text.Edit_Modified_(procedure)
      -- SOURCE
   function Edit_Modified(TextWidget: in Tk_Text) return String;
   -- ****

   -- ****f* Text/Text.Edit_Redo
   -- FUNCTION
   -- When the -undo option of Tk_Text is true, reapplies the last undone edits
   -- provided no other edits were done since then. Generates an error when
   -- the redo stack is empty. Does nothing when the -undo option of Tk_Text
   -- is false.
   -- PARAMETERS
   -- TextWidget - Tk_Text in which the last undone edit will be reapplied
   -- HISTORY
   -- 8.6.5 - Added
   -- EXAMPLE
   -- -- Reapply the last undone edit to the My_Text text
   -- Edit_Redo(My_Text);
   -- COMMANDS
   -- TextWidget edit redo
   -- SOURCE
   procedure Edit_Redo(TextWidget: in Tk_Text);
   -- ****

   -- ****f* Text/Text.Edit_Reset
   -- FUNCTION
   -- Clears the selected Tk_Text undo and redo stacks
   -- PARAMETERS
   -- TextWidget - Tk_Text which undo and redo stacks will be cleared
   -- HISTORY
   -- 8.6.5 - Added
   -- EXAMPLE
   -- -- Clear redo and undo stacks for the My_Text text
   -- Edit_Reset(My_Text);
   -- COMMANDS
   -- TextWidget edit reset
   -- SOURCE
   procedure Edit_Reset(TextWidget: in Tk_Text);
   -- ****

   -- ****f* Text/Text.Edit_Separator
   -- FUNCTION
   -- Inserts a separator (boundary) on the undo stack. Does nothing when the
   -- -undo option is false
   -- PARAMETERS
   -- TextWidget - Tk_Text in which the separator will be inserted
   -- HISTORY
   -- 8.6.5 - Added
   -- EXAMPLE
   -- -- Add a separator to the My_Text text undo stack
   -- Edit_Separator(My_Text);
   -- COMMANDS
   -- TextWidget edit separator
   -- SOURCE
   procedure Edit_Separator(TextWidget: in Tk_Text);
   -- ****

   -- ****f* Text/Text.Edit_Undo
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
   -- EXAMPLE
   -- -- Undo the last edit in My_Text text
   -- Edit_Undo(My_Text);
   -- COMMANDS
   -- TextWidget edit undo
   -- SOURCE
   procedure Edit_Undo(TextWidget: in Tk_Text);
   -- ****

   -- ****f* Text/Text.Get
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
   -- EXAMPLE
   -- -- Get the 6th character in 5th line in My_Text text
   -- Char: constant String := Get(My_Text, "5.5");
   -- COMMANDS
   -- TextWidget get options
   -- SOURCE
   function Get(TextWidget: in Tk_Text; Options: in String) return String with
      Pre => Options /= "";
      -- ****

      -- ****f* Text/Text.Image_Cget
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
      -- EXAMPLE
      -- -- Get the name of the image at 6th character in second line in My_Text text
      -- Image_Name: constant String := Image_Cget(My_Text, "2.5", "-name");
      -- COMMANDS
      -- TextWidget image cget index option
      -- SEE ALSO
      -- Text.Image_Configure_(function)
      -- SOURCE
   function Image_Cget
     (TextWidget: in Tk_Text; Index, Option: in String) return String with
      Pre => Index /= "" and Option /= "";
      -- ****

      -- ****f* Text/Text.Image_Configure_(procedure)
      -- FUNCTION
      -- Configure the selected options of the selected image in the selected
      -- Tk_Text
      -- PARAMETERS
      -- TextWidget - Tk_Text in which the image's options will be set
      -- Index      - Index of the image which options will be set
      -- Options    - Options in "name value" pairs to set
      -- HISTORY
      -- 8.6.5 - Added
      -- EXAMPLE
      -- -- Set the name of the image at first character in first line in My_Text text
      -- Image_Configure(My_Text, "1.0", "-name myimage");
      -- COMMANDS
      -- TextWidget image configure index options
      -- SEE ALSO
      -- Text.Image_Configure_(function)
      -- SOURCE
   procedure Image_Configure
     (TextWidget: in Tk_Text; Index, Options: in String) with
      Pre => Index /= "" and Options /= "";
      -- ****

      -- ****f* Text/Text.Image_Configure_(function)
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
      -- EXAMPLE
      -- -- Get the name of Tk image which is in My_Text text at 10th character in 8th line
      -- Image_Name: constant String := Image_Configure(My_Text, "8.9", "-image");
      -- COMMANDS
      -- TextWidget image configure index ?options?
      -- SEE ALSO
      -- Text.Image_Configure_(procedure), Text.Image_Cget
      -- SOURCE
   function Image_Configure
     (TextWidget: in Tk_Text; Index: in String; Option: in String := "")
      return String with
      Pre => Index /= "";
      -- ****

      -- ****f* Text/Text.Image_Create
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
      -- EXAMPLE
      -- -- Create image named myimage from image otherimage at first character in first line in My_Text text
      -- Image_Create(My_Text, "1.0", "-image otherimage -name myimage");
      -- COMMANDS
      -- TextWidget image create index ?options?
      -- SOURCE
   function Image_Create
     (TextWidget: in Tk_Text; Index: in String; Options: in String := "")
      return String with
      Pre => Index /= "";
      -- ****

      -- ****f* Text/Text.Image_Names
      -- FUNCTION
      -- Get the names of the all images which are embedded in the Tk_Text
      -- PARAMETERS
      -- TextWidget - Tk_Text which will be queried for images names
      -- RESULT
      -- The list of all images names currently embedded into TextWidget
      -- HISTORY
      -- 8.6.5 - Added
      -- EXAMPLE
      -- -- Get the names of all images in the My_Text text
      -- Names: constant String := Image_Names(My_Text);
      -- COMMANDS
      -- TextWidget image names
      -- SOURCE
   function Image_Names(TextWidget: in Tk_Text) return String;
   -- ****

   -- ****f* Text/Text.Index
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
   -- EXAMPLE
   -- -- Get the index of the image myimage in My_Text text
   -- Image_Index: constant String := Index(My_Text, "myimage");
   -- COMMANDS
   -- TextWidget index index
   -- SOURCE
   function Index
     (TextWidget: in Tk_Text; TextIndex: in String) return String with
      Pre => TextIndex /= "";
      -- ****

      -- ****f* Text/Text.Insert
      -- FUNCTION
      -- Insert text into text widget at selected index
      -- PARAMETERS
      -- TextWidget - Tk_Text to which text will be inserted
      -- Index      - Tk_Text position on which text will be inserted. Lines
      --              starts from 1, characters starts from 0
      -- Text       - Text to insert to Tk_Text widget and if needed, tags for
      --              the text to insert
      -- HISTORY
      -- 8.6.1 - Added
      -- EXAMPLE
      -- Insert hello world at the ent of the My_Text text
      -- Insert(My_Text, "end", "{hello world}");
      -- COMMANDS
      -- TextWidget insert index text
      -- SOURCE
   procedure Insert(TextWidget: in Tk_Text; Index, Text: in String) with
      Pre => Index /= "" and Text /= "";
      -- ****

      -- ****f* Text/Text.Mark_Gravity_(procedure)
      -- FUNCTION
      -- Set to which adjacent character the selected mark is attached
      -- PARAMETERS
      -- TextWidget - Tk_Text in which mark gravity will be set
      -- MarkName   - Name of mark which gravity will be set
      -- Direction  - A new value for the gravity of the mark. Can be "left" or
      --              "right"
      -- HISTORY
      -- 8.6.5 - Added
      -- EXAMPLE
      -- -- Set the mark mymark gravity to left in My_Text text
      -- Mark_Gravity(My_Text, "mymark", "left");
      -- COMMANDS
      -- TextWidget mark gravity markName direction
      -- SEE ALSO
      -- Text.Mark_Gravity_(function)
      -- SOURCE
   procedure Mark_Gravity
     (TextWidget: in Tk_Text; MarkName, Direction: in String) with
      Pre => MarkName /= "" and Direction in "left" | "right";
      -- ****

      -- ****f* Text/Text.Mark_Gravity_(function)
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
      -- EXAMPLE
      -- -- Get the gravity of mark mymark in My_Text text
      -- Gravity: constant String := Mark_Gravity(My_Text, "mymark");
      -- COMMANDS
      -- TextWidget mark gravity markName
      -- SEE ALSO
      -- Text.Mark_Gravity_(procedure)
      -- SOURCE
   function Mark_Gravity
     (TextWidget: in Tk_Text; MarkName: in String) return String with
      Pre => MarkName /= "";
      -- ****

      -- ****f* Text/Text.Mark_Names
      -- FUNCTION
      -- Get names of all marks that are currently set
      -- PARAMETERS
      -- TextWidget - Tk_Text which will be queried for names
      -- RESULT
      -- List of names of all existing marks in the TextWidget
      -- HISTORY
      -- 8.6.5 - Added
      -- EXAMPLE
      -- -- Get the name of the all marks in the My_Text text
      -- Marks_Names: constant String := Mark_Names(My_Text);
      -- COMMANDS
      -- TextWidget mark names
      -- SOURCE
   function Mark_Names(TextWidget: in Tk_Text) return String;
   -- ****

   -- ****f* Text/Text.Mark_Next
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
   -- EXAMPLE
   -- -- Get the next mark name after 6th character in 4th line in My_Text text
   -- Mark_Name: constant String := Mark_Next(My_Text, "4.5");
   -- COMMANDS
   -- TextWidget mark next index
   -- SEE ALSO
   -- Text.Mark_Previous
   -- SOURCE
   function Mark_Next
     (TextWidget: in Tk_Text; Index: in String) return String with
      Pre => Index /= "";
      -- ****

      -- ****f* Text/Text.Mark_Previous
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
      -- EXAMPLE
      -- -- Get the previous mark name before last character in My_Text text
      -- Mark_Name: constant String := Mark_Previous(My_Text, "end");
      -- COMMANDS
      -- TextWidget mark previous index
      -- SEE ALSO
      -- Text.Mark_Next
      -- SOURCE
   function Mark_Previous
     (TextWidget: in Tk_Text; Index: in String) return String with
      Pre => Index /= "";
      -- ****

      -- ****f* Text/Text.Mark_Set
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
      -- EXAMPLE
      -- -- Set the mymark mark at start of the My_Text text
      -- Mark_Set(My_Text, "mymark", "1.0");
      -- COMMANDS
      -- TextWidget mark set markName index
      -- SOURCE
   procedure Mark_Set(TextWidget: in Tk_Text; MarkName, Index: in String) with
      Pre => MarkName /= "" and Index /= "";
      -- ****

      -- ****f* Text/Text.Mark_Unset
      -- FUNCTION
      -- Remove the selected mark(s) from the selected Tk_Text
      -- PARAMETERS
      -- TextWidget - Tk_Text from which the selected mark(s) will be removed
      -- MarkName   - Name(s) of the marks to remove. If more than one mark
      --              should be removed, separate they name by space
      -- HISTORY
      -- 8.6.5 - Added
      -- EXAMPLE
      -- -- Remove mymark mark from the My_Text text
      -- Mark_Unset(My_Text, "mymark");
      -- COMMANDS
      -- pathName mark unset markName
      -- SOURCE
   procedure Mark_Unset(TextWidget: in Tk_Text; MarkName: in String) with
      Pre => MarkName /= "";
      -- ****

      -- ****f* Text/Text.Peer_Create
      -- FUNCTION
      -- Create a new peer text widget with the selected name and options
      -- PARAMETERS
      -- TextWidget  - Tk_Text for which peer widget will be created
      -- NewPathName - A name of a peer widget to create
      -- Options     - Standard options for Tk_Text widget passed to the new
      --               peer widget. Can be empty. Default value is empty
      -- HISTORY
      -- 8.6.5 - Added
      -- EXAMPLE
      -- -- Create a peer text with pathname .mynewpeer from My_Text text
      -- Peer_Create(My_Text, ".mynewpeer");
      -- COMMANDS
      -- TextWidget peer create newPathName ?options?
      -- SOURCE
   procedure Peer_Create
     (TextWidget: in Tk_Text; NewPathName: in String;
      Options: in String := "") with
      Pre => NewPathName /= "";
      -- ****

      -- ****f* Text/Text.Peer_Names
      -- FUNCTION
      -- Get the list of names of all peers widgets for the selected Tk_Text
      -- PARAMETERS
      -- TextWidget - Tk_Text which peers will be queried
      -- RESULT
      -- List of names of all peers of the selected TextWidget or {} if no
      -- peers are available. Order of the list is undefined
      -- HISTORY
      -- 8.6.5 - Added
      -- EXAMPLE
      -- -- Get the names of all peers for My_Text text
      -- Names: constant String := Peer_Names(My_Text);
      -- COMMANDS
      -- TextWidget peer names
      -- SOURCE
   function Peer_Names(TextWidget: in Tk_Text) return String;
   -- ****

   -- ****f* Text/Text.PendingSync
   -- FUNCTION
   -- Check if line heights calculation is up to date or not
   -- PARAMETERS
   -- TextWidget - Tk_Text which state of synchronization will be check
   -- RESULT
   -- "1" if line heights calculations is not up to date or "0" if is
   -- synchronized
   -- HISTORY
   -- 8.6.5 - Added
   -- EXAMPLE
   -- -- Check if line height calculation for My_Text text is up to date or not
   -- Sync_Status: constant String := PendingSync(My_Text);
   -- COMMANDS
   -- TextWidget pendingsync
   -- SOURCE
   function PendingSync(TextWidget: in Tk_Text) return String;
   -- ****

   -- ****f* Text/Text.Replace
   -- FUNCTION
   -- Replace range of characters with new characters and tags
   -- PARAMETERS
   -- TextWidget - Tk_Text in which characters will be replaced
   -- Index1     - Index of the first character to replace
   -- Index2     - Index of the last character to replace
   -- Chars      - Characters and tags which will replace current characters
   -- HISTORY
   -- 8.6.5 - Added
   -- EXAMPLE
   -- -- Replace first 5 characters in the first line in the My_Text text with newtex text
   -- Replace(My_Text, "1.0", "1.4", "{newtex}");
   -- COMMANDS
   -- TextWidget replace index1 index2 chars
   -- SOURCE
   procedure Replace
     (TextWidget: in Tk_Text; Index1, Index2, Chars: in String) with
      Pre => Index1 /= "" and Index2 /= "" and Chars /= "";
      -- ****

      -- ****f* Text/Text.Scan_Mark
      -- FUNCTION
      -- Sets starting position for scan in the selected Tk_Text
      -- PARAMETERS
      -- TextWidget - Tk_Text in which mark will be set
      -- X          - X coordinate of the mark to set
      -- Y          - Y coordinate of the mark to set
      -- HISTORY
      -- 8.6.5 - Added
      -- EXAMPLE
      -- -- Set the scan mark to the top left corner of My_Text text
      -- Scan_Mark(My_Text, "0", "0");
      -- COMMANDS
      -- TextWidget scan mark x y
      -- SEE ALSO
      -- Text.Scan_DragTo
      -- SOURCE
   procedure Scan_Mark(TextWidget: in Tk_Text; X, Y: in String) with
      Pre => X /= "" and Y /= "";
      -- ****

      -- ****f* Text/Text.Scan_DragTo
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
      -- EXAMPLE
      -- -- Drag view of My_Text text to point (24, 28)
      -- Scan_DragTo(My_Text, "24", "28");
      -- COMMANDS
      -- TextWidget scan dragto x y
      -- SEE ALSO
      -- Text.Scan_Mark
      -- SOURCE
   procedure Scan_DragTo(TextWidget: in Tk_Text; X, Y: in String) with
      Pre => X /= "" and Y /= "";
      -- ****

      -- ****f* Text/Text.Search
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
      -- EXAMPLE
      -- -- Search the My_Text text for word hello forward from the first element in the second line
      -- Result := constant String := Search(My_Text, "-forwards", "{hello}", "2.0");
      -- COMMANDS
      -- TextWidget search ?switches? pattern index ?stopIndex?
      -- SOURCE
   function Search
     (TextWidget: in Tk_Text; Switches: in String := "";
      Pattern, Index: in String; StopIndex: in String := "") return String with
      Pre => Pattern /= "" and Index /= "";
      -- ****

      -- ****f* Text/Text.See
      -- FUNCTION
      -- Made the selected character visible (scroll Tk_Text to it if needed)
      -- PARAMETERS
      -- TextWidget - Tk_Text in which the selected character will be visible
      -- Index      - Index of character show show
      -- HISTORY
      -- 8.6.5 - Added
      -- EXAMPLE
      -- -- Scroll My_Text text so 5th character in 10th line will be visible
      -- See(My_Text, "10.4");
      -- COMMANDS
      -- TextWidget see index
      -- SOURCE
   procedure See(TextWidget: in Tk_Text; Index: in String) with
      Pre => Index /= "";
      -- ****

      -- ****f* Text/Text.Sync
      -- FUNCTION
      -- Update line metrics by computing lines heights
      -- PARAMETERS
      -- TextWidget - Tk_Text which line metrics will be updated
      -- HISTORY
      -- 8.6.5 - Added
      -- EXAMPLE
      -- -- Update line metrics for the My_Text text
      -- Sync(My_Text);
      -- COMMANDS
      -- TextWidget sync
      -- SEE ALSO
      -- Text.Sync_Command
      -- SOURCE
   procedure Sync(TextWidget: in Tk_Text);
   -- ****

   -- ****f* Text/Text.Sync_Command
   -- FUNCTION
   -- Execute the selected Tcl command once all lines heights are up to date
   -- PARAMETERS
   -- TextWidget - Tk_Text in which command will be executed
   -- Command    - Tcl command to execute
   -- HISTORY
   -- 8.6.5 - Added
   -- EXAMPLE
   -- -- Update line metrics for the My_Text text and execute commands Save
   -- Sync_Command(My_Text, "Save");
   -- COMMANDS
   -- TextWidget sync -command command sync -command command
   -- SEE ALSO
   -- Text.Sync
   -- SOURCE
   procedure Sync_Command(TextWidget: in Tk_Text; Command: in String) with
      Pre => Command /= "";
      -- ****

      -- ****f* Text/Text.Tag_Add
      -- FUNCTION
      -- Add the selected tag to the text in Tk_Text
      -- PARAMETERS
      -- TextWidget - Tk_Text in which the new tag will be added
      -- TagName    - Name of the tag to add
      -- StartIndex - Starting position on which add the tag
      -- Indexes    - End position for adding the tag or more ranges for add
      --              the tag. If empty, tag will be added only for one
      --              character. Default value is empty
      -- HISTORY
      -- 8.6.3 - Added
      -- EXAMPLE
      -- -- Add tag mytag to the first 10 items in first line in My_Text text
      -- Tag_Add(My_Text, "mytag", "1.0", "1.9");
      -- COMMANDS
      -- TextWidget tag add tagName startindex ?indexes?
      -- SOURCE
   procedure Tag_Add
     (TextWidget: in Tk_Text; TagName, StartIndex: in String;
      Indexes: in String := "") with
      Pre => TagName /= "" and StartIndex /= "";
      -- ****

      -- ****f* Text/Text.Tag_Bind_(procedure)
      -- FUNCTION
      -- Bind the selected script to the selected sequence on the selected tag
      -- PARAMETERS
      -- TextWidget - Tk_Text in which script will be bound
      -- TagName    - Name of the tag to which script will be bound
      -- Sequence   - Name of the sequence to which script will be bound
      -- Script     - Tcl commands which will be bound
      -- HISTORY
      -- 8.6.5 - Added
      -- EXAMPLE
      -- -- Execute command ShowMenu on left mouse click on the mytag tag in My_Text text
      -- Tag_Bind(My_Text, "mytag", "<1>", "ShowMenu");
      -- COMMANDS
      -- TextWidget tag bind tagName sequence script
      -- SEE ALSO
      -- Text.Tag_Bind_(function)
      -- SOURCE
   procedure Tag_Bind
     (TextWidget: in Tk_Text; TagName, Sequence, Script: in String) with
      Pre => TagName /= "" and Sequence /= "" and Script /= "";
      -- ****

      -- ****f* Text/Text.Tag_Bind_(function)
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
      -- EXECUTE
      -- -- Get the all binded sequences for the mytag tag in My_Text text
      -- Sequences: constant String := Tag_Bind(My_Text, "mytag");
      -- COMMANDS
      -- TextWidget tag bind tagName ?sequence?
      -- SEE ALSO
      -- Text.Tag_Bind_(procedure)
      -- SOURCE
   function Tag_Bind
     (TextWidget: in Tk_Text; TagName: in String; Sequence: in String := "")
      return String with
      Pre => TagName /= "";
      -- ****

      -- ****f* Text/Text.Tag_Cget
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
      -- EXAMPLE
      -- -- Get the Tk font name for mytag tag in My_Text text
      -- Font_Name: constant String := Tag_Cget(My_Text, "-font");
      -- COMMANDS
      -- TextWidget tag cget tagName option
      -- SEE ALSO
      -- Text.Tag_Configure_(function)
      -- SOURCE
   function Tag_Cget
     (TextWidget: in Tk_Text; TagName, Option: in String) return String with
      Pre => TagName /= "" and Option /= "";
      -- ****

      -- ****f* Text/Text.Tag_Configure_(procedure)
      -- FUNCTION
      -- Configure the selected tag in the selected Tk_Text widget
      -- PARAMETERS
      -- TextWidget - Tk_Text in which tag will be configured
      -- TagName    - Name of the tag to configure
      -- Options    - Tag options with values to set
      -- HISTORY
      -- 8.6.3 - Added
      -- EXAMPLE
      -- -- Set the font to the default Tk font for mytag tag in My_Text text
      -- Tag_Configure(My_Text, "mytag", "-font TkDefaultFont");
      -- COMMANDS
      -- TextWidget tag configure tagName options
      -- SEE ALSO
      -- Text.Tag_Configure_(function)
      -- SOURCE
   procedure Tag_Configure
     (TextWidget: in Tk_Text; TagName, Options: in String) with
      Pre => TagName /= "" and Options /= "";
      -- ****

      -- ****f* Text/Text.Tag_Configure_(function)
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
      -- HISTORY
      -- 8.6.3 - Added
      -- EXAMPLE
      -- -- Get the names and values of all available options for mytag tag in My_Text text
      -- Options: constant String := Tag_Configure(My_Text, "mytag");
      -- COMMANDS
      -- TextWidget tag configure tagName ?option?
      -- SEE ALSO
      -- Text.Tag_Cget, Text.Tag_Configure_(procedure)
      -- SOURCE
   function Tag_Configure
     (TextWidget: in Tk_Text; TagName: in String; Option: in String := "")
      return String with
      Pre => TagName /= "";
      -- ****

      -- ****f* Text/Text.Tag_Delete
      -- FUNCTION
      -- Delete the selected tag(s) from the selected Tk_Text
      -- PARAMETERS
      -- TextWidget - Tk_Text from which the selected tag(s) will be removed
      -- TagName    - Name of the tag to remove. It can be list of names
      --              separated by spaces
      -- HISTORY
      -- 8.6.5 - Added
      -- EXAMPLE
      -- -- Delete tag mytag in My_Text text
      -- Tag_Delete(My_Text, "mytag");
      -- COMMANDS
      -- TextWidget tag delete tagName
      -- SOURCE
   procedure Tag_Delete(TextWidget: in Tk_Text; TagName: in String) with
      Pre => TagName /= "";
      -- ****

      -- ****f* Text/Text.Tag_Lower
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
      -- EXAMPLE
      -- -- Move mytag tag below secondtag tag in My_Text text
      -- Tag_Lower(My_Text, "mytag", "secondtag");
      -- COMMANDS
      -- TextWidget tag lower tagName ?belowThis?
      -- SOURCE
   procedure Tag_Lower
     (TextWidget: in Tk_Text; TagName: in String;
      BelowThis: in String := "") with
      Pre => TagName /= "";
      -- ****

      -- ****f* Text/Text.Tag_Names
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
      -- EXAMPLE
      -- -- Get the names of all tags for first character in 10th line in My_Text text
      -- Names: constant String := Tag_Names(My_Text, "10.0");
      -- COMMANDS
      -- TextWidget tag names ?index?
      -- SOURCE
   function Tag_Names
     (TextWidget: in Tk_Text; Index: in String := "") return String;
     -- ****

     -- ****f* Text/Text.Tag_NextRange
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
     -- EXAMPLE
     -- -- Find the range with tag mytag in first line of My_Text text
     -- Range: constant String := Tag_NextRange(My_Text, "1.0", "1.end");
     -- COMMANDS
     -- TextWidget tag nextrange tagName index1 ?index2?
     -- SOURCE
   function Tag_NextRange
     (TextWidget: in Tk_Text; TagName, Index1: in String;
      Index2: in String := "") return String with
      Pre => TagName /= "" and Index1 /= "";
      -- ****

      -- ****f* Text/Text.Tag_PrevRange
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
      -- EXAMPLE
      -- -- Find the range with tag mytag in the whole My_Text text
      -- Range: constant String := Tag_PrevRange(My_Text, "end");
      -- COMMANDS
      -- TextWidget tag prevrange tagName index1 ?index2?
      -- SOURCE
   function Tag_PrevRange
     (TextWidget: in Tk_Text; TagName, Index1: in String;
      Index2: in String := "") return String with
      Pre => TagName /= "" and Index1 /= "";
      -- ****

      -- ****f* Text/Text.Tag_Raise
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
      -- EXAMPLE
      -- -- Make mytag tag the most prioritized tag in My_Text text
      -- Tag_Raise(My_Text, "mytag");
      -- COMMANDS
      -- TextWidget tag raise tagName ?aboveThis?
      -- SOURCE
   procedure Tag_Raise
     (TextWidget: in Tk_Text; TagName: in String;
      AboveThis: in String := "") with
      Pre => TagName /= "";
      -- ****

      -- ****f* Text/Text.Tag_Ranges
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
      -- EXAMPLE
      -- -- Get the ranges of character with mytag tag in My_Text text
      -- Ranges: Tag_Ranges(My_Text, "mytag");
      -- COMMANDS
      -- TextWidget tag ranges tagName
      -- SOURCE
   function Tag_Ranges
     (TextWidget: in Tk_Text; TagName: in String) return String with
      Pre => TagName /= "";
      -- ****

      -- ****f* Text/Text.Tag_Remove
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
      -- EXAMPLE
      -- -- Remove mytag tag from first ten characters in the first line in My_Text text
      -- Tag_Remove(My_Text, "mytag", "1.0", "1.9");
      -- COMMANDS
      -- TextWidget tag remove tagName index1 ?index2?
      -- SOURCE
   procedure Tag_Remove
     (TextWidget: in Tk_Text; TagName, Index1: in String;
      Index2: in String := "") with
      Pre => TagName /= "" and Index1 /= "";
      -- ****

      -- ****f* Text/Text.Window_Cget
      -- FUNCTION
      -- Get the selected option for the selected window in the selected Tk_Text
      -- PARAMETERS
      -- TextWidget - Tk_Text which will be queried for the option's value
      -- Index      - Index of the window which option's value will be get
      -- Option     - Name of the window's option to get
      -- RESULT
      -- Value of the selected Option of the selected window
      -- HISTORY
      -- 8.6.5 - Added
      -- EXAMPLE
      -- -- Get the align of the window from second line, third character in My_Text text
      -- Align: constant String := Window_Cget(My_Text, "2.2", "-align");
      -- COMMANDS
      -- TextWidget window cget index option
      -- SEE ALSO
      -- Text.Window_Configure_(function)
      -- SOURCE
   function Window_Cget
     (TextWidget: in Tk_Text; Index, Option: in String) return String with
      Pre => Index /= "" and Option /= "";
      -- ****

      -- ****f* Text/Text.Window_Configure_(procedure)
      -- FUNCTION
      -- Configure the selected options of the selected window in the selected
      -- Tk_Text
      -- PARAMETERS
      -- TextWidget - Tk_Text in which the window's options will be set
      -- Index      - Index of the window which options will be set
      -- Options    - Options in "name value" pairs to set
      -- HISTORY
      -- 8.6.5 - Added
      -- EXAMPLE
      -- -- Set the align to center for the window in third line and 8th character in My_Text text
      -- Window_Configure(My_Text, "3.7", "-align center");
      -- COMMANDS
      -- TextWidget window configure index options
      -- SEE ALSO
      -- Text.Window_Configure_(function)
      -- SOURCE
   procedure Window_Configure
     (TextWidget: in Tk_Text; Index, Options: in String) with
      Pre => Index /= "" and Options /= "";
      -- ****

      -- ****f* Text/Text.Window_Configure_(function)
      -- FUNCTION
      -- Get the selected options of the selected window in the selected Tk_Text
      -- PARAMETERS
      -- TextWidget - Tk_Text in which the window's options will be get
      -- Index      - Index of the window which options will be get
      -- Options    - Option name to get or empty string to get all available
      --              options. Default value is empty
      -- RESULT
      -- Value of selected option or values of all options if Option is empty
      -- string
      -- HISTORY
      -- 8.6.5 - Added
      -- EXAMPLE
      -- -- Get the window name of the window in sixth line and first character in My_Text text
      -- Window_Name: constant String := Window_Configure(My_Text, "6.0", "-window");
      -- COMMANDS
      -- TextWidget window configure index ?option?
      -- SEE ALSO
      -- Text.Window_Cget, Text.Window_Configure_(procedure)
      -- SOURCE
   function Window_Configure
     (TextWidget: in Tk_Text; Index: in String; Option: in String := "")
      return String with
      Pre => Index /= "";
      -- ****

      -- ****f* Text/Text.Window_Create
      -- FUNCTION
      -- Create a new window inside Tk_Text at the selected index
      -- PARAMETERS
      -- TextWidget - Tk_Text in which a window will be created
      -- Index      - Index in the TextWidget at which a window will be created
      -- Options    - Options for the newly created window
      -- RESULT
      -- Unique identifier for the newly created window
      -- HISTORY
      -- 8.6.5 - Added
      -- EXAMPLE
      -- -- Create a new window from widget .mywindow in top left corner of the My_Text text
      -- Window_Create(My_Text, "1.0", "-window .mywindow");
      -- COMMANDS
      -- TextWidget window create index ?options?
      -- SOURCE
   function Window_Create
     (TextWidget: in Tk_Text; Index: in String; Options: in String := "")
      return String with
      Pre => Index /= "";
      -- ****

      -- ****f* Text/Text.Window_Names
      -- FUNCTION
      -- Get the names of the all windows which are embedded in the Tk_Text
      -- PARAMETERS
      -- TextWidget - Tk_Text which will be queried for windows names
      -- RESULT
      -- The list of all windows names currently embedded into TextWidget
      -- HISTORY
      -- 8.6.5 - Added
      -- EXAMPLE
      -- -- Get the names of windows in My_Text text
      -- Names: constant String := Window_Names(My_Text);
      -- COMMANDS
      -- TextWidget window names
      -- SOURCE
   function Window_Names(TextWidget: in Tk_Text) return String;
   -- ****

   -- ****f* Text/Text.XView
   -- FUNCTION
   -- Get which horizontal fraction of the Tk_Text is visible
   -- PARAMETERS
   -- TextWidget - Tk_Text which will be queried for visibility
   -- RESULT
   -- Pair of elements: first element is the start of horizontal fraction of
   -- the TextWidget which is visible, second is the end of horizontal
   -- fraction of the TextWidget which is visible.
   -- HISTORY
   -- 8.6.5 - Added
   -- EXAMPLE
   -- -- Get the horizontal fraction of the My_Text text
   -- Horizontal_Fraction: constant String := XView(My_Text);
   -- COMMANDS
   -- TextWidget xview
   -- SEE ALSO
   -- Text.YView
   -- SOURCE
   function XView(TextWidget: in Tk_Text) return String;
   -- ****

   -- ****f* Text/Text.Xview_Move_To
   -- FUNCTION
   -- Adjusts the view in the window so that fraction of the total width of
   -- the Tk_Text is off-screen to the left.
   -- PARAMETERS
   -- TextWidget - Tk_Text which view will be adjusted
   -- Fraction   - Fraction of the TextWidget to move. Must be between 0
   --              and 1
   -- HISTORY
   -- 8.6.5 - Added
   -- EXAMPLE
   -- -- Show the first half of the text My_Text
   -- Xview_Move_To(My_Text, "0.5");
   -- COMMANDS
   -- TextWidget xview moveto fraction
   -- SEE ALSO
   -- Text.Yview_Move_To
   -- SOURCE
   procedure Xview_Move_To(TextWidget: in Tk_Text; Fraction: in String) with
      Pre => Fraction /= "";
      -- ****

      -- ****f* Text/Text.Xview_Scroll
      -- FUNCTION
      -- Shift the view in the window on left or right according to Number and
      -- What.
      -- PARAMETERS
      -- TextWidget - Tk_Text which view will be shifted
      -- Number     - The amount of What to shift the TextWidget
      -- What       - Type of amount to move. Can be "units" or "pages"
      -- HISTORY
      -- 8.6.5 - Added
      -- EXAMPLE
      -- -- Move the view in the My_Text text by 10 units to right
      -- Xview_Scroll(My_Text, "10", "units");
      -- COMMANDS
      -- TextWidget xview scroll number what
      -- SEE ALSO
      -- Text.Yview_Scroll
      -- SOURCE
   procedure Xview_Scroll(TextWidget: in Tk_Text; Number, What: in String) with
      Pre => Number /= "" and (What = "units" or What = "pages");
      -- ****

      -- ****f* Text/Text.YView
      -- FUNCTION
      -- Get which vertical fraction of the Tk_Text is visible
      -- PARAMETERS
      -- TextWidget - Tk_Text which will be queried for visibility
      -- RESULT
      -- Pair of elements: first element is the start of vertical fraction of
      -- the TextWidget which is visible, second is the end of vertical
      -- fraction of the TextWidget which is visible.
      -- HISTORY
      -- 8.6.5 - Added
      -- EXAMPLE
      -- -- Get the vertical fraction of the My_Text text
      -- Vertical_Fraction: constant String := YView(My_Text);
      -- COMMANDS
      -- TextWidget yview
      -- SEE ALSO
      -- Text.XView
      -- SOURCE
   function YView(TextWidget: in Tk_Text) return String;
   -- ****

   -- ****f* Text/Text.Yview_Move_To
   -- FUNCTION
   -- Adjusts the view in the window so that fraction of the total height of
   -- the Tk_Text is off-screen to the top.
   -- PARAMETERS
   -- TextWidget - Tk_Text which view will be adjusted
   -- Fraction   - Fraction of the TextWidget to move. Must be between 0
   --              and 1
   -- HISTORY
   -- 8.6.5 - Added
   -- EXAMPLE
   -- -- Show the first half of the text My_Text
   -- Yview_Move_To(My_Text, "0.5");
   -- COMMANDS
   -- TextWidget yview moveto fraction
   -- SEE ALSO
   -- Text.Xview_Move_To
   -- SOURCE
   procedure Yview_Move_To(TextWidget: in Tk_Text; Fraction: in String) with
      Pre => Fraction /= "";
      -- ****

      -- ****f* Text/Text.Yview_Scroll
      -- FUNCTION
      -- Shift the view in the window on top or bottom according to Number and
      -- What.
      -- PARAMETERS
      -- TextWidget - Tk_Text which view will be shifted
      -- Number     - The amount of What to shift the TextWidget
      -- What       - Type of amount to move. Can be "units" or "pages"
      -- HISTORY
      -- 8.6.5 - Added
      -- EXAMPLE
      -- -- Move the view in the My_Text text by 10 units to top
      -- Yview_Scroll(My_Text, "-10", "units");
      -- COMMANDS
      -- TextWidget yview scroll number what
      -- SEE ALSO
      -- Text.Xview_Scroll
      -- SOURCE
   procedure Yview_Scroll(TextWidget: in Tk_Text; Number, What: in String) with
      Pre => Number /= "" and (What = "units" or What = "pages");
      -- ****

private

   type Tk_Text is new Tk_Widget with null record;

end Tcl.Tk.Ada.Widgets.Text;

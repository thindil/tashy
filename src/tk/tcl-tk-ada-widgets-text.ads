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

   -- ****f* Text/Create
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
   -- RESULT
   -- Newly created Tk_Text
   -- SOURCE
   overriding function Create
     (pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) return Tk_Text with
      Pre => pathName /= "";
   overriding procedure Create
     (Widgt: out Tk_Text; pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) with
      Pre => pathName /= "";
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

      -- ****f* Text/Tag_Configure
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

      -- ****f* Text/Tag_Configure2
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

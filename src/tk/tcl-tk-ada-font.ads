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

with Tcl.Tk.Ada.Widgets; use Tcl.Tk.Ada.Widgets;

-- ****h* TkAda/Font
-- FUNCTION
-- Provides code for manipulate Tk command Font
-- SOURCE
package Tcl.Tk.Ada.Font is
-- ****

   -- ****f* Font/Actual (current interpreter)
   -- FUNCTION
   -- Get the actual attributes of the selected font in the current interpreter
   -- PARAMETERS
   -- FontDescription - Font description (in Tk term, can be name or
   --                   declaration)
   -- Options         - Options passed to the command font actual. Can be
   --                   empty. Default value is empty
   -- RESULT
   -- If attribute is not specified, return all possible attributes with their
   -- values. Otherwise return value of the selected attribute
   -- HISTORY
   -- 8.6.6 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   function Actual
     (FontDescription: in String; Options: in String := "") return String with
      Pre => FontDescription /= "";
      -- ****

   -- ****f* Font/Actual (selected interpreter)
   -- FUNCTION
   -- Get the actual attributes of the selected font in the current interpreter
   -- PARAMETERS
   -- Interp          - Tcl interpreter on which font will be check
   -- FontDescription - Font description (in Tk term, can be name or
   --                   declaration)
   -- Options         - Options passed to the command font actual. Can be
   --                   empty. Default value is empty
   -- RESULT
   -- If attribute is not specified, return all possible attributes with their
   -- values. Otherwise return value of the selected attribute
   -- HISTORY
   -- 8.6.6 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   function Actual
     (Interp: in Tcl_Interp; FontDescription: in String;
      Options: in String := "") return String with
      Pre => FontDescription /= "";
      -- ****

      -- ****f* Font/Configure (procedure)
      -- FUNCTION
      -- Set the selected options for the selected font in the selected Tcl
      -- interpreter
      -- PARAMETERS
      -- FontName - Name of the font which options will be modified
      -- Options  - Names and new values for the options to set
      -- Interp   - Tcl interpreter on which the selected font is. Default
      --            value is current interpreter
      -- HISTORY
      -- 8.6.6 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   procedure Configure
     (FontName, Options: in String; Interp: Tcl_Interp := Get_Context) with
      Pre => FontName /= "" and Options /= "";
      -- ****

      -- ****f* Font/Configure (procedure)
      -- FUNCTION
      -- Get the selected options for the selected font in the selected Tcl
      -- interpreter
      -- PARAMETERS
      -- FontName - Name of the font which options will be modified
      -- Option   - Name of the option which value will be taken. Default
      --            value is empty
      -- Interp   - Tcl interpreter on which the selected font is. Default
      --            value is current interpreter
      -- RESULT
      -- If Option is empty return list of all available options and their
      -- values. Otherwise return value of the selected option
      -- HISTORY
      -- 8.6.6 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Configure
     (FontName: in String; Option: in String := "";
      Interp: Tcl_Interp := Get_Context) return String with
      Pre => FontName /= "";
      -- ****

      -- ****f* Font/Create (procedure)
      -- FUNCTION
      -- Create the new font with the selected name and options
      -- PARAMETERS
      -- FontName - Name of the font to create
      -- Options  - Options to set for the font. Can be empty. Default value
      --            is empty
      -- Interp   - Tcl interpreter on which the font will be created is.
      --            Default value is current interpreter
      -- HISTORY
      -- 8.6.6 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   procedure Create
     (FontName: in String; Options: in String := "";
      Interp: Tcl_Interp := Get_Context) with
      Pre => FontName /= "";
      -- ****

      -- ****f* Font/Create (function)
      -- FUNCTION
      -- Create the new font with the selected name and options
      -- PARAMETERS
      -- FontName - Name of the font to create. Can be empty. Default value
      --            is empty
      -- Options  - Options to set for the font. Can be empty. Default value
      --            is empty
      -- Interp   - Tcl interpreter on which the font will be created is.
      --            Default value is current interpreter
      -- RESULT
      -- The name of newly created font. If FontName is empty, the new font
      -- name has form "fontx" where x is an integer.
      -- HISTORY
      -- 8.6.6 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Create
     (FontName, Options: in String := ""; Interp: Tcl_Interp := Get_Context)
      return String;
      -- ****

      -- ****f* Font/Delete
      -- FUNCTION
      -- Delete the selected font(s)
      -- PARAMETERS
      -- FontName - Name (or names) of the font(s) to delete
      -- Interp   - Tcl interpreter on which the font(s) will be deleted.
      --            Default value is current interpreter
      -- HISTORY
      -- 8.6.6 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   procedure Delete
     (FontName: in String; Interp: Tcl_Interp := Get_Context) with
      Pre => FontName /= "";
      -- ****

      -- ****f* Font/Families (current interpreter main window)
      -- FUNCTION
      -- Get all font families names available at the current interpreter main
      -- window
      -- RESULT
      -- List of case-insensitives names of available fonts
      -- HISTORY
      -- 8.6.6 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Families return String;
   -- ****

   -- ****f* Font/Families (selected window)
   -- FUNCTION
   -- Get all font families names available at the selected window
   -- PARAMETERS
   -- Widget - Tk_Widget which will be queried for the available fonts families
   -- RESULT
   -- List of case-insensitives names of available fonts
   -- HISTORY
   -- 8.6.6 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   function Families(Widget: Tk_Widget'Class) return String;
   -- ****

   -- ****f* Font/Measure (selected interpreter main window)
   -- FUNCTION
   -- Get the width in pixels of selected text with the selected font
   -- PARAMETERS
   -- Font   - The font description used to measure width of text
   -- Text   - The text which width will be measured
   -- Interp - Tcl interpreter on which measuring will be done. Can be empty.
   --          Default value is the current interpreter
   -- RESULT
   -- Width in pixels of the selected text with the selected font
   -- HISTORY
   -- 8.6.6 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   function Measure
     (Font, Text: in String; Interp: Tcl_Interp := Get_Context)
      return String with
      Pre => Font /= "" and Text /= "";
      -- ****

      -- ****f* Font/Measure (selected window)
      -- FUNCTION
      -- Get the width in pixels of selected text with the selected font
      -- PARAMETERS
      -- Font   - The font description used to measure width of text
      -- Text   - The text which width will be measured
      -- Widget - Tk_Widget in which the Text will be measured
      -- RESULT
      -- Width in pixels of the selected text with the selected font
      -- HISTORY
      -- 8.6.6 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Measure
     (Font, Text: in String; Widget: Tk_Widget'Class) return String with
      Pre => Font /= "" and Text /= "";
      -- ****

      -- ****f* Font/Metrics (selected intepreter)
      -- FUNCTION
      -- Get the metrics of the selected font
      -- PARAMETERS
      -- Font   - The font which options will be queried
      -- Option - The font option to take. Can be empty. Default value is empty
      -- Interp - Tcl interpreter on which the font will be queried
      -- RESULT
      -- If Option is empty, return all metrics as list of pairs name, value.
      -- Otherwise return value of the selected option
      -- 8.6.6 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Metrics
     (Font: in String; Option: in String := "";
      Interp: Tcl_Interp := Get_Context) return String with
      Pre => Font /= "";
      -- ****

      -- ****f* Font/Metrics (selected window)
      -- FUNCTION
      -- Get the metrics of the selected font
      -- PARAMETERS
      -- Font   - The font which options will be queried
      -- Option - The font option to take. Can be empty. Default value is empty
      -- Widget - Tk_Widget in which the font will be queried
      -- RESULT
      -- If Option is empty, return all metrics as list of pairs name, value.
      -- Otherwise return value of the selected option
      -- 8.6.6 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Metrics
     (Font: in String; Option: in String := ""; Widget: Tk_Widget'Class)
      return String with
      Pre => Font /= "";
      -- ****

end Tcl.Tk.Ada.Font;

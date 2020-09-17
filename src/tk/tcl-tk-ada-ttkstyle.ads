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

-- ****h* TkAda/TtkStyle
-- FUNCTION
-- Provides code for manipulate Tk command ttk::style
-- SOURCE
package Tcl.Tk.Ada.TtkStyle is
-- ****

   -- ****f* TtkStyle/Element_Create
   -- FUNCTION
   -- Creates a new element in the current theme of the selected type
   -- PARAMETERS
   -- Name         - Name of the element to create
   -- Element_Type - Type of the element to create
   -- Options      - Additional options for the created element
   -- HISTORY
   -- 8.6.3 - Added
   -- EXAMPLE
   -- -- Create a new element with name My_Image and type of image from image named someimage
   -- Element_Create("My_Image", "image", "someimage");
   -- COMMANDS
   -- ttk::style element create name element_type ?options?
   -- SOURCE
   procedure Element_Create
     (Name, Element_Type: in String; Options: in String := "") with
      Pre => Name /= "" and Element_Type /= "";
      -- ****

      -- ****f* TtkStyle/Element_Names
      -- FUNCTION
      -- Return list of elements in the current theme
      -- HISTORY
      -- 8.6.3 - Added
      -- EXAMPLE
      -- -- Get the list of available elements
      -- Names: constant String := Element_Names;
      -- COMMAND
      -- ttk::style element names
      -- SOURCE
   function Element_Names return String;
   -- ****

   -- ****f* TtkStyle/Element_Options
   -- FUNCTION
   -- Get options set for the selected element in current theme
   -- PARAMETERS
   -- Element - Name of the element to query
   -- RESULT
   -- List of element options
   -- HISTORY
   -- 8.6.3 - Added
   -- EXAMPLE
   -- -- Get the options for the element named Entry
   -- Options: constant String := Element_Options("Entry");
   -- COMMANDS
   -- ttk::style element options element
   -- SOURCE
   function Element_Options(Element: in String) return String with
      Pre => Element /= "";
      -- ****

      -- ****f* TtkStyle/Style_Configure
      -- FUNCTION
      -- Configure selected or create new Ttk style
      -- PARAMETERS
      -- Name    - Name of style to configure or create
      -- Options - Options for the style
      -- HISTORY
      -- 8.6.1 - Added
      -- EXAMPLE
      -- -- Set padding for TButton to 4px in each direction
      -- Style_Configure("TButton", "-padding {4 4 4 4}");
      -- COMMANDS
      -- ttk::style configure name options
      -- SOURCE
   procedure Style_Configure(Name, Options: in String) with
      Pre => Name /= "" and Options /= "";
      -- ****

      -- ****f* TtkStyle/Style_Layout (procedure)
      -- FUNCTION
      -- Define widget layout style for the selected style
      -- PARAMETERS
      -- Name    - Name of the style to modify
      -- Options - Options for the layout
      -- HISTORY
      -- 8.6.2 - Added
      -- EXAMPLE
      -- -- Define layout for the TButton in the current theme
      -- Style_Layout("TButton", "{Button.button -children { Button.padding -children { Button.label -side left -expand true } } }");
      -- COMMANDS
      -- ttk::style layout name options
      -- SOURCE
   procedure Style_Layout(Name, Options: in String) with
      Pre => Name /= "" and Options /= "";
      -- ****

      -- ****f* TtkStyle/Style_Layout (function)
      -- FUNCTION
      -- Get widget layout for the selected style
      -- PARAMETERS
      -- Name - Name of the style to query
      -- RESULT
      -- String with layout setting for the selected style
      -- HISTORY
      -- 8.6.2 - Added
      -- EXAMPLE
      -- -- Get the layout for the Toolbutton in the current theme
      -- Layout: constant String := Style_Layout("Toolbutton");
      -- COMMANDS
      -- ttk::style layout name
      -- SOURCE
   function Style_Layout(Name: in String) return String with
      Pre => Name /= "";
      -- ****

      -- ****f* TtkStyle/Style_Lookup
      -- FUNCTION
      -- Get value of the selected option in the selected style
      -- PARAMETERS
      -- Name    - Name of the style to query
      -- Option  - Name of the option to query
      -- State   - List of the states names. If empty, mean "normal" state.
      --           Default value is empty
      -- Default - Default value to return when option was not found
      -- RESULT
      -- Value of the selected option in the selected style. If option was not
      -- found, return value of Default parameter.
      -- HISTORY
      -- 8.6.3 - Added
      -- EXAMPLE
      -- -- Get the font (Tcl name) used by the main window
      -- Font_Name: constant String := Style_Lookup(".", "-font");
      -- COMMANDS
      -- ttk::style lookup name option ?state? ?default?
      -- SOURCE
   function Style_Lookup
     (Name, Option: in String; State: in String := "";
      Default: in String := "") return String with
      Pre => Name /= "" and Option /= "";
      -- ****

      -- ****f* TtkStyle/Style_Map
      -- FUNCTION
      -- Define widget style dynamic map for the selected style
      -- PARAMETERS
      -- Name    - Name of the style to modify
      -- Options - Options for the widget
      -- HISTORY
      -- 8.6.2 - Added
      -- EXAMPLE
      -- -- Set the background of the TPanedwindow when mouse is hovering about to black
      -- Style_Map("TPanedwindow", "-background [list hover black]");
      -- COMMANDS
      -- ttk::style map name options
      -- SOURCE
   procedure Style_Map(Name, Options: in String) with
      Pre => Name /= "" and Options /= "";
      -- ****

      -- ****f* TtkStyle/Theme_Names
      -- FUNCTION
      -- Get list of all available Ttk themes
      -- RESULT
      -- String with list of all available Ttk themes
      -- HISTORY
      -- 8.6.1 - Added
      -- EXAMPLE
      -- -- Get the list of available themes
      -- Themes: constant String := Theme_Names;
      -- COMMANDS
      -- ttk::style theme names
      -- SOURCE
   function Theme_Names return String;
   -- ****

   -- ****f* TtkStyle/Theme_Use (procedure)
   -- FUNCTION
   -- Set new Ttk theme and redraw all widgets
   -- PARAMETERS
   -- Name of Ttk theme to set
   -- HISTORY
   -- 8.6.1 - Added
   -- EXAMPLE
   -- -- Use theme clam as the current theme
   -- Theme_Use("clam");
   -- COMMANDS
   -- ttk::style theme use ThemeName
   -- SOURCE
   procedure Theme_Use(ThemeName: in String) with
      Pre => ThemeName /= "";
      -- ****

      -- ****f* TtkStyle/Theme_Use (function)
      -- FUNCTION
      -- Get currently used Ttk theme
      -- RESULT
      -- Name of currently used Ttk theme
      -- HISTORY
      -- 8.6.1 - Added
      -- EXAMPLE
      -- -- Get the name of the current theme
      -- Current_Theme: constant String := Theme_Use;
      -- COMMANDS
      -- ttk::style theme use
      -- SOURCE
   function Theme_Use return String;
   -- ****

end Tcl.Tk.Ada.TtkStyle;

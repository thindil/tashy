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
   -- SOURCE
   procedure Element_Create
     (Name, Element_Type : in String; Options : in String := "") with
      Pre => Name /= "" and Element_Type /= "";
      -- ****

      -- ****f* TtkStyle/Element_Names
      -- FUNCTION
      -- Return list of elements in the current theme
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
   -- SOURCE
   procedure Style_Configure (Name, Options : in String) with
      Pre => Name /= "" and Options /= "";
      -- ****

      -- ****f* TtkStyle/Style_Layout (procedure)
      -- FUNCTION
      -- Define widget layout style for the selected style
      -- PARAMETERS
      -- Name    - Name of the style to modify
      -- Options - Options for the layout
      -- SOURCE
   procedure Style_Layout (Name, Options : in String) with
      Pre => Name /= "" and Options /= "";
      -- ****

      -- ****f* TtkStyle/Style_Layout (function)
      -- FUNCTION
      -- Get widget layout for the selected style
      -- PARAMETERS
      -- Name - Name of the style to query
      -- RESULT
      -- String with layout setting for the selected style
      -- SOURCE
   function Style_Layout (Name : in String) return String with
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
      -- SOURCE
   function Style_Lookup
     (Name, Option : in String; State : in String := "";
      Default      : in String := "") return String with
      Pre => Name /= "" and Option /= "";
      -- ****

      -- ****f* TtkStyle/Style_Map
      -- FUNCTION
      -- Define widget style dynamic map for the selected style
      -- PARAMETERS
      -- Name    - Name of the style to modify
      -- Options - Options for the widget
      -- SOURCE
   procedure Style_Map (Name, Options : in String) with
      Pre => Name /= "" and Options /= "";
      -- ****

      -- ****f* TtkStyle/Theme_Names
      -- FUNCTION
      -- Get list of all available Ttk themes
      -- RESULT
      -- String with list of all available Ttk themes
      -- SOURCE
   function Theme_Names return String;
   -- ****

   -- ****f* TtkStyle/Theme_Use (procedure)
   -- FUNCTION
   -- Set new Ttk theme and redraw all widgets
   -- PARAMETERS
   -- Name of Ttk theme to set
   -- SOURCE
   procedure Theme_Use (ThemeName : in String) with
      Pre => ThemeName /= "";
      -- ****

      -- ****f* TtkStyle/Theme_Use (function)
      -- FUNCTION
      -- Get currenlty used Ttk theme
      -- RESULT
      -- Name of currently used Ttk theme
      -- SOURCE
   function Theme_Use return String;
   -- ****

end Tcl.Tk.Ada.TtkStyle;

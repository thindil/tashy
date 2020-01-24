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

   -- ****f* TtkStyle/Theme_Names
   -- FUNCTION
   -- Get list of all available Ttk themes
   -- RESULT
   -- String with list of all available Ttk themes
   -- SOURCE
   function Theme_Names return String;
   -- ****

   -- ****f* TtkStyle/Theme_Use
   -- FUNCTION
   -- Set new Ttk theme and redraw all widgets
   -- PARAMETERS
   -- Name of Ttk theme to set
   -- SOURCE
   procedure Theme_Use(ThemeName: in String) with
      Pre => ThemeName /= "";
      -- ****

      -- ****f* TtkStyle/Theme_Use
      -- FUNCTION
      -- Get currenlty used Ttk theme
      -- RESULT
      -- Name of currently used Ttk theme
      -- SOURCE
   function Theme_Use return String;
   -- ****

   -- ****f* TtkStyle/Style_Configure
   -- FUNCTION
   -- Configure selected or create new Ttk style
   -- PARAMETERS
   -- Name    - Name of style to configure or create
   -- Options - Options for the style
   -- SOURCE
   procedure Style_Configure(Name, Options: in String) with
      Pre => Name /= "" and Options /= "";
      -- ****

end Tcl.Tk.Ada.TtkStyle;

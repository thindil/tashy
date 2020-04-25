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

-- ****h* Widgets/OptionMenu
-- FUNCTION
-- Provides code for manipulate Tk widget OptionMenu
-- SOURCE
package Tcl.Tk.Ada.Widgets.OptionMenu is
-- ****

   -- ****t* OptionMenu/Tk_OptionMenu
   -- FUNCTION
   -- This is a non-abstract type derived directly from Tk_Widget.
   -- Each of the derived widgets redefines the Create subprogram
   -- in order to create the correct type of widget.
   -- SOURCE
   type Tk_OptionMenu is new Tk_Widget with private;
   -- ****

   -- ****f* OptionMenu/Create (function)
   -- FUNCTION
   -- Creates a new Tk_OptionMenu in the specified interpreter.
   -- PARAMETERS
   -- pathName - Tk path (starts with dot) for the widget
   -- options  - Options which will be passed to the widget. Must be at least
   --            Global variable name in which selected menu will be stored
   --            and at least one menu value
   -- Interp   - Tcl interpreter to which the widget will be created. If null,
   --            the widget will be created in the "contextual" interpreter.
   --            Default value is null.
   -- RESULT
   -- Newly created Tk_OptionMenu
   -- SOURCE
   overriding function Create
     (pathName, options: in String; Interp: in Tcl_Interp := null)
      return Tk_OptionMenu with
      Pre => pathName /= "" and options /= "";
     -- ****

   -- ****f* OptionMenu/Create (procedure)
   -- FUNCTION
   -- Creates a new Tk_OptionMenu in the specified interpreter.
   -- PARAMETERS
   -- Widgt    - Tk_OptionMenu which will be created
   -- pathName - Tk path (starts with dot) for the widget
   -- options  - Options which will be passed to the widget. Must be at least
   --            Global variable name in which selected menu will be stored
   --            and at least one menu value
   -- Interp   - Tcl interpreter to which the widget will be created. If null,
   --            the widget will be created in the "contextual" interpreter.
   --            Default value is null.
   -- SOURCE
   overriding procedure Create
     (Widgt: out Tk_OptionMenu; pathName, options: in String;
      Interp: in Tcl_Interp := null) with
      Pre => pathName /= "" and options /= "";
      -- ****

private

   type Tk_OptionMenu is new Tk_Widget with null record;

end Tcl.Tk.Ada.Widgets.OptionMenu;

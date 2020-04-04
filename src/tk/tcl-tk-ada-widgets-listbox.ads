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

-- ****h* Widgets/ListBox
-- FUNCTION
-- Provides code for manipulate Tk widget ListBox
-- SOURCE
package Tcl.Tk.Ada.Widgets.ListBox is
-- ****

   -- ****t* ListBox/Tk_ListBox
   -- FUNCTION
   -- This is a non-abstract type derived directly from Tk_Widget.
   -- Each of the derived widgets redefines the Create subprogram
   -- in order to create the correct type of widget.
   -- SOURCE
   type Tk_ListBox is new Tk_Widget with private;
   -- ****

   -- ****f* ListBox/Create
   -- FUNCTION
   -- Creates a new Tk_ListBox in the specified interpreter.
   -- PARAMETERS
   -- Widgt    - Tk_ListBox which will be created
   -- pathName - Tk path (starts with dot) for the widget
   -- options  - Options which will be passed to the widget. Default value is
   --            empty
   -- Interp   - Tcl interpreter to which the widget will be created. If null,
   --            the widget will be created in the "contextual" interpreter.
   --            Default value is null.
   -- RESULT
   -- Newly created Tk_ListBox
   -- SOURCE
   overriding function Create
     (pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) return Tk_ListBox with
      Pre => pathName /= "";
   overriding procedure Create
     (Widgt: out Tk_ListBox; pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) with
      Pre => pathName /= "";
      -- ****

     -- ****f* ListBox/Activate
     -- FUNCTION
     -- Set the active element of Tk_ListBox to the selected index.
     -- PARAMETERS
     -- ListboxWidget - Tk_ListBox in which element will be set as active
     -- Index         - Index of element to set as active
     -- HISTORY
     -- 8.6.4 - Added
     -- TODO
     -- Replace it with higher level of binding
     -- SOURCE
   procedure Activate(ListboxWidget: in Tk_ListBox; Index: in String) with
      Pre => Index /= "";
      -- ****

private

   type Tk_ListBox is new Tk_Widget with null record;

end Tcl.Tk.Ada.Widgets.ListBox;

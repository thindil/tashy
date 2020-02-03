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

-- ****h* Widgets/Menu
-- FUNCTION
-- Provides code for manipulate Tk widget Menu
-- SOURCE
package Tcl.Tk.Ada.Widgets.Menu is
-- ****

   -- ****t* Menu/Tk_Menu
   -- FUNCTION
   -- This is a non-abstract type derived directly from Tk_Widget.
   -- Each of the derived widgets redefines the Create subprogram
   -- in order to create the correct type of widget.
   -- SOURCE
   type Tk_Menu is new Tk_Widget with private;
   -- ****

   -- ****f* Menu/Create
   -- FUNCTION
   -- Creates a new Tk_Menu in the specified interpreter.
   -- PARAMETERS
   -- Widgt    - Tk_Menu which will be created
   -- pathName - Tk path (starts with dot) for the widget
   -- options  - Options which will be passed to the widget. Default value is
   --            empty
   -- Interp   - Tcl interpreter to which the widget will be created. If null,
   --            the widget will be created in the "contextual" interpreter.
   --            Default value is null.
   -- RESULT
   -- Newly created Tk_Menu
   -- SOURCE
   function Create
     (pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) return Tk_Menu with
      Pre => pathName /= "";
   procedure Create
     (Widgt: out Tk_Menu; pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) with
      Pre => pathName /= "";
      -- ****

      -- ****f* Menu/AddMenu
      -- FUNCTION
      -- Add element to the menu.
      -- PARAMETERS
      -- MenuWidget - Tk_Menu widget to which the element will be added
      -- EntryType  - Tk type of entry to add
      -- Options    - Tk options for menu entry to add. Default value is empty
      -- SOURCE
   procedure Add
     (MenuWidget: in Tk_Menu'Class; EntryType: in String;
      Options: in String := "") with
      Pre => EntryType /= "";
      -- ****

      -- ****f* Menu/Delete
      -- FUNCTION
      -- Delete elements from the menu.
      -- PARAMETERS
      -- MenuWidget - Tk_Menu widget from which elementrs will be deleted
      -- StartIndex - Index of first element which will be deleted
      -- EndIndex   - Index of last element which will be deleted. If empty,
      --              it will be that same like StartIndex. Default is empty.
      -- SOURCE
   procedure Delete
     (MenuWidget: in Tk_Menu; StartIndex: in String;
      EndIndex: in String := "") with
      Pre => StartIndex /= "";

private

   type Tk_Menu is new Tk_Widget with null record;

end Tcl.Tk.Ada.Widgets.Menu;

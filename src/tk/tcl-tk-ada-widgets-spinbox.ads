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

-- As a special exception, if other files instantiate generics from this
-- unit, or you link this unit with other files to produce an executable,
-- this unit does not by itself cause the resulting executable to be
-- covered by the GNU General Public License. This exception does not
-- however invalidate any other reasons why the executable file might be
-- covered by the GNU Public License.

-- ****h* Widgets/SpinBox
-- FUNCTION
-- Provides code for manipulate Tk widget SpinBox
-- SOURCE
package Tcl.Tk.Ada.Widgets.SpinBox is
-- ****

   -- ****t* SpinBox/Tk_SpinBox
   -- FUNCTION
   -- This is a non-abstract type derived directly from Tk_Widget.
   -- Each of the derived widgets redefines the Create subprogram
   -- in order to create the correct type of widget.
   -- SOURCE
   type Tk_SpinBox is new Tk_Widget with private;
   -- ****

   -- ****f* SpinBox/Create (function)
   -- FUNCTION
   -- Creates a new Tk_SpinBox in the specified interpreter.
   -- PARAMETERS
   -- pathName - Tk path (starts with dot) for the widget
   -- options  - Options which will be passed to the widget. Default value is
   --            empty
   -- Interp   - Tcl interpreter to which the widget will be created. If null,
   --            the widget will be created in the "contextual" interpreter.
   --            Default value is null.
   -- RESULT
   -- Newly created Tk_SpinBox
   -- SOURCE
   overriding function Create
     (pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) return Tk_SpinBox with
      Pre => pathName /= "";
      -- ****

   -- ****f* SpinBox/Create (procedure)
   -- FUNCTION
   -- Creates a new Tk_SpinBox in the specified interpreter.
   -- PARAMETERS
   -- Widgt    - Tk_SpinBox which will be created
   -- pathName - Tk path (starts with dot) for the widget
   -- options  - Options which will be passed to the widget. Default value is
      --            empty
   -- Interp   - Tcl interpreter to which the widget will be created. If null,
      --            the widget will be created in the "contextual" interpreter.
      --            Default value is null.
      -- SOURCE
   overriding procedure Create
     (Widgt: out Tk_SpinBox; pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) with
      Pre => pathName /= "";
      -- ****

      -- ****f* SpinBox/BBox
      -- FUNCTION
      -- Get size of bounding box of the selected character in the selected
      -- Tk_SpinBox
      -- PARAMETERS
      -- SpinBoxWidget - Tk_SpinBox which will be queried
      -- Index         - Index of the character which bounding box will be
      -- taken
      -- RESULT
      -- Four values: x1, y1 - coordinates of starting point of bounding box
      -- from top left, x2, y2 - coordinates of ending point from bottom right
      -- of bounding box.
      -- HISTORY
      -- 8.6.4 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function BBox
     (SpinBoxWidget: in Tk_SpinBox; Index: in String) return String with
      Pre => Index /= "";
      -- ****

      -- ****f* SpinBox/Delete
      -- FUNCTION
      -- Delete the selected elements of the selected Tk_SpinBox
      -- PARAMETERS
      -- SpinBoxWidget - Tk_SpinBox in which the selected elements will be
      --                 deleted
      -- First         - Index of the first element to delete
      -- Last          - Index of the last element to delete. If empty, delete
      --                 only one element from the SpinBoxWidget. Default
      --                 value is empty
      -- HISTORY
      -- 8.6.4 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   procedure Delete
     (SpinBoxWidget: in Tk_SpinBox; First: in String;
      Last: in String := "") with
      Pre => First /= "";
      -- ****

      -- ****f* SpinBox/Get
      -- FUNCTION
      -- Get the content of the selected Tk_SpinBox
      -- PARAMETERS
      -- SpinBoxWidget - Tk_SpinBox which content will be get
      -- RESULT
      -- String with content of the SpinBoxWidget
      -- HISTORY
      -- 8.6.4 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Get(SpinBoxWidget: in Tk_SpinBox) return String;
   -- ****

private

   type Tk_SpinBox is new Tk_Widget with null record;

end Tcl.Tk.Ada.Widgets.SpinBox;

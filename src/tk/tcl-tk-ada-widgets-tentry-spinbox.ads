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

-- ****h* TEntry/SpinBox
-- FUNCTION
-- Provides code for manipulate Tk widget SpinBox
-- SOURCE
package Tcl.Tk.Ada.Widgets.Tentry.SpinBox is
-- ****

   -- ****t* SpinBox/Tk_SpinBox
   -- FUNCTION
   -- This is a non-abstract type derived directly from Tk_Widget.
   -- Each of the derived widgets redefines the Create subprogram
   -- in order to create the correct type of widget.
   -- SOURCE
   type Tk_SpinBox is new Tk_Entry with private;
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

      -- ****f* SpinBox/Identify
      -- FUNCTION
      -- Get the name of the Tk_SpinBox element at the selected coordinates
      -- PARAMETERS
      -- SpinBoxWidget - Tk_SpinBox which will be queried for the name of the
      --                 element
      -- X             - X coordinate of the pixel which will be check
      -- Y             - Y coordinate of the pixel which will be check
      -- RESULT
      -- Name of the element: "buttondown", "buttonup", "entry" or "none" if
      -- pixel is outside SpinBoxWidget
      -- HISTORY
      -- 8.6.4 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Identify
     (SpinBoxWidget: in Tk_SpinBox; X, Y: in String) return String with
      Pre => X /= "" and Y /= "";
      -- ****

      -- ****f* SpinBox/Invoke
      -- FUNCTION
      -- Invoke the selected button of the selected Tk_SpinBox
      -- PARAMETERS
      -- SpinBoxWidget - Tk_SpinBox in which the selected button will be
      --                 invoked
      -- Element       - Name of the selected button. Can be "buttondown" or
      --                 "buttonup"
      -- HISTORY
      -- 8.6.4 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   procedure Invoke(SpinBoxWidget: in Tk_SpinBox; Element: in String) with
      Pre => Element in "buttondown" | "buttonup";
      -- ****

   -- ****f* SpinBox/Selection_Element (procedure)
   -- FUNCTION
   -- Set the element of Tk_SpinBox as the selected element
   -- PARAMETERS
   -- SpinBoxWidget - Tk_SpinBox in which element will be selected
   -- Element       - Name of the element to select. Possible values are
   --                 "buttonup", "buttondown", "entry" or "none"
   -- HISTORY
   -- 8.6.5 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   procedure Selection_Element
     (SpinBoxWidget: in Tk_SpinBox; Element: in String) with
      Pre => Element in "buttondown" | "buttonup" | "entry" | "none";
      -- ****

      -- ****f* SpinBox/Selection_Element
      -- FUNCTION
      -- Get the currently selected element of the selected Tk_SpinBox
      -- PARAMETERS
      -- SpinBoxWidget - Tk_SpinBox which will be queried for the selected
      --                 element
      -- RESULT
      -- Name of the currently selected element in SpinBoxWidget
      -- HISTORY
      -- 8.6.5 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Selection_Element(SpinBoxWidget: in Tk_SpinBox) return String;
   -- ****

      -- ****f* SpinBox/Set (procedure)
      -- FUNCTION
      -- Set the selected String as a new value for the selected Tk_SpinBox
      -- PARAMETERS
      -- SpinBoxWidget - Tk_SpinBox which value will be set
      -- Value         - Value to set
      -- HISTORY
      -- 8.6.5 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   procedure Set(SpinBoxWidget: in Tk_SpinBox; Value: in String) with
      Pre => Value /= "";
      -- ****

      -- ****f* SpinBox/Set (function)
      -- FUNCTION
      -- Get the value for the selected Tk_SpinBox
      -- PARAMETERS
      -- SpinBoxWidget - Tk_SpinBox which value will be set
      -- RESULT
      -- The current value of the SpinBoxWidget
      -- HISTORY
      -- 8.6.5 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Set(SpinBoxWidget: in Tk_SpinBox) return String;
   -- ****

private

   type Tk_SpinBox is new Tk_Entry with null record;

end Tcl.Tk.Ada.Widgets.TEntry.SpinBox;

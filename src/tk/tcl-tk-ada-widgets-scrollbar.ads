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

-- ****h* Widgets/Scrollbar
-- FUNCTION
-- Provides code for manipulate Tk widget Scrollbar
-- SOURCE
package Tcl.Tk.Ada.Widgets.Scrollbar is
-- ****

   -- ****t* Scrollbar/Tk_Scrollbar
   -- FUNCTION
   -- This is a non-abstract type derived directly from Tk_Widget.
   -- Each of the derived widgets redefines the Create subprogram
   -- in order to create the correct type of widget.
   -- SOURCE
   type Tk_Scrollbar is new Tk_Widget with private;
   -- ****

   -- ****f* Scrollbar/Create (function)
   -- FUNCTION
   -- Creates a new Tk_Scrollbar in the specified interpreter.
   -- PARAMETERS
   -- pathName - Tk path (starts with dot) for the widget
   -- options  - Options which will be passed to the widget. Default value is
   --            empty
   -- Interp   - Tcl interpreter to which the widget will be created. If null,
   --            the widget will be created in the "contextual" interpreter.
   --            Default value is null.
   -- RESULT
   -- Newly created Tk_Scrollbar
   -- SOURCE
   overriding function Create
     (pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) return Tk_Scrollbar with
      Pre => pathName /= "";
      -- ****

   -- ****f* Scrollbar/Create (procedure)
   -- FUNCTION
   -- Creates a new Tk_Scrollbar in the specified interpreter.
   -- PARAMETERS
   -- Widgt    - Tk_Scrollbar which will be created
   -- pathName - Tk path (starts with dot) for the widget
   -- options  - Options which will be passed to the widget. Default value is
      --            empty
   -- Interp   - Tcl interpreter to which the widget will be created. If null,
      --            the widget will be created in the "contextual" interpreter.
      --            Default value is null.
      -- SOURCE
   overriding procedure Create
     (Widgt: out Tk_Scrollbar; pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) with
      Pre => pathName /= "";
      -- ****

      -- ****f* Scrollbar/Activate (procedure)
      -- FUNCTION
      -- Set the selected element as an active in the selected Tk_Scrollbar
      -- PARAMETERS
      -- ScrollbarWidget - Tk_Scrollbar in which an element will be activated
      -- Element         - The element to activate. Can be "arrow1", "slider"
      --                   or "arrow2"
      -- HISTORY
      -- 8.6.4 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   procedure Activate
     (ScrollbarWidget: in Tk_Scrollbar; Element: in String) with
      Pre => Element in "arrow1" | "slider" | "arrow2";
      -- ****

      -- ****f* Scrollbar/Activate (function)
      -- FUNCTION
      -- Get an active element of the selected Tk_Scrollbar
      -- PARAMETERS
      -- ScrollbarWidget - Tk_Scrollbar in which an element will be activated
      -- RESULT
      -- Name of currently active element: "arrow1", "slider" or "arrow2" or
      -- {} if no element is currently active
      -- HISTORY
      -- 8.6.4 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Activate(ScrollbarWidget: in Tk_Scrollbar) return String;
   -- ****

   -- ****f* Scrollbar/Scrollbar_Delta
   -- FUNCTION
   -- Get the faction change between current Tk_Scrollbar setting and the
   -- selected value
   -- PARAMETERS
   -- ScrollbarWidget - Tk_Scrollbar which will be queried
   -- DeltaX          - An value to check for horizontal scrollbar. Ignored
   --                   when ScrollbarWidget is a vertical scrollbar.
   -- DeltaY          - An value to check for vertical scrollbar. Ignored when
   --                   ScrollbarWidget is a horizontal widget.
   -- RESULT
   -- A string with a real number indicating the fractional change in the
   -- scrollbar setting that corresponds to a given change in slider position.
   -- HISTORY
   -- 8.6.4 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   function Scrollbar_Delta
     (ScrollbarWidget: in Tk_Scrollbar; DeltaX, DeltaY: in String)
      return String with
      Pre => DeltaX /= "" and DeltaY /= "";
      -- ****

      -- ****f* Scrollbar/Fraction
      -- FUNCTION
      -- Get the fraction of the selected Tk_Scrollbar at the selected pixel
      -- PARAMETERS
      -- ScrollbarWidget - Tk_Scrollbar which will be queried for the fraction
      -- X               - X coordinate of the pixel inside ScrollbarWidget
      -- Y               - Y coordinate of the pixel inside ScrollbarWidget
      -- RESULT
      -- Value between 0 and 1 where 0 is top or left of the trough and 1 is
      -- bottom or right, middle is 0.5.
      -- HISTORY
      -- 8.6.4 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Fraction
     (ScrollbarWidget: in Tk_Scrollbar; X, Y: in String) return String with
      Pre => X /= "" and Y /= "";
      -- ****

private

   type Tk_Scrollbar is new Tk_Widget with null record;

end Tcl.Tk.Ada.Widgets.Scrollbar;

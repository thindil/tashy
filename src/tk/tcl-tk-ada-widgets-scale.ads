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

-- ****h* Widgets/TkScale
-- FUNCTION
-- Provides code for manipulate Tk widget Scale
-- SOURCE
package Tcl.Tk.Ada.Widgets.Scale is
-- ****

   -- ****t* TkScale/Tk_Scale
   -- FUNCTION
   -- This is a non-abstract type derived directly from Tk_Widget.
   -- Each of the derived widgets redefines the Create subprogram
   -- in order to create the correct type of widget.
   -- SOURCE
   type Tk_Scale is new Tk_Widget with private;
   -- ****

   -- ****f* TkScale/Create
   -- FUNCTION
   -- Creates a new Tk_Scale in the specified interpreter.
   -- PARAMETERS
   -- Widgt    - Tk_Scale which will be created
   -- pathName - Tk path (starts with dot) for the widget
   -- options  - Options which will be passed to the widget. Default value is
   --            empty
   -- Interp   - Tcl interpreter to which the widget will be created. If null,
   --            the widget will be created in the "contextual" interpreter.
   --            Default value is null.
   -- RESULT
   -- Newly created Tk_Scale
   -- SOURCE
   overriding function Create
     (pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) return Tk_Scale with
      Pre => pathName /= "";
   overriding procedure Create
     (Widgt: out Tk_Scale; pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) with
      Pre => pathName /= "";
      -- ****

      -- ****f* Scale/Coords
      -- FUNCTION
      -- Get the elements which the x and y coordinates of the point
      -- along the centerline of the trough that corresponds to Value
      -- PARAMETERS
      -- ScaleWidget - Tk_Scale which will be queried for coordinates
      -- Value       - Value for query. Can be empty. Default value is empty
      -- RESULT
      -- A list whose elements are the x and y coordinates of the point along
      -- the centerline of the trough that corresponds to Value. If Value is
      -- omitted then the ScaleWidget's current value is used.
      -- HISTORY
      -- 8.6.4 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Coords
     (ScaleWidget: in Tk_Scale; Value: in String := "") return String;
   -- ****

   -- ****f* Tcl.Tk.Ada.Widgets.Scale/Get (current value)
   -- FUNCTION
   -- Get current value of the Tk_Scale
   -- PARAMETERS
   -- ScaleWidget - Tk_Scale which will be queried for value
   -- RESULT
   -- Current value of the ScaleWidget
   -- HISTORY
   -- 8.6.4 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   function Get(ScaleWidget: in Tk_Scale) return String;
   -- ****

   -- ****f* Tcl.Tk.Ada.Widgets.Scale/Get (at selected pixel)
   -- FUNCTION
   -- Get value of the Tk_Scale at selected widget
   -- PARAMETERS
   -- ScaleWidget - Tk_Scale which will be queried for value
   -- X           - X coordinate from which value will be taken
   -- Y           - Y coordinate from which value will be taken
   -- RESULT
   -- Value of the ScaleWidget at the selected pixel
   -- HISTORY
   -- 8.6.4 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   function Get(ScaleWidget: in Tk_Scale; X, Y: in String) return String with
      Pre => X /= "" and Y /= "";
      -- ****

      -- ****f* Scale/Identify
      -- FUNCTION
      -- Get which part of the Tk_Scale lies under the specified coordinates
      -- PARAMETERS
      -- ScaleWidget - Tk_Scale which will be queried
      -- X           - X coordinate of the pixel which will be queried
      -- Y           - Y coordinate of the pixel which will be queried
      -- RESULT
      -- "slider" if pixel is at slider, "through1" if pixel is above or to
      -- the left from slider, "through2" if pixel is below or th the right
      -- from slider or "{}" if pixel is not in ScaleWidget
      -- HISTORY
      -- 8.6.4 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Identify
     (ScaleWidget: in Tk_Scale; X, Y: in String) return String with
      Pre => X /= "" and Y /= "";
      -- ****

      -- ****f* Scale/Set
      -- FUNCTION
      -- Set the selected Tk_Scale to a new value
      -- PARAMETERS
      -- ScaleWidget - Tk_Scale which value will be set
      -- Value       - A new value for a ScaleWidget
      -- HISTORY
      -- 8.6.4 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   procedure Set(ScaleWidget: in Tk_Scale; Value: in String) with
      Pre => Value /= "";

private

   type Tk_Scale is new Tk_Widget with null record;

end Tcl.Tk.Ada.Widgets.Scale;

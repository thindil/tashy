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

   -- ****f* TkScale/Create (function)
   -- FUNCTION
   -- Creates a new Tk_Scale in the specified interpreter.
   -- PARAMETERS
   -- pathName - Tk path (starts with dot) for the widget
   -- options  - Options which will be passed to the widget. Default value is
   --            empty
   -- Interp   - Tcl interpreter to which the widget will be created. If null,
   --            the widget will be created in the "contextual" interpreter.
   --            Default value is null.
   -- RESULT
   -- Newly created Tk_Scale
   -- HISTORY
   -- 8.6.1 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- EXAMPLE
   -- -- Create a new scale with pathname .myscale and orientation horizontal
   -- My_Scale: constant Tk_Scale := Create(".myscale", "-orient horizontal");
   -- COMMANDS
   -- scale pathName ?options?
   -- SEE ALSO
   -- Create (procedure)
   -- SOURCE
   overriding function Create
     (pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) return Tk_Scale with
      Pre => pathName /= "";
     -- ****

     -- ****f* TkScale/Create (procedure)
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
     -- HISTORY
     -- 8.6.1 - Added
     -- TODO
     -- Replace it with higher level of binding
     -- EXAMPLE
     -- -- Create scale My_Scale with pathname .myscale and label my scale on the current Tcl interpreter
     -- declare
     --    My_Scale: Tk_Scale;
     -- begin
     --    Create(My_Scale, ".myscale", "-label {my scale}");
     -- end;
     -- COMMANDS
     -- scale pathName ?options?
     -- SEE ALSO
     -- Create (function)
     -- SOURCE
   overriding procedure Create
     (Widgt: out Tk_Scale; pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) with
      Pre => pathName /= "";
     -- ****

     -- ****f* Scale/Get_Widget
     -- FUNCTION
     -- Get the existing Tk_Scale widget
     -- PARAMETERS
     -- pathName - Tk path (starts with dot) for the widget
     -- Interp   - Tcl interpreter on which the widget exists. Can be empty.
     --            Default value is current Tcl interpreter
     -- RESULT
     -- Existing Tk_Scale widget
     -- HISTORY
     -- 8.6.9 - Added
     -- EXAMPLE
     -- -- Get scale widget with name .myscale on the current Tcl interpreter
     -- My_Scale: constant Tk_Scale := Get_Widget(".myscale");
     -- SOURCE
   overriding function Get_Widget
     (pathName: in String; Interp: in Tcl_Interp := Get_Context)
      return Tk_Scale;
     -- ****

     -- ****f* TkScale/Coords
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
     -- EXAMPLE
     -- -- Get the element at the current value of My_Scale scale
     -- Element: constant String := Coords(My_Scale);
     -- COMMANDS
     -- ScaleWidget coords ?value?
     -- SOURCE
   function Coords
     (ScaleWidget: in Tk_Scale; Value: in String := "") return String;
     -- ****

     -- ****f* TkScale/Get (current value)
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
     -- EXAMPLE
     -- -- Get the current value of the My_Scale scale
     -- Value: constant String := Get(My_Scale);
     -- COMMANDS
     -- ScaleWidget get
     -- SEE ALSO
     -- Get (at selected pixel)
     -- SOURCE
   function Get(ScaleWidget: in Tk_Scale) return String;
   -- ****

   -- ****f* TkScale/Get (at selected pixel)
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
   -- EXAMPLE
   -- -- Get the value at pixel (45, 21) in My_Scale scale
   -- Value := constant String := Get(My_Scale, "45", "21");
   -- COMMANDS
   -- ScaleWidget get x y
   -- SEE ALSO
   -- Get (current value)
   -- SOURCE
   function Get(ScaleWidget: in Tk_Scale; X, Y: in String) return String with
      Pre => X /= "" and Y /= "";
      -- ****

      -- ****f* TkScale/Identify
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
      -- EXAMPLE
      -- -- Get the name of the element at pixel (56, 32) in My_Scale scale
      -- Element_Name: constant String := Identify(My_Scale, "56", "32");
      -- COMMANDS
      -- ScaleWidget identify x y
      -- SOURCE
   function Identify
     (ScaleWidget: in Tk_Scale; X, Y: in String) return String with
      Pre => X /= "" and Y /= "";
      -- ****

      -- ****f* TkScale/Set
      -- FUNCTION
      -- Set the selected Tk_Scale to a new value
      -- PARAMETERS
      -- ScaleWidget - Tk_Scale which value will be set
      -- Value       - A new value for a ScaleWidget
      -- HISTORY
      -- 8.6.4 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- EXAMPLE
      -- -- Set the value of the My_Scale scale to 20
      -- Set(My_Scale, "20");
      -- COMMANDS
      -- ScaleWidget set value
      -- SOURCE
   procedure Set(ScaleWidget: in Tk_Scale; Value: in String) with
      Pre => Value /= "";
      -- ****

private

   type Tk_Scale is new Tk_Widget with null record;

end Tcl.Tk.Ada.Widgets.Scale;

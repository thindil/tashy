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

-- ****h* Widgets/TtkScale
-- FUNCTION
-- Provides code for manipulate Tk widget Ttk::scale
-- SOURCE
package Tcl.Tk.Ada.Widgets.TtkScale is
-- ****

   -- ****t* TtkScale/Ttk_Scale
   -- FUNCTION
   -- This is a non-abstract type derived directly from Tk_Widget.
   -- Each of the derived widgets redefines the Create subprogram
   -- in order to create the correct type of widget.
   -- SOURCE
   type Ttk_Scale is new Tk_Widget with private;
   -- ****

   -- ****f* TtkScale/Create (function)
   -- FUNCTION
   -- Creates a new Ttk_Scale in the specified interpreter.
   -- PARAMETERS
   -- pathName - Tk path (starts with dot) for the widget
   -- options  - Options which will be passed to the widget. Default value is
   --            empty
   -- Interp   - Tcl interpreter to which the widget will be created. If null,
   --            the widget will be created in the "contextual" interpreter.
   --            Default value is null.
   -- RESULT
   -- Newly created Ttk_Scale
   -- HISTORY
   -- 8.6.1 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   overriding function Create
     (pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) return Ttk_Scale with
      Pre => pathName /= "";
     -- ****

     -- ****f* TtkScale/Create (procedure)
     -- FUNCTION
     -- Creates a new Ttk_Scale in the specified interpreter.
     -- PARAMETERS
     -- Widgt    - Ttk_Scale which will be created
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
     -- SOURCE
   overriding procedure Create
     (Widgt: out Ttk_Scale; pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) with
      Pre => pathName /= "";
      -- ****

      -- ****f* TtkScale/Get (current)
      -- FUNCTION
      -- Get current value of the selected Ttk_Scale
      -- PARAMETERS
      -- ScaleWidget - Ttk_Scale which value will be get
      -- RESULT
      -- Current value of the ScaleWidget
      -- HISTORY
      -- 8.6.5 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Get(ScaleWidget: in Ttk_Scale) return String;
   -- ****

   -- ****f* TtkScale/Get (at pixel)
   -- FUNCTION
   -- Get the value of the selected Ttk_Scale at the selected pixel
   -- PARAMETERS
   -- ScaleWidget - Ttk_Scale which value will be get
   -- X           - X coordinate of the pixel which value will be get
   -- Y           - Y coordinate of the pixel which value will be get
   -- RESULT
   -- Value of the ScaleWidget at the selected pixel
   -- HISTORY
   -- 8.6.5 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   function Get(ScaleWidget: in Ttk_Scale; X, Y: in String) return String with
      Pre => X /= "" and Y /= "";
      -- ****

      -- ****f* TtkScale/Set
      -- FUNCTION
      -- Set a new value for the selected Ttk_Scale
      -- PARAMETERS
      -- ScaleWidget - Ttk_Scale which will be set
      -- Value       - A new value for the ScaleWidget
      -- HISTORY
      -- 8.6.5 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   procedure Set(ScaleWidget: in Ttk_Scale; Value: in String) with
      Pre => Value /= "";
      -- ****

private

   type Ttk_Scale is new Tk_Widget with null record;

end Tcl.Tk.Ada.Widgets.TtkScale;

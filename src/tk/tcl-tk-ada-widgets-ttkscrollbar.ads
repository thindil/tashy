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

-- ****h* Widgets/TtkScrollbar
-- FUNCTION
-- Provides code for manipulate Tk widget Ttk::Scrollbar
-- SOURCE
package Tcl.Tk.Ada.Widgets.TtkScrollbar is
-- ****

   -- ****t* TtkScrollbar/Ttk_Scrollbar
   -- FUNCTION
   -- This is a non-abstract type derived directly from Tk_Widget.
   -- Each of the derived widgets redefines the Create subprogram
   -- in order to create the correct type of widget.
   -- SOURCE
   type Ttk_Scrollbar is new Tk_Widget with private;
   -- ****

   -- ****f* TtkScrollbar/Create (function)
   -- FUNCTION
   -- Creates a new Ttk_Scrollbar in the specified interpreter.
   -- PARAMETERS
   -- pathName - Tk path (starts with dot) for the widget
   -- options  - Options which will be passed to the widget. Default value is
   --            empty
   -- Interp   - Tcl interpreter to which the widget will be created. If null,
   --            the widget will be created in the "contextual" interpreter.
   --            Default value is null.
   -- RESULT
   -- Newly created Ttk_Scrollbar
   -- SOURCE
   overriding function Create
     (pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) return Ttk_Scrollbar with
      Pre => pathName /= "";
      -- ****

   -- ****f* TtkScrollbar/Create (procedure)
   -- FUNCTION
   -- Creates a new Ttk_Scrollbar in the specified interpreter.
   -- PARAMETERS
   -- Widgt    - Ttk_Scrollbar which will be created
   -- pathName - Tk path (starts with dot) for the widget
   -- options  - Options which will be passed to the widget. Default value is
      --            empty
   -- Interp   - Tcl interpreter to which the widget will be created. If null,
      --            the widget will be created in the "contextual" interpreter.
      --            Default value is null.
      -- SOURCE
   overriding procedure Create
     (Widgt: out Ttk_Scrollbar; pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) with
      Pre => pathName /= "";
      -- ****

   -- ****f* TtkScrollbar/Scrollbar_Delta
   -- FUNCTION
   -- Get the faction change between current Ttk_Scrollbar setting and the
   -- selected value
   -- PARAMETERS
   -- ScrollbarWidget - Ttk_Scrollbar which will be queried
   -- DeltaX          - An value to check for horizontal scrollbar. Ignored
   --                   when ScrollbarWidget is a vertical scrollbar.
   -- DeltaY          - An value to check for vertical scrollbar. Ignored when
   --                   ScrollbarWidget is a horizontal widget.
   -- RESULT
   -- A string with a real number indicating the fractional change in the
   -- scrollbar setting that corresponds to a given change in slider position.
   -- HISTORY
   -- 8.6.6 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   function Scrollbar_Delta
     (ScrollbarWidget: in Ttk_Scrollbar; DeltaX, DeltaY: in String)
      return String with
      Pre => DeltaX /= "" and DeltaY /= "";
      -- ****

      -- ****f* TtkScrollbar/Fraction
      -- FUNCTION
      -- Get the fraction of the selected Ttk_Scrollbar at the selected pixel
      -- PARAMETERS
      -- ScrollbarWidget - Ttk_Scrollbar which will be queried for the fraction
      -- X               - X coordinate of the pixel inside ScrollbarWidget
      -- Y               - Y coordinate of the pixel inside ScrollbarWidget
      -- RESULT
      -- Value between 0 and 1 where 0 is top or left of the trough and 1 is
      -- bottom or right, middle is 0.5.
      -- HISTORY
      -- 8.6.6 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Fraction
     (ScrollbarWidget: in Ttk_Scrollbar; X, Y: in String) return String with
      Pre => X /= "" and Y /= "";
      -- ****

      -- ****f* TtkScrollbar/Get
      -- FUNCTION
      -- Get the Ttk_Scrollbar setting for which part of associated widget is
      -- currently visible
      -- PARAMETERS
      -- ScrollbarWidget - Ttk_Scrollbar which will be queried for setting
      -- RESULT
      -- Two values of real fraction between 0 and 1 for visible part of the
      -- associated widget.
      -- HISTORY
      -- 8.6.6 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Get(ScrollbarWidget: in Ttk_Scrollbar) return String;
   -- ****

      -- ****f* TtkScrollbar/Set
      -- FUNCTION
      -- Set the Ttk_Scrollbar setting for which part of associated widget is
      -- currently visible
      -- PARAMETERS
      -- ScrollbarWidget - Ttk_Scrollbar which setting will be changed
      -- First           - Start fraction of visible part of the associated
      --                   widget
      -- Last            - End fraction of visible part of the associated
      --                   widget
      -- HISTORY
      -- 8.6.6 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   procedure Set
     (ScrollbarWidget: in Ttk_Scrollbar; First, Last: in String) with
      Pre => First /= "" and Last /= "";
      -- ****

private

   type Ttk_Scrollbar is new Tk_Widget with null record;

end Tcl.Tk.Ada.Widgets.TtkScrollbar;

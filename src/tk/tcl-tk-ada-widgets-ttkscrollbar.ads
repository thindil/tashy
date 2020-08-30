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
   -- HISTORY
   -- 8.6.1 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- EXAMPLE
   -- -- Create a new horizontal scrollbar with pathname .myscroll
   -- My_Scroll: constant Ttk_Scrollbar := Create(".myscroll", "-orient horizontal");
   -- COMMANDS
   -- ttk::scrollbar pathName ?options?
   -- SEE ALSO
   -- Create (procedure)
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
     -- HISTORY
     -- 8.6.1 - Added
     -- TODO
     -- Replace it with higher level of binding
     -- EXAMPLE
     -- -- Create vertical scrollbar My_Scroll with pathname .myscroll on the current Tcl interpreter
     -- declare
     --    My_Scroll: Ttk_Scrollbar;
     -- begin
     --    Create(My_Scroll, ".myscroll", "-orient vertical");
     -- end;
     -- COMMANDS
     -- ttk::scrollbar pathName ?options?
     -- SEE ALSO
     -- Create (function)
     -- SOURCE
   overriding procedure Create
     (Widgt: out Ttk_Scrollbar; pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) with
      Pre => pathName /= "";
     -- ****

     -- ****f* TtkScrollbar/Scrollbar_Delta
     -- FUNCTION
     -- Get the fraction change between current Ttk_Scrollbar setting and the
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
     -- EXAMPLE
     -- -- Get the fractional change between current setting of horizontal My_Scroll scrollbar and value 1.0
     -- Fraction: constant String := Scrollbar_Delta(My_Scroll, "1.0", "0.0");
     -- COMMANDS
     -- ScrollbarWidget delta deltaX deltaY
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
      -- EXAMPLE
      -- -- Get the fraction in My_Scroll scrollbar point (24, 56)
      -- Fraction_Value: constant String := Fraction(My_Scroll, "24", "56");
      -- COMMANDS
      -- ScrollbarWidget fraction x y
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
      -- EXAMPLE
      -- -- Get the My_Scroll scrollbar setting
      -- Visible: constant String := Get(My_Scroll);
      -- COMMANDS
      -- ScrollbarWidget get
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
   -- EXAMPLE
   -- -- Set the visible fraction of associated widget with My_Scroll scrollbar to 0.0 and 0.5
   -- Set(My_Scroll, "0.0", "0.5");
   -- COMMANDS
   -- ScrollbarWidget set first last
   -- SOURCE
   procedure Set
     (ScrollbarWidget: in Ttk_Scrollbar; First, Last: in String) with
      Pre => First /= "" and Last /= "";
      -- ****

private

   type Ttk_Scrollbar is new Tk_Widget with null record;

end Tcl.Tk.Ada.Widgets.TtkScrollbar;

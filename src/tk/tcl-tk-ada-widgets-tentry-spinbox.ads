-- Copyright (c) 2020-2021 Bartek thindil Jasicki <thindil@laeran.pl>
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
package Tcl.Tk.Ada.Widgets.Tentry.SpinBox with
   SPARK_Mode
is
   pragma Elaborate_Body;
-- ****

   -- ****t* SpinBox/SpinBox.Tk_SpinBox
   -- FUNCTION
   -- This is a non-abstract type derived directly from Tk_Widget.
   -- Each of the derived widgets redefines the Create subprogram
   -- in order to create the correct type of widget.
   -- SOURCE
   type Tk_SpinBox is new Tk_Entry with private;
   -- ****

   -- ****f* SpinBox/SpinBox.Create_(function)
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
   -- HISTORY
   -- 8.6.1 - Added
   -- EXAMPLE
   -- -- Create a new spinbox with pathname .myspinbox and relief solid
   -- My_Spinbox: constant Tk_SpinBox := Create(".myspinbox", "-relief solid");
   -- COMMANDS
   -- spinbox pathName ?options?
   -- SEE ALSO
   -- SpinBox.Create_(procedure)
   -- SOURCE
   overriding function Create
     (pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := Null_Interp) return Tk_SpinBox with
      Global => null;
     -- ****

     -- ****f* SpinBox/SpinBox.Create_(procedure)
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
     -- OUTPUT
     -- Newly created Tk_SpinBox as parameter Widgt
     -- HISTORY
     -- 8.6.1 - Added
     -- EXAMPLE
     -- -- Create spinbox My_Spinbox with pathname .myspinbox and black background on the current Tcl interpreter
     -- declare
     --    My_Spinbox: Tk_SpinBox;
     -- begin
     --    Create(My_Spinbox, ".myspinbox", "-background black");
     -- end;
     -- COMMANDS
     -- spinbox pathName ?options?
     -- SEE ALSO
     -- SpinBox.Create_(function)
     -- SOURCE
   overriding procedure Create
     (Widgt: out Tk_SpinBox; pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := Null_Interp) with
      Global => null;
     -- ****

     -- ****f* SpinBox/SpinBox.Get_Widget
     -- FUNCTION
     -- Get the existing Tk_Spinbox widget
     -- PARAMETERS
     -- pathName - Tk path (starts with dot) for the widget
     -- Interp   - Tcl interpreter on which the widget exists. Can be empty.
     --            Default value is current Tcl interpreter
     -- RESULT
     -- Existing Tk_Spinbox widget
     -- HISTORY
     -- 8.6.12 - Added
     -- EXAMPLE
     -- -- Get spinbox widget with name .myspinbox on the current Tcl interpreter
     -- My_Spinbox: constant Tk_SpinBox := Get_Widget(".myspinbox");
     -- SOURCE
   overriding function Get_Widget
     (pathName: in String; Interp: in Tcl_Interp := Get_Context)
      return Tk_SpinBox with
      Global => null;
     -- ****

     -- ****f* SpinBox/SpinBox.Identify
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
     -- EXAMPLE
     -- -- Get the name of the element of the My_Spinbox spinbox at point (43, 28)
     -- Element_Name: constant String := Identify(My_Spinbox, "43", "28");
     -- COMMANDS
     -- SpinBoxWidget identify x y
     -- SOURCE
   function Identify
     (SpinBoxWidget: in Tk_SpinBox; X, Y: in String) return String with
      Pre'Class => X /= "" and Y /= "";
      -- ****

      -- ****f* SpinBox/SpinBox.Invoke
      -- FUNCTION
      -- Invoke the selected button of the selected Tk_SpinBox
      -- PARAMETERS
      -- SpinBoxWidget - Tk_SpinBox in which the selected button will be
      --                 invoked
      -- Element       - Name of the selected button. Can be "buttondown" or
      --                 "buttonup"
      -- HISTORY
      -- 8.6.4 - Added
      -- EXAMPLE
      -- -- Invoke button "buttonup" of My_Spinbox spinbox
      -- Invoke(My_Spinbox, "buttonup");
      -- COMMANDS
      -- SpinBoxWidget invoke element
      -- SOURCE
   procedure Invoke(SpinBoxWidget: in Tk_SpinBox; Element: in String) with
      Pre'Class => Element in "buttondown" | "buttonup";
      -- ****

      -- ****f* SpinBox/SpinBox.Selection_Element_(procedure)
      -- FUNCTION
      -- Set the element of Tk_SpinBox as the selected element
      -- PARAMETERS
      -- SpinBoxWidget - Tk_SpinBox in which element will be selected
      -- Element       - Name of the element to select. Possible values are
      --                 "buttonup", "buttondown", "entry" or "none"
      -- HISTORY
      -- 8.6.5 - Added
      -- EXAMPLE
      -- -- Set entry of the My_Spinbox spinbox as a selected element
      -- Selection_Element(My_Spinbox, "entry");
      -- COMMANDS
      -- SpinBoxWidget selection element element
      -- SEE ALSO
      -- SpinBox.Selection_Element_(function)
      -- SOURCE
   procedure Selection_Element
     (SpinBoxWidget: in Tk_SpinBox; Element: in String) with
      Pre'Class => Element in "buttondown" | "buttonup" | "entry" | "none";
      -- ****

      -- ****f* SpinBox/SpinBox.Selection_Element_(function)
      -- FUNCTION
      -- Get the currently selected element of the selected Tk_SpinBox
      -- PARAMETERS
      -- SpinBoxWidget - Tk_SpinBox which will be queried for the selected
      --                 element
      -- RESULT
      -- Name of the currently selected element in SpinBoxWidget
      -- HISTORY
      -- 8.6.5 - Added
      -- EXAMPLE
      -- -- Get the currently selected element for My_Spinbox spinbox
      -- Selected_Element: constant String := Selection_Element(My_Spinbox);
      -- COMMANDS
      -- SpinBoxWidget selection element
      -- SEE ALSO
      -- SpinBox.Selection_Element_(procdure)
      -- SOURCE
   function Selection_Element(SpinBoxWidget: in Tk_SpinBox) return String;
   -- ****

   -- ****f* SpinBox/SpinBox.Set_(procedure)
   -- FUNCTION
   -- Set the selected String as a new value for the selected Tk_SpinBox
   -- PARAMETERS
   -- SpinBoxWidget - Tk_SpinBox which value will be set
   -- Value         - Value to set
   -- HISTORY
   -- 8.6.5 - Added
   -- EXAMPLE
   -- -- Set the value of My_Spinbox spinbox to 100
   -- Set(My_Spinbox, "100");
   -- COMMANDS
   -- SpinBoxWidget set value
   -- SEE ALSO
   -- SpinBox.Set_(function)
   -- SOURCE
   procedure Set(SpinBoxWidget: in Tk_SpinBox; Value: in String) with
      Pre'Class => Value /= "";
      -- ****

      -- ****f* SpinBox/SpinBox.Set_(function)
      -- FUNCTION
      -- Get the value for the selected Tk_SpinBox
      -- PARAMETERS
      -- SpinBoxWidget - Tk_SpinBox which value will be set
      -- RESULT
      -- The current value of the SpinBoxWidget
      -- HISTORY
      -- 8.6.5 - Added
      -- EXAMPLE
      -- -- Get the current value of My_Spinbox spinbox
      -- Value: constant String := Set(My_Spinbox);
      -- COMMANDS
      -- SpinBoxWidget set
      -- SEE ALSO
      -- SpinBox.Set_(procedure)
      -- SOURCE
   function Set(SpinBoxWidget: in Tk_SpinBox) return String;
   -- ****

private

   type Tk_SpinBox is new Tk_Entry with null record;

end Tcl.Tk.Ada.Widgets.Tentry.SpinBox;

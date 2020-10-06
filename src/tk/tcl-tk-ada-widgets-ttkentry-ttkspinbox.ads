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

-- ****h* TtkEntry/TtkSpinBox
-- FUNCTION
-- Provides code for manipulate Tk widget Ttk::SpinBox
-- SOURCE
package Tcl.Tk.Ada.Widgets.TtkEntry.TtkSpinBox is
-- ****

   -- ****t* TtkSpinBox/TtkSpinBox.Ttk_SpinBox
   -- FUNCTION
   -- This is a non-abstract type derived directly from Tk_Widget.
   -- Each of the derived widgets redefines the Create subprogram
   -- in order to create the correct type of widget.
   -- SOURCE
   type Ttk_SpinBox is new Ttk_Entry with private;
   -- ****

   -- ****f* TtkSpinBox/TtkSpinBox.Create_(function)
   -- FUNCTION
   -- Creates a new Ttk_SpinBox in the specified interpreter.
   -- PARAMETERS
   -- pathName - Tk path (starts with dot) for the widget
   -- options  - Options which will be passed to the widget. Default value is
   --            empty
   -- Interp   - Tcl interpreter to which the widget will be created. If null,
   --            the widget will be created in the "contextual" interpreter.
   --            Default value is null.
   -- RESULT
   -- Newly created Ttk_SpinBox
   -- HISTORY
   -- 8.6.2 - Added
   -- EXAMPLE
   -- -- Create a new spinbox with pathname .myspinbox with range from 1 to 100
   -- My_Spinbox: constant Ttk_SpinBox := Create(".myspinbox", "-from 1 -to 100");
   -- COMMANDS
   -- ttk::spinbox pathName ?options?
   -- SEE ALSO
   -- TtkSpinBox.Create_(procedure)
   -- SOURCE
   overriding function Create
     (pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) return Ttk_SpinBox with
      Pre => pathName /= "";
     -- ****

     -- ****f* TtkSpinBox/TtkSpinBox.Create_(procedure)
     -- FUNCTION
     -- Creates a new Ttk_SpinBox in the specified interpreter.
     -- PARAMETERS
     -- Widgt    - Ttk_SpinBox which will be created
     -- pathName - Tk path (starts with dot) for the widget
     -- options  - Options which will be passed to the widget. Default value is
     --            empty
     -- Interp   - Tcl interpreter to which the widget will be created. If null,
     --            the widget will be created in the "contextual" interpreter.
     --            Default value is null.
     -- OUTPUT
     -- Newly created Ttk_SpinBox as parameter Widgt
     -- HISTORY
     -- 8.6.2 - Added
     -- EXAMPLE
     -- -- Create spinbox My_Spinbox with pathname .myspinbox which wraps values on the current Tcl interpreter
     -- declare
     --    My_Spinbox: Ttk_SpinBox;
     -- begin
     --    Create(My_Spinbox, ".myspinbox", "-wrap true");
     -- end;
     -- COMMANDS
     -- ttk::spinbox pathName ?options?
     -- SEE ALSO
     -- TtkSpinBox.Create_(function)
     -- SOURCE
   overriding procedure Create
     (Widgt: out Ttk_SpinBox; pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) with
      Pre => pathName /= "";
      -- ****

     -- ****f* TtkSpinBox/TtkSpinBox.Get_Widget
     -- FUNCTION
     -- Get the existing Ttk_SpinBox widget
     -- PARAMETERS
     -- pathName - Tk path (starts with dot) for the widget
     -- Interp   - Tcl interpreter on which the widget exists. Can be empty.
     --            Default value is current Tcl interpreter
     -- RESULT
     -- Existing Ttk_SpinBox widget
     -- HISTORY
     -- 8.6.9 - Added
     -- EXAMPLE
     -- -- Get spinbox widget with name .myspin on the current Tcl interpreter
     -- My_SpinBox: constant Ttk_SpinBox := Get_Widget(".myspin");
     -- SOURCE
   overriding function Get_Widget
     (pathName: in String; Interp: in Tcl_Interp := Get_Context)
      return Ttk_SpinBox;
     -- ****

      -- ****f* TtkSpinBox/TtkSpinBox.Current_(function)
      -- FUNCTION
      -- Get the current value of the selected Ttk_SpinBox
      -- PARAMETERS
      -- SpinBox - Ttk_SpinBox which the current value will be queried
      -- RESULT
      -- The current value of the SpinBox or "-1" if the value is not in the
      -- list of values for the SpinBox
      -- HISTORY
      -- 8.6.6 - Added
      -- EXAMPLE
      -- -- Get the current value of My_Spinbox spinbox
      -- Value: constant String := Current(My_Spinbox);
      -- COMMANDS
      -- SpinBox current
      -- SEE ALSO
      -- TtkSpinBox.Current_(procedure)
      -- SOURCE
   function Current(SpinBox: in Ttk_SpinBox) return String;
   -- ****

   -- ****f* TtkSpinBox/TtkSpinBox.Current_(procedure)
   -- FUNCTION
   -- Set the current value for the selected Ttk_SpinBox
   -- PARAMETERS
   -- SpinBox  - Ttk_SpinBox which the current value will be set
   -- NewIndex - A new index of the item from the list of values for the
   --            SpinBox which will be set as the current value
   -- HISTORY
   -- 8.6.6 - Added
   -- EXAMPLE
   -- -- Set the current value of My_Spinbox spinbox to 1
   -- Current(My_Spinbox, "1");
   -- COMMANDS
   -- SpinBox current newIndex
   -- SEE ALSO
   -- TtkSpinBox.Current_(function), Set
   -- SOURCE
   procedure Current(SpinBox: in Ttk_SpinBox; NewIndex: in String) with
      Pre => NewIndex /= "";
      -- ****

      -- ****f* TtkSpinBox/TtkSpinBox.Set
      -- FUNCTION
      -- Set the value of the selected Ttk_SpinBox
      -- PARAMETERS
      -- SpinBox - Ttk_SpinBox which value will be set
      -- Value   - A new value for the SpinBox
      -- HISTORY
      -- 8.6.6 - Added
      -- EXAMPLE
      -- -- Set the value of My_Spinbox to 2
      -- Set(My_Combobox, "2");
      -- COMMANDS
      -- SpinBox set value
      -- SOURCE
   procedure Set(SpinBox: in Ttk_SpinBox; Value: in String);
   -- ****

private

   type Ttk_SpinBox is new Ttk_Entry with null record;

end Tcl.Tk.Ada.Widgets.TtkEntry.TtkSpinBox;

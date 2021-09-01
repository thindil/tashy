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

-- ****h* TtkEntry/TtkComboBox
-- FUNCTION
-- Provides code for manipulate Tk widget ComboBox
-- SOURCE
package Tcl.Tk.Ada.Widgets.TtkEntry.TtkComboBox with
   SPARK_Mode
is
   pragma Elaborate_Body;
-- ****

   -- ****t* TtkComboBox/TtkComboBox.Ttk_ComboBox
   -- FUNCTION
   -- This is a non-abstract type derived directly from Tk_Widget.
   -- Each of the derived widgets redefines the Create subprogram
   -- in order to create the correct type of widget.
   -- SOURCE
   type Ttk_ComboBox is new Ttk_Entry with private;
   -- ****

   -- ****f* TtkComboBox/TtkComboBox.Create_(function)
   -- FUNCTION
   -- Creates a new Ttk_ComboBox in the specified interpreter.
   -- PARAMETERS
   -- pathName - Tk path (starts with dot) for the widget
   -- options  - Options which will be passed to the widget. Default value is
   --            empty
   -- Interp   - Tcl interpreter to which the widget will be created. If null,
   --            the widget will be created in the "contextual" interpreter.
   --            Default value is null.
   -- RESULT
   -- Newly created Ttk_ComboBox
   -- HISTORY
   -- 8.6.2 - Added
   -- EXAMPLE
   -- -- Create a new combobox with pathname .mycombobox and values yes and no
   -- My_Combobox: constant Ttk_ComboBox := Create(".mycombobox", "-values [list yes no]");
   -- COMMANDS
   -- ttk::combobox pathName ?options?
   -- SEE ALSO
   -- TtkComboBox.Create_(procedure)
   -- SOURCE
   function Create
     (pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := Null_Interp) return Ttk_ComboBox with
      Global => null;
      -- ****

      -- ****f* TtkComboBox/TtkComboBox.Create_(procedure)
      -- FUNCTION
      -- Creates a new Ttk_ComboBox in the specified interpreter.
      -- PARAMETERS
      -- Widgt    - Ttk_ComboBox which will be created
      -- pathName - Tk path (starts with dot) for the widget
      -- options  - Options which will be passed to the widget. Default value is
      --            empty
      -- Interp   - Tcl interpreter to which the widget will be created. If null,
      --            the widget will be created in the "contextual" interpreter.
      --            Default value is null.
      -- OUTPUT
      -- Newly created Ttk_ComboBox as parameter Widgt
      -- HISTORY
      -- 8.6.2 - Added
      -- EXAMPLE
      -- -- Create combobox My_Combobox with pathname .mycombobox and width 10 characters on the current Tcl interpreter
      -- declare
      --    My_Combobox: Ttk_ComboBox;
      -- begin
      --    Create(My_Combobox, ".mycombobox", "-width 10");
      -- end;
      -- COMMANDS
      -- ttk::combobox pathName ?options?
      -- SEE ALSO
      -- TtkComboBox.Create_(function)
      -- SOURCE
   procedure Create
     (Widgt: out Ttk_ComboBox; pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := Null_Interp) with
      Global => null;
      -- ****

     -- ****f* TtkComboBox/TtkComboBox.Get_Widget
     -- FUNCTION
     -- Get the existing Ttk_ComboBox widget
     -- PARAMETERS
     -- pathName - Tk path (starts with dot) for the widget
     -- Interp   - Tcl interpreter on which the widget exists. Can be empty.
     --            Default value is current Tcl interpreter
     -- RESULT
     -- Existing Ttk_ComboBox widget
     -- HISTORY
     -- 8.6.9 - Added
     -- EXAMPLE
     -- -- Get combobox widget with name .mycombo on the current Tcl interpreter
     -- My_ComboBox: constant Ttk_ComboBox := Get_Widget(".mycombo");
     -- SOURCE
   overriding function Get_Widget
     (pathName: in String; Interp: in Tcl_Interp := Get_Context)
      return Ttk_ComboBox with
      Global => null;
     -- ****

      -- ****f* TtkComboBox/TtkComboBox.Current_(function)
      -- FUNCTION
      -- Get the current value of the selected Ttk_ComboBox
      -- PARAMETERS
      -- ComboBox - Ttk_ComboBox which the current value will be queried
      -- RESULT
      -- The current value of the ComboBox or "-1" if the value is not in the
      -- list of values for the ComboBox
      -- HISTORY
      -- 8.6.5 - Added
      -- EXAMPLE
      -- -- Get the current value of My_Combobox combobox
      -- Value: constant String := Current(My_Combobox);
      -- COMMANDS
      -- ComboBox current
      -- SEE ALSO
      -- TtkComboBox.Current_(procedure)
      -- SOURCE
   function Current(ComboBox: in Ttk_ComboBox) return String;
   -- ****

   -- ****f* TtkComboBox/TtkComboBox.Current_(procedure)
   -- FUNCTION
   -- Set the current value for the selected Ttk_ComboBox
   -- PARAMETERS
   -- ComboBox - Ttk_ComboBox which the current value will be set
   -- NewIndex - A new index of the item from the list of values for the
   --            ComboBox which will be set as the current value
   -- HISTORY
   -- 8.6.5 - Added
   -- EXAMPLE
   -- -- Set the current value of My_Combobox combobox to second value in list
   -- Current(My_Combobox, "1");
   -- COMMANDS
   -- ComboBox current newIndex
   -- SEE ALSO
   -- TtkComboBox.Current_(function), Set
   -- SOURCE
   procedure Current(ComboBox: in Ttk_ComboBox; NewIndex: in String) with
      Pre'Class => NewIndex /= "";
      -- ****

      -- ****f* TtkComboBox/TtkComboBox.Set
      -- FUNCTION
      -- Set the value of the selected Ttk_ComboBox
      -- PARAMETERS
      -- ComboBox - Ttk_ComboBox which value will be set
      -- Value    - A new value for the ComboBox
      -- HISTORY
      -- 8.6.5 - Added
      -- EXAMPLE
      -- -- Set the value of My_Combobox to text my new value
      -- Set(My_Combobox, "{my new value}");
      -- COMMANDS
      -- ComboBox set value
      -- SOURCE
   procedure Set(ComboBox: in Ttk_ComboBox; Value: in String);
   -- ****

private

   type Ttk_ComboBox is new Ttk_Entry with null record;

end Tcl.Tk.Ada.Widgets.TtkEntry.TtkComboBox;

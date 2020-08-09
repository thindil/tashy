-- Copyright (c) 2020 Bartek thindil Jasicki <thindil@laeran.pl>
--
-- Tashy is free software: you can redistribute it and/or modify
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

-- ****h* Button/RadioButton
-- FUNCTION
-- Provides code for manipulate Tk widget RadioButton
-- SOURCE
package Tcl.Tk.Ada.Widgets.Button.RadioButton is
-- ****

   -- ****t* RadioButton/Tk_RadioButton
   -- FUNCTION
   -- This is a type derived from Tk_Button.
   -- SOURCE
   type Tk_RadioButton is new Tk_Button with private;
   -- ****

   -- ****f* RadioButton/Create (function)
   -- FUNCTION
   -- Creates a new Tk_RadioButton in the specified interpreter.
   -- PARAMETERS
   -- pathName - Tk path (starts with dot) for the widget
   -- options  - Options which will be passed to the widget. Default value is
   --            empty
   -- Interp   - Tcl interpreter to which the widget will be created. If null,
   --            the widget will be created in the "contextual" interpreter.
   --            Default value is null.
   -- RESULT
   -- Newly created Tk_RadioButton
   -- HISTORY
   -- 8.6.1 - Moved from Tcl.Tk.Ada.Widgets
   -- TODO
   -- Replace it with higher level of binding
   -- EXAMPLE
   -- -- Create a new button with pathname .mybutton and label select me
   -- My_Button: constant Tk_RadioButton := Create(".mybutton", "-text {select me}");
   -- COMMANDS
   -- radiobutton pathName ?options?
   -- SEE ALSO
   -- Create (procedure)
   -- SOURCE
   overriding function Create
     (pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) return Tk_RadioButton with
      Pre => pathName /= "";


     -- ****f* RadioButton/Create (procedure)
     -- FUNCTION
     -- Creates a new Tk_RadioButton in the specified interpreter.
     -- PARAMETERS
     -- Widgt    - Tk_RadioButton which will be created
     -- pathName - Tk path (starts with dot) for the widget
     -- options  - Options which will be passed to the widget. Default value is
     --            empty
     -- Interp   - Tcl interpreter to which the widget will be created. If null,
     --            the widget will be created in the "contextual" interpreter.
     --            Default value is null.
     -- OUTPUT
     -- Newly created Tk_RadioButton as parameter Widgt
     -- HISTORY
     -- 8.6.1 - Moved from Tcl.Tk.Ada.Widgets
     -- TODO
     -- Replace it with higher level of binding
     -- EXAMPLE
     -- -- Create radiobutton My_Button with pathname .mybutton and label click me on the current Tcl interpreter
     -- declare
     --    My_Button: Tk_RadioButton;
     -- begin
     --    Create(My_Button, ".mybutton", "-text {click me}");
     -- end;
     -- COMMANDS
     -- radiobutton pathName ?options?
     -- SEE ALSO
     -- Create (function)
     -- SOURCE
   overriding procedure Create
     (Widgt: out Tk_RadioButton; pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) with
      Pre => pathName /= "";
     -- ****

     -- ****f* RadioButton/Deselect
     -- FUNCTION
     -- Deselect the button.
     -- PARAMETERS
     -- Buttn - Tk_RadioButton to deselect
     -- HISTORY
     -- 8.6.1 - Moved from Tcl.Tk.Ada.Widgets
     -- TODO
     -- Replace it with higher level of binding
     -- EXAMPLE
     -- -- Deselect My_Radiobutton
     -- Deselect(My_Radiobutton);
     -- COMMANDS
     -- Buttn deselect
     -- SOURCE
   procedure Deselect(Buttn: in Tk_RadioButton);
   -- ****

   -- ****f* RadioButton/Tk_Select
   -- FUNCTION
   -- Select the button.
   -- PARAMETERS
   -- Buttn - Tk_RadioButton to select
   -- HISTORY
   -- 8.6.1 - Moved from Tcl.Tk.Ada.Widgets
   -- TODO
   -- Replace it with higher level of binding
   -- EXAMPLE
   -- -- Select My_Radiobutton
   -- Tk_Select(My_Radiobutton);
   -- COMMANDS
   -- Buttn select
   -- SOURCE
   procedure Tk_Select(Buttn: in Tk_RadioButton);
   -- ****

   -- ****f* RadioButton/Toggle
   -- FUNCTION
   -- Toggle the button.
   -- PARAMETERS
   -- Buttn - Tk_RadioButton to toggle
   -- HISTORY
   -- 8.6.1 - Moved from Tcl.Tk.Ada.Widgets
   -- TODO
   -- Replace it with higher level of binding
   -- EXAMPLE
   -- -- Toggle My_Radiobutton
   -- Toggle(My_Radiobutton);
   -- COMMANDS
   -- Buttn toggle
   -- SOURCE
   procedure Toggle(Buttn: in Tk_RadioButton);
   -- ****

private

   type Tk_RadioButton is new Tk_Button with null record;

end Tcl.Tk.Ada.Widgets.Button.RadioButton;

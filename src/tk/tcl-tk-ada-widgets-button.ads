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

-- ****h* Widgets/Button
-- FUNCTION
-- Provides code for manipulate Tk widget Button
-- SOURCE
package Tcl.Tk.Ada.Widgets.Button is
-- ****

   -- ****t* Button/Button.Tk_Button
   -- FUNCTION
   -- This is a non-abstract type derived directly from Tk_Widget.
   -- Each of the derived widgets redefines the Create subprogram
   -- in order to create the correct type of widget.
   -- SOURCE
   type Tk_Button is new Tk_Widget with private;
   -- ****

   -- ****f* Button/Button.Create_(function)
   -- FUNCTION
   -- Creates a new Tk_Button in the specified interpreter.
   -- PARAMETERS
   -- pathName - Tk path (starts with dot) for the widget
   -- options  - Options which will be passed to the widget. Default value is
   --            empty
   -- Interp   - Tcl interpreter to which the widget will be created. If null,
   --            the widget will be created in the "contextual" interpreter.
   --            Default value is null.
   -- RESULT
   -- Newly created Tk_Button
   -- HISTORY
   -- 8.6.1 - Moved from Tcl.Tk.Ada.Widgets
   -- EXAMPLE
   -- -- Create a new button with pathname .mybutton and label select me
   -- My_Button: constant Tk_Button := Create(".mybutton", "-text {select me}");
   -- COMMANDS
   -- button pathName ?options?
   -- SEE ALSO
   -- Button.Create_(procedure)
   -- SOURCE
   overriding function Create
     (pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := Null_Interp) return Tk_Button with
      Pre => pathName /= "";
      -- ****

     -- ****f* Button/Button.Create_(procedure)
     -- FUNCTION
     -- Creates a new Tk_Button in the specified interpreter.
     -- PARAMETERS
     -- Widgt    - Tk_Button which will be created
     -- pathName - Tk path (starts with dot) for the widget
     -- options  - Options which will be passed to the widget. Default value is
     --            empty
     -- Interp   - Tcl interpreter to which the widget will be created. If null,
     --            the widget will be created in the "contextual" interpreter.
     --            Default value is null.
     -- OUTPUT
     -- Newly created Tk_Button as parameter Widgt
     -- HISTORY
     -- 8.6.1 - Moved from Tcl.Tk.Ada.Widgets
     -- EXAMPLE
     -- -- Create button My_Button with pathname .mybutton and label click me on the current Tcl interpreter
     -- declare
     --    My_Button: Tk_Button;
     -- begin
     --    Create(My_Button, ".mybutton", "-text {click me}");
     -- end;
     -- COMMANDS
     -- button pathName ?options?
     -- SEE ALSO
     -- Button.Create_(function)
     -- SOURCE
   overriding procedure Create
     (Widgt: out Tk_Button; pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := Null_Interp) with
      Pre => pathName /= "";
     -- ****

     -- ****f* Button/Button.Get_Widget
     -- FUNCTION
     -- Get the existing Tk_Button widget
     -- PARAMETERS
     -- pathName - Tk path (starts with dot) for the widget
     -- Interp   - Tcl interpreter on which the widget exists. Can be empty.
     --            Default value is current Tcl interpreter
     -- RESULT
     -- Existing Tk_Button widget
     -- HISTORY
     -- 8.6.9 - Added
     -- EXAMPLE
     -- -- Get button widget with name .mybutton on the current Tcl interpreter
     -- My_Button: constant Tk_Button := Get_Widget(".mybutton");
     -- SOURCE
   overriding function Get_Widget
     (pathName: in String; Interp: in Tcl_Interp := Get_Context)
      return Tk_Button;
     -- ****

     -- ****f* Button/Button.Flash
     -- FUNCTION
     -- Flash the button.
     -- PARAMETERS
     -- Buttn - Tk_Button to flash
     -- HISTORY
     -- 8.6.1 - Moved from Tcl.Tk.Ada.Widgets
     -- ExAMPLE
     -- -- Flash the button My_Button
     -- Flash(My_Button);
     -- COMMANDS
     -- Buttn flash
     -- SOURCE
   procedure Flash(Buttn: in Tk_Button);
   -- ****

   -- ****f* Button/Button.Invoke
   -- FUNCTION
   -- Invoke the Tcl command associated with the button.
   -- PARAMETERS
   -- Buttn   - Tk_Button from which Tcl command will be invoked
   -- options - Tk options for the Tcl command invoke
   -- RESULT
   -- Value returned by the Tcl command associated with the button
   -- HISTORY
   -- 8.6.1 - Moved from Tcl.Tk.Ada.Widgets
   -- EXAMPLE
   -- -- Invoke the Tcl command associated with My_Button
   -- Result: constant String := Invoke(My_Button);
   -- COMMANDS
   -- Buttn invoke
   -- SOURCE
   function Invoke
     (Buttn: in Tk_Button; options: in String := "") return String;
     -- ****

private

   type Tk_Button is new Tk_Widget with null record;

end Tcl.Tk.Ada.Widgets.Button;

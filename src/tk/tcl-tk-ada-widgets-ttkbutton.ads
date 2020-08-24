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

-- ****h* Widgets/TtkButton
-- FUNCTION
-- Provides code for Tk Ttk::Button
-- SOURCE
package Tcl.Tk.Ada.Widgets.TtkButton is
-- ****

   -- ****t* TtkButton/Ttk_Button
   -- FUNCTION
   -- This is a non-abstract type derived directly from Tk_Widget.
   -- Each of the derived widgets redefines the Create subprogram
   -- in order to create the correct type of widget.
   -- SOURCE
   type Ttk_Button is new Tk_Widget with private;
   -- ****

   -- ****f* TtkButton/Create (function)
   -- FUNCTION
   -- Creates a new Ttk_Button in the specified interpreter.
   -- PARAMETERS
   -- pathName - Tk path (starts with dot) for the widget
   -- options  - Options which will be passed to the widget. Default value is
   --            empty
   -- Interp   - Tcl interpreter to which the widget will be created. If null,
   --            the widget will be created in the "contextual" interpreter.
   --            Default value is null.
   -- RESULT
   -- Newly created Ttk_Button
   -- HISTORY
   -- 8.6.1 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- EXAMPLE
   -- -- Create a new button with pathname .mybutton and text hello world
   -- My_Button: constant Ttk_Button := Create(".mybutton", "-text {hello world}");
   -- COMMANDS
   -- ttk::button pathName ?options?
   -- SEE ALSO
   -- Create (procedure)
   -- SOURCE
   overriding function Create
     (pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) return Ttk_Button with
      Pre => pathName /= "";
     -- ****

     -- ****f* TtkButton/Create (procedure)
     -- FUNCTION
     -- Creates a new Ttk_Button in the specified interpreter.
     -- PARAMETERS
     -- Widgt    - Ttk_Button which will be created
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
     -- -- Create button My_Button with pathname .mybutton and width 100px on the current Tcl interpreter
     -- declare
     --    My_Button: Ttk_Button;
     -- begin
     --    Create(My_Button, ".mybutton", "-width 100");
     -- end;
     -- COMMANDS
     -- ttk::button pathName ?options?
     -- SEE ALSO
     -- Create (function)
     -- SOURCE
   overriding procedure Create
     (Widgt: out Ttk_Button; pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) with
      Pre => pathName /= "";
     -- ****

     -- ****f* TtkButton/Invoke
     -- FUNCTION
     -- Invoke the Tcl command associated with the button.
     -- PARAMETERS
     -- Buttn   - Ttk_Button from which Tcl command will be invoked
     -- options - Tk options for the Tcl command invoke
     -- RESULT
     -- Value returned by the Tcl command associated with the button
     -- HISTORY
     -- 8.6.1 - Added
     -- TODO
     -- Replace it with higher level of binding
     -- EXAMPLE
     -- -- Invoke the code related to My_Button
     -- Result: constant String := Invoke(My_Button);
     -- COMMANDS
     -- Buttn invoke
     -- SOURCE
   function Invoke
     (Buttn: in Ttk_Button'Class; options: in String := "") return String;
   -- ****

private

   type Ttk_Button is new Tk_Widget with null record;

end Tcl.Tk.Ada.Widgets.TtkButton;

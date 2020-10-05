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

-- ****h* TtkButton/TtkCheckButton
-- FUNCTION
-- Provides code for Tk Ttk::CheckButton
-- SOURCE
package Tcl.Tk.Ada.Widgets.TtkButton.TtkCheckButton is
-- ****

   -- ****t* TtkCheckButton/TtkCheckButton.Ttk_CheckButton
   -- FUNCTION
   -- This is a non-abstract type derived directly from Tk_Widget.
   -- Each of the derived widgets redefines the Create subprogram
   -- in order to create the correct type of widget.
   -- SOURCE
   type Ttk_CheckButton is new Ttk_Button with private;
   -- ****

   -- ****f* TtkCheckButton/TtkCheckButton.Create_(function)
   -- FUNCTION
   -- Creates a new Ttk_CheckButton in the specified interpreter.
   -- PARAMETERS
   -- pathName - Tk path (starts with dot) for the widget
   -- options  - Options which will be passed to the widget. Default value is
   --            empty
   -- Interp   - Tcl interpreter to which the widget will be created. If null,
   --            the widget will be created in the "contextual" interpreter.
   --            Default value is null.
   -- RESULT
   -- Newly created Ttk_CheckButton
   -- HISTORY
   -- 8.6.1 - Added
   -- EXAMPLE
   -- -- Create a new checkbutton with pathname .mybutton and text hello world
   -- My_Button: constant Ttk_CheckButton := Create(".mybutton", "-text {hello world}");
   -- COMMANDS
   -- ttk::checkbutton pathName ?options?
   -- SEE ALSO
   -- TtkCheckButton.Create_(procedure)
   -- SOURCE
   overriding function Create
     (pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) return Ttk_CheckButton with
      Pre => pathName /= "";
     -- ****

     -- ****f* TtkCheckButton/TtkCheckButton.Create_(procedure)
     -- FUNCTION
     -- Creates a new Ttk_CheckButton in the specified interpreter.
     -- PARAMETERS
     -- Widgt    - Ttk_CheckButton which will be created
     -- pathName - Tk path (starts with dot) for the widget
     -- options  - Options which will be passed to the widget. Default value is
     --            empty
     -- Interp   - Tcl interpreter to which the widget will be created. If null,
     --            the widget will be created in the "contextual" interpreter.
     --            Default value is null.
     -- OUTPUT
     -- Newly created Ttk_CheckButton as parameter Widgt
     -- HISTORY
     -- 8.6.1 - Added
     -- EXAMPLE
     -- -- Create checkbutton My_Button with pathname .mybutton and selected state on the current Tcl interpreter
     -- declare
     --    My_Button: Ttk_CheckButton;
     -- begin
     --    Create(My_Button, ".mybutton", "-state selected");
     -- end;
     -- COMMANDS
     -- ttk::checkbutton pathName ?options?
     -- SEE ALSO
     -- TtkCheckButton.Create_(function)
     -- SOURCE
   overriding procedure Create
     (Widgt: out Ttk_CheckButton; pathName: in String;
      options: in String := ""; Interp: in Tcl_Interp := null) with
      Pre => pathName /= "";
      -- ****

     -- ****f* TtkCheckButton/TtkCheckButton.Get_Widget
     -- FUNCTION
     -- Get the existing Ttk_CheckButton widget
     -- PARAMETERS
     -- pathName - Tk path (starts with dot) for the widget
     -- Interp   - Tcl interpreter on which the widget exists. Can be empty.
     --            Default value is current Tcl interpreter
     -- RESULT
     -- Existing Ttk_CheckButton widget
     -- HISTORY
     -- 8.6.9 - Added
     -- EXAMPLE
     -- -- Get checkbutton widget with name .mycheckbutton on the current Tcl interpreter
     -- My_Checkbutton: constant Ttk_CheckButton := Get_Widget(".mycheckbutton");
     -- SOURCE
   overriding function Get_Widget
     (pathName: in String; Interp: in Tcl_Interp := Get_Context)
      return Ttk_CheckButton;
     -- ****

private

   type Ttk_CheckButton is new Ttk_Button with null record;

end Tcl.Tk.Ada.Widgets.TtkButton.TtkCheckButton;

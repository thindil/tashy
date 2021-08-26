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

-- ****h* Widgets/TtkMenuButton
-- FUNCTION
-- Provides code for manipulate Tk widget Ttk:menubutton
-- SOURCE
package Tcl.Tk.Ada.Widgets.TtkMenuButton is
-- ****

   -- ****t* TtkMenuButton/TtkMenuButton.Ttk_MenuButton
   -- FUNCTION
   -- This is a non-abstract type derived directly from Tk_Widget.
   -- Each of the derived widgets redefines the Create subprogram
   -- in order to create the correct type of widget.
   -- SOURCE
   type Ttk_MenuButton is new Tk_Widget with private;
   -- ****

   -- ****f* TtkMenuButton/TtkMenuButton.Create_(function)
   -- FUNCTION
   -- Creates a new Ttk_MenuButton in the specified interpreter.
   -- PARAMETERS
   -- pathName - Tk path (starts with dot) for the widget
   -- options  - Options which will be passed to the widget. Default value is
   --            empty
   -- Interp   - Tcl interpreter to which the widget will be created. If null,
   --            the widget will be created in the "contextual" interpreter.
   --            Default value is null.
   -- RESULT
   -- Newly created Ttk_MenuButton
   -- HISTORY
   -- 8.6.1 - Added
   -- EXAMPLE
   -- -- Create a new menubutton with pathname .mymenubutton and menu .mymenu
   -- My_Menu_Button: constant Ttk_MenuButton := Create(".mymenubutton", "-menu .mymenu");
   -- COMMANDS
   -- ttk::menubutton pathName ?options?
   -- SEE ALSO
   -- TtkMenuButton.Create_(procedure)
   -- SOURCE
   overriding function Create
     (pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := Null_Interp) return Ttk_MenuButton with
      Pre => pathName /= "";
     -- ****

     -- ****f* TtkMenuButton/TtkMenuButton.Create_(procedure)
     -- FUNCTION
     -- Creates a new Ttk_MenuButton in the specified interpreter.
     -- PARAMETERS
     -- Widgt    - Ttk_MenuButton which will be created
     -- pathName - Tk path (starts with dot) for the widget
     -- options  - Options which will be passed to the widget. Default value is
     --            empty
     -- Interp   - Tcl interpreter to which the widget will be created. If null,
     --            the widget will be created in the "contextual" interpreter.
     --            Default value is null.
     -- HISTORY
     -- 8.6.1 - Added
     -- OUTPUT
     -- Newly created Ttk_MenuButton as parameter Widgt
     -- EXAMPLE
     -- -- Create menubutton My_Menu_Button with pathname .mymenubutton and label click me on the current Tcl interpreter
     -- declare
     --    My_Menu_Button: Ttk_MenuButton;
     -- begin
     --    Create(My_Menu_Button, ".mymenubutton", "-text {click me}");
     -- end;
     -- COMMANDS
     -- ttk::menubutton pathName ?options?
     -- SEE ALSO
     -- TtkMenuButton.Create_(function)
     -- SOURCE
   overriding procedure Create
     (Widgt: out Ttk_MenuButton; pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := Null_Interp) with
      Pre => pathName /= "";
      -- ****

     -- ****f* TtkMenuButton/TtkMenuButton.Get_Widget
     -- FUNCTION
     -- Get the existing Ttk_MenuButton widget
     -- PARAMETERS
     -- pathName - Tk path (starts with dot) for the widget
     -- Interp   - Tcl interpreter on which the widget exists. Can be empty.
     --            Default value is current Tcl interpreter
     -- RESULT
     -- Existing Ttk_MenuButton widget
     -- HISTORY
     -- 8.6.9 - Added
     -- EXAMPLE
     -- -- Get button widget with name .mybutton on the current Tcl interpreter
     -- My_Button: constant Ttk_MenuButton := Get_Widget(".mybutton");
     -- SOURCE
   overriding function Get_Widget
     (pathName: in String; Interp: in Tcl_Interp := Get_Context)
      return Ttk_MenuButton;
     -- ****

private

   type Ttk_MenuButton is new Tk_Widget with null record;

end Tcl.Tk.Ada.Widgets.TtkMenuButton;

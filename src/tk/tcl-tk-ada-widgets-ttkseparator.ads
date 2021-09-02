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

-- ****h* Widgets/TtkSeparator
-- FUNCTION
-- Provides code for manipulate Tk widget Ttk::Separator
-- SOURCE
package Tcl.Tk.Ada.Widgets.TtkSeparator with
   SPARK_Mode
is
   pragma Elaborate_Body;
-- ****

   -- ****t* TtkSeparator/TtkSeparator.Ttk_Separator
   -- FUNCTION
   -- This is a non-abstract type derived directly from Tk_Widget.
   -- Each of the derived widgets redefines the Create subprogram
   -- in order to create the correct type of widget.
   -- SOURCE
   type Ttk_Separator is new Tk_Widget with private;
   -- ****

   -- ****f* TtkSeparator/TtkSeparator.Create_(function)
   -- FUNCTION
   -- Creates a new Ttk_Separator in the specified interpreter.
   -- PARAMETERS
   -- pathName - Tk path (starts with dot) for the widget
   -- options  - Options which will be passed to the widget. Default value is
   --            empty
   -- Interp   - Tcl interpreter to which the widget will be created. If null,
   --            the widget will be created in the "contextual" interpreter.
   --            Default value is null.
   -- RESULT
   -- Newly created Ttk_Separator
   -- HISTORY
   -- 8.6.1 - Added
   -- EXAMPLE
   -- -- Create a new horizontal separator with pathname .myseparator
   -- My_Separator: constant Ttk_Separator := Create(".myseparator", "-orient horizontal");
   -- COMMANDS
   -- ttk::separator pathName ?options?
   -- SEE ALSO
   -- TtkSeparator.Create_(procedure)
   -- SOURCE
   overriding function Create
     (pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := Null_Interp) return Ttk_Separator with
      Global => null;
     -- ****

     -- ****f* TtkSeparator/TtkSeparator.Create_(procedure)
     -- FUNCTION
     -- Creates a new Ttk_Separator in the specified interpreter.
     -- PARAMETERS
     -- Widgt    - Ttk_Separator which will be created
     -- pathName - Tk path (starts with dot) for the widget
     -- options  - Options which will be passed to the widget. Default value is
     --            empty
     -- Interp   - Tcl interpreter to which the widget will be created. If null,
     --            the widget will be created in the "contextual" interpreter.
     --            Default value is null.
     -- OUTPUT
     -- Newly created Ttk_Separator as parameter Widgt
     -- HISTORY
     -- 8.6.1 - Added
     -- EXAMPLE
     -- -- Create vertical separator My_Separator with pathname .myseparator on the current Tcl interpreter
     -- declare
     --    My_Separator: Ttk_Separator;
     -- begin
     --    Create(My_Separator, ".myseparator", "-orient vertical");
     -- end;
     -- COMMANDS
     -- ttk::separator pathName ?options?
     -- SEE ALSO
     -- TtkSeparator.Create_(function)
     -- SOURCE
   overriding procedure Create
     (Widgt: out Ttk_Separator; pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := Null_Interp) with
      Global => null;
      -- ****

     -- ****f* TtkSeparator/TtkSeparator.Get_Widget
     -- FUNCTION
     -- Get the existing Ttk_Separator widget
     -- PARAMETERS
     -- pathName - Tk path (starts with dot) for the widget
     -- Interp   - Tcl interpreter on which the widget exists. Can be empty.
     --            Default value is current Tcl interpreter
     -- RESULT
     -- Existing Ttk_Separator widget
     -- HISTORY
     -- 8.6.9 - Added
     -- EXAMPLE
     -- -- Get separator widget with name .myseparator on the current Tcl interpreter
     -- My_Separator: constant Ttk_Separator := Get_Widget(".myseparator");
     -- SOURCE
   overriding function Get_Widget
     (pathName: in String; Interp: in Tcl_Interp := Get_Context)
      return Ttk_Separator with
      Global => null;
     -- ****

private

   type Ttk_Separator is new Tk_Widget with null record;

end Tcl.Tk.Ada.Widgets.TtkSeparator;

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

-- ****h* Widgets/TtkSizeGrip
-- FUNCTION
-- Provides code for manipulate Tk widget Ttk::SizeGrip
-- SOURCE
package Tcl.Tk.Ada.Widgets.TtkSizeGrip is
-- ****

   -- ****t* TtkSizeGrip/Ttk_SizeGrip
   -- FUNCTION
   -- This is a non-abstract type derived directly from Tk_Widget.
   -- Each of the derived widgets redefines the Create subprogram
   -- in order to create the correct type of widget.
   -- SOURCE
   type Ttk_SizeGrip is new Tk_Widget with private;
   -- ****

   -- ****f* TtkSizeGrip/Create (function)
   -- FUNCTION
   -- Creates a new Ttk_SizeGrip in the specified interpreter.
   -- PARAMETERS
   -- pathName - Tk path (starts with dot) for the widget
   -- options  - Options which will be passed to the widget. Default value is
   --            empty
   -- Interp   - Tcl interpreter to which the widget will be created. If null,
   --            the widget will be created in the "contextual" interpreter.
   --            Default value is null.
   -- RESULT
   -- Newly created Ttk_SizeGrip
   -- HISTORY
   -- 8.6.6 - Added
   -- EXAMPLE
   -- -- Create a new sizegrip with pathname .mygrip
   -- My_Grip: constant Ttk_SizeGrip := Create(".mygrip");
   -- COMMANDS
   -- ttk::sizegrip pathName ?options?
   -- SEE ALSO
   -- Create (procedure)
   -- SOURCE
   overriding function Create
     (pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) return Ttk_SizeGrip with
      Pre => pathName /= "";
     -- ****

     -- ****f* TtkSizeGrip/Create (procedure)
     -- FUNCTION
     -- Creates a new Ttk_SizeGrip in the specified interpreter.
     -- PARAMETERS
     -- Widgt    - Ttk_SizeGrip which will be created
     -- pathName - Tk path (starts with dot) for the widget
     -- options  - Options which will be passed to the widget. Default value is
     --            empty
     -- Interp   - Tcl interpreter to which the widget will be created. If null,
     --            the widget will be created in the "contextual" interpreter.
     --            Default value is null.
     -- OUTPUT
     -- Newly created Ttk_Separator as parameter Widgt
     -- HISTORY
     -- 8.6.6 - Added
     -- EXAMPLE
     -- -- Create sizegrip My_Grip with pathname .mygrip on the current Tcl interpreter
     -- declare
     --    My_Grip: Ttk_SizeGrip;
     -- begin
     --    Create(My_Grip, ".mygrip");
     -- end;
     -- COMMANDS
     -- ttk::sizegrip pathName ?options?
     -- SEE ALSO
     -- Create (function)
     -- SOURCE
   overriding procedure Create
     (Widgt: out Ttk_SizeGrip; pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) with
      Pre => pathName /= "";
      -- ****

     -- ****f* TtkSizeGrip/Get_Widget
     -- FUNCTION
     -- Get the existing Ttk_SizeGrip widget
     -- PARAMETERS
     -- pathName - Tk path (starts with dot) for the widget
     -- Interp   - Tcl interpreter on which the widget exists. Can be empty.
     --            Default value is current Tcl interpreter
     -- RESULT
     -- Existing Ttk_SizeGrip widget
     -- HISTORY
     -- 8.6.9 - Added
     -- EXAMPLE
     -- -- Get sizegrip widget with name .mygrip on the current Tcl interpreter
     -- My_Grip: constant Ttk_SizeGrip := Get_Widget(".mygrip");
     -- SOURCE
   overriding function Get_Widget
     (pathName: in String; Interp: in Tcl_Interp := Get_Context)
      return Ttk_SizeGrip;
     -- ****

private

   type Ttk_SizeGrip is new Tk_Widget with null record;

end Tcl.Tk.Ada.Widgets.TtkSizeGrip;

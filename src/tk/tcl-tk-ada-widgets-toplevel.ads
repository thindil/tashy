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

-- ****h* Widgets/Toplevel
-- FUNCTION
-- Provides code for manipulate Tk widget Toplevel
-- SOURCE
package Tcl.Tk.Ada.Widgets.Toplevel with
   SPARK_Mode
is
   pragma Elaborate_Body;
-- ****

   -- ****t* Toplevel/Toplevel.Tk_Toplevel
   -- FUNCTION
   -- This is a non-abstract type derived directly from Tk_Widget.
   -- Each of the derived widgets redefines the Create subprogram
   -- in order to create the correct type of widget.
   -- SOURCE
   type Tk_Toplevel is new Tk_Widget with private;
   -- ****

   -- ****f* Toplevel/Toplevel.Create_(function)
   -- FUNCTION
   -- Creates a new Tk_Toplevel in the specified interpreter.
   -- PARAMETERS
   -- pathName - Tk path (starts with dot) for the widget
   -- options  - Options which will be passed to the widget. Default value is
   --            empty
   -- Interp   - Tcl interpreter to which the widget will be created. If null,
   --            the widget will be created in the "contextual" interpreter.
   --            Default value is null.
   -- RESULT
   -- Newly created Tk_Toplevel
   -- HISTORY
   -- 8.6.1 - Moved from Tcl.Tk.Ada.Widgets
   -- EXAMPLE
   -- -- Create a new toplevel with pathname .mywindow and black background
   -- My_Window: constant Tk_Toplevel := Create(".mywindow", "-background black");
   -- COMMANDS
   -- toplevel pathName ?options?
   -- SEE ALSO
   -- Toplevel.Create_(procedure)
   -- SOURCE
   overriding function Create
     (pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := Null_Interp) return Tk_Toplevel with
      Global => null;
     -- ****

     -- ****f* Toplevel/Toplevel.Create_(procedure)
     -- FUNCTION
     -- Creates a new Tk_Toplevel in the specified interpreter.
     -- PARAMETERS
     -- Widgt    - Tk_Toplevel which will be created
     -- pathName - Tk path (starts with dot) for the widget
     -- options  - Options which will be passed to the widget. Default value is
     --            empty
     -- Interp   - Tcl interpreter to which the widget will be created. If null,
     --            the widget will be created in the "contextual" interpreter.
     --            Default value is null.
     -- OUTPUT
     -- Newly created Tk_Toplevel as parameter Widgt
     -- HISTORY
     -- 8.6.1 - Moved from Tcl.Tk.Ada.Widgets
     -- EXAMPLE
     -- -- Create toplevel My_Window with pathname .mywindow and width 200px on the current Tcl interpreter
     -- declare
     --    My_Window: Tk_Toplevel;
     -- begin
     --    Create(My_Window, ".mywindow", "-width 200");
     -- end;
     -- COMMANDS
     -- toplevel pathName ?options?
     -- SEE ALSO
     -- Toplevel.Create_(function)
     -- SOURCE
   overriding procedure Create
     (Widgt: out Tk_Toplevel; pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := Null_Interp) with
      Global => null;
      -- ****

     -- ****f* Toplevel/Toplevel.Get_Widget
     -- FUNCTION
     -- Get the existing Tk_Toplevel widget
     -- PARAMETERS
     -- pathName - Tk path (starts with dot) for the widget
     -- Interp   - Tcl interpreter on which the widget exists. Can be empty.
     --            Default value is current Tcl interpreter
     -- RESULT
     -- Existing Tk_Toplevel widget
     -- HISTORY
     -- 8.6.9 - Added
     -- EXAMPLE
     -- -- Get toplevel widget with name .mywindow on the current Tcl interpreter
     -- My_Window: constant Tk_Toplevel := Get_Widget(".mywindow");
     -- SOURCE
   overriding function Get_Widget
     (pathName: in String; Interp: in Tcl_Interp := Get_Context)
      return Tk_Toplevel with
      Global => null;
     -- ****

private

   type Tk_Toplevel is new Tk_Widget with null record;

end Tcl.Tk.Ada.Widgets.Toplevel;

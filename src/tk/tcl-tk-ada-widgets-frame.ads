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

-- ****h* Widgets/Frame
-- FUNCTION
-- Provides code for manipulate Tk widget Frame
-- SOURCE
package Tcl.Tk.Ada.Widgets.Frame is
-- ****

   -- ****t* Frame/Tk_Frame
   -- FUNCTION
   -- This is a non-abstract type derived directly from Tk_Widget.
   -- Each of the derived widgets redefines the Create subprogram
   -- in order to create the correct type of widget.
   -- SOURCE
   type Tk_Frame is new Tk_Widget with private;
   -- ****

   -- ****f* Frame/Create (function)
   -- FUNCTION
   -- Creates a new Tk_Frame in the specified interpreter.
   -- PARAMETERS
   -- pathName - Tk path (starts with dot) for the widget
   -- options  - Options which will be passed to the widget. Default value is
   --            empty
   -- Interp   - Tcl interpreter to which the widget will be created. If null,
   --            the widget will be created in the "contextual" interpreter.
   --            Default value is null.
   -- RESULT
   -- Newly created Tk_Frame
   -- HISTORY
   -- 8.6.1 - Moved from Tcl.Tk.Ada.Widgets
   -- EXAMPLE
   -- -- Create a new frame with pathname .myframe
   -- My_Frame: constant Tk_Frame := Create(".myframe");
   -- COMMANDS
   -- frame pathName ?options?
   -- SEE ALSO
   -- Create (procedure)
   -- SOURCE
   overriding function Create
     (pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) return Tk_Frame with
      Pre => pathName /= "";
     -- ****

     -- ****f* Frame/Create (procedure)
     -- FUNCTION
     -- Creates a new Tk_Frame in the specified interpreter.
     -- PARAMETERS
     -- Widgt    - Tk_Frame which will be created
     -- pathName - Tk path (starts with dot) for the widget
     -- options  - Options which will be passed to the widget. Default value is
     --            empty
     -- Interp   - Tcl interpreter to which the widget will be created. If null,
     --            the widget will be created in the "contextual" interpreter.
     --            Default value is null.
     -- OUTPUT
     -- Newly created Tk_Frame as parameter Widgt
     -- HISTORY
     -- 8.6.1 - Moved from Tcl.Tk.Ada.Widgets
     -- EXAMPLE
     -- -- Create frame My_Frame with pathname .myframe and with black backgroud on the current Tcl interpreter
     -- declare
     --    My_Frame: Tk_Frame;
     -- begin
     --    Create(My_Frame, ".myframe", "-background black");
     -- end;
     -- COMMANDS
     -- frame pathName ?options?
     -- SEE ALSO
     -- Create (function)
     -- SOURCE
   overriding procedure Create
     (Widgt: out Tk_Frame; pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) with
      Pre => pathName /= "";
      -- ****

     -- ****f* Frame/Get_Widget
     -- FUNCTION
     -- Get the existing Tk_Frame widget
     -- PARAMETERS
     -- pathName - Tk path (starts with dot) for the widget
     -- Interp   - Tcl interpreter on which the widget exists. Can be empty.
     --            Default value is current Tcl interpreter
     -- RESULT
     -- Existing Tk_Frame widget
     -- HISTORY
     -- 8.6.9 - Added
     -- EXAMPLE
     -- -- Get frame widget with name .myframe on the current Tcl interpreter
     -- My_Frame: constant Tk_Frame := Get_Widget(".myframe");
     -- SOURCE
   overriding function Get_Widget
     (pathName: in String; Interp: in Tcl_Interp := Get_Context)
      return Tk_Frame;
     -- ****

private

   type Tk_Frame is new Tk_Widget with null record;

end Tcl.Tk.Ada.Widgets.Frame;

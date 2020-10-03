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

-- ****h* Widgets/Label
-- FUNCTION
-- Provides code for manipulate Tk widget Label
-- SOURCE
package Tcl.Tk.Ada.Widgets.Label is
-- ****

   -- ****t* Label/Label.Tk_Label
   -- FUNCTION
   -- This is a non-abstract type derived directly from Tk_Widget.
   -- Each of the derived widgets redefines the Create subprogram
   -- in order to create the correct type of widget.
   -- SOURCE
   type Tk_Label is new Tk_Widget with private;
   -- ****

   -- ****f* Label/Label.Create_(function)
   -- FUNCTION
   -- Creates a new Tk_Label in the specified interpreter.
   -- PARAMETERS
   -- pathName - Tk path (starts with dot) for the widget
   -- options  - Options which will be passed to the widget. Default value is
   --            empty
   -- Interp   - Tcl interpreter to which the widget will be created. If null,
   --            the widget will be created in the "contextual" interpreter.
   --            Default value is null.
   -- RESULT
   -- Newly created Tk_Label
   -- HISTORY
   -- 8.6.1 - Moved from Tcl.Tk.Ada.Widgets
   -- EXAMPLE
   -- -- Create a new label with pathname .mylabel with text hello world
   -- My_Label: constant Tk_Label := Create(".mylabel", "-text {hello world}");
   -- COMMANDS
   -- label pathName ?options?
   -- SEE ALSO
   -- Label.Create_(procedure)
   -- SOURCE
   overriding function Create
     (pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) return Tk_Label with
      Pre => pathName /= "";
     -- ****

     -- ****f* Label/Label.Create_(procedure)
     -- FUNCTION
     -- Creates a new Tk_Label in the specified interpreter.
     -- PARAMETERS
     -- Widgt    - Tk_Label which will be created
     -- pathName - Tk path (starts with dot) for the widget
     -- options  - Options which will be passed to the widget. Default value is
     --            empty
     -- Interp   - Tcl interpreter to which the widget will be created. If null,
     --            the widget will be created in the "contextual" interpreter.
     --            Default value is null.
     -- OUTPUT
     -- Newly created Tk_Label as parameter Widgt
     -- HISTORY
     -- 8.6.1 - Moved from Tcl.Tk.Ada.Widgets
     -- EXAMPLE
     -- -- Create label My_Label with pathname .mylabel and with text hello world on the current Tcl interpreter
     -- declare
     --    My_Label: Tk_Label;
     -- begin
     --    Create(My_Label, ".mylabel", "-text {hello world}");
     -- end;
     -- COMMANDS
     -- label pathName ?options?
     -- SEE ALSO
     -- Label.Create_(function)
     -- SOURCE
   overriding procedure Create
     (Widgt: out Tk_Label; pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) with
      Pre => pathName /= "";
      -- ****

     -- ****f* Label/Label.Get_Widget
     -- FUNCTION
     -- Get the existing Tk_Label widget
     -- PARAMETERS
     -- pathName - Tk path (starts with dot) for the widget
     -- Interp   - Tcl interpreter on which the widget exists. Can be empty.
     --            Default value is current Tcl interpreter
     -- RESULT
     -- Existing Tk_Label widget
     -- HISTORY
     -- 8.6.9 - Added
     -- EXAMPLE
     -- -- Get label widget with name .mylabel on the current Tcl interpreter
     -- My_Label: constant Tk_Label := Get_Widget(".mylabel");
     -- SOURCE
   overriding function Get_Widget
     (pathName: in String; Interp: in Tcl_Interp := Get_Context)
      return Tk_Label;
     -- ****

private

   type Tk_Label is new Tk_Widget with null record;

end Tcl.Tk.Ada.Widgets.Label;

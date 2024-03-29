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

-- ****h* Widgets/TtkLabelFrame
-- FUNCTION
-- Provides code for manipulate Tk widget Ttk::LabelFrame
-- SOURCE
package Tcl.Tk.Ada.Widgets.TtkLabelFrame with
   SPARK_Mode
is
   pragma Elaborate_Body;
-- ****

   -- ****t* TtkLabelFrame/TtkLabelFrame.Ttk_LabelFrame
   -- FUNCTION
   -- This is a non-abstract type derived directly from Tk_Widget.
   -- Each of the derived widgets redefines the Create subprogram
   -- in order to create the correct type of widget.
   -- SOURCE
   type Ttk_LabelFrame is new Tk_Widget with private;
   -- ****

   -- ****f* TtkLabelFrame/TtkLabelFrame.Create_(function)
   -- FUNCTION
   -- Creates a new Ttk_LabelFrame in the specified interpreter.
   -- PARAMETERS
   -- pathName - Tk path (starts with dot) for the widget
   -- options  - Options which will be passed to the widget. Default value is
   --            empty
   -- Interp   - Tcl interpreter to which the widget will be created. If null,
   --            the widget will be created in the "contextual" interpreter.
   --            Default value is null.
   -- RESULT
   -- Newly created Ttk_LabelFrame
   -- HISTORY
   -- 8.6.1 - Added
   -- EXAMPLE
   -- -- Create a new frame with pathname .myframe with label hello world
   -- My_Frame: constant Ttk_LabelFrame := Create(".myframe", "-text {hello world}");
   -- COMMANDS
   -- ttk::labelframe pathName ?options?
   -- SEE ALSO
   -- TtkLabelFrame.Create_(procedure)
   -- SOURCE
   overriding function Create
     (pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := Null_Interp) return Ttk_LabelFrame with
      Global => null;
     -- ****

     -- ****f* TtkLabelFrame/TtkLabelFrame.Create_(procedure)
     -- FUNCTION
     -- Creates a new Ttk_LabelFrame in the specified interpreter.
     -- PARAMETERS
     -- Widgt    - Ttk_LabelFrame which will be created
     -- pathName - Tk path (starts with dot) for the widget
     -- options  - Options which will be passed to the widget. Default value is
     --            empty
     -- Interp   - Tcl interpreter to which the widget will be created. If null,
     --            the widget will be created in the "contextual" interpreter.
     --            Default value is null.
     -- OUTPUT
     -- Newly created Ttk_LabelFrame as parameter Widgt
     -- HISTORY
     -- 8.6.1 - Added
     -- EXAMPLE
     -- -- Create frame My_Frame with pathname .myframe and with label hello world on the current Tcl interpreter
     -- declare
     --    My_Frame: Ttk_LabelFrame;
     -- begin
     --    Create(My_Frame, ".myframe", "-text {hello world}");
     -- end;
     -- COMMANDS
     -- ttk::labelframe pathName ?options?
     -- SEE ALSO
     -- TtkLabelFrame.Create_(function)
     -- SOURCE
   overriding procedure Create
     (Widgt: out Ttk_LabelFrame; pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := Null_Interp) with
      Global => null;
      -- ****

     -- ****f* TtkLabelFrame/TtkLabelFrame.Get_Widget
     -- FUNCTION
     -- Get the existing Ttk_Label widget
     -- PARAMETERS
     -- pathName - Tk path (starts with dot) for the widget
     -- Interp   - Tcl interpreter on which the widget exists. Can be empty.
     --            Default value is current Tcl interpreter
     -- RESULT
     -- Existing Ttk_LabelFrame widget
     -- HISTORY
     -- 8.6.9 - Added
     -- EXAMPLE
     -- -- Get frame widget with name .myframe on the current Tcl interpreter
     -- My_Frame: constant Ttk_LabelFrame := Get_Widget(".myframe");
     -- SOURCE
   overriding function Get_Widget
     (pathName: in String; Interp: in Tcl_Interp := Get_Context)
      return Ttk_LabelFrame with
      Global => null;
     -- ****

private

   type Ttk_LabelFrame is new Tk_Widget with null record;

end Tcl.Tk.Ada.Widgets.TtkLabelFrame;

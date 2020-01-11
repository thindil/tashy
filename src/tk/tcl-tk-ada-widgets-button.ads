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

   -- ****t* Button/Tk_Button
   -- FUNCTION
   -- This is a non-abstract type derived directly from Tk_Widget.
   -- Each of the derived widgets redefines the Create subprogram
   -- in order to create the correct type of widget.
   -- SOURCE
   type Tk_Button is new Tk_Widget with private;
   -- ****

   -- ****f* Button/Create
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
   -- RESULT
   -- Newly created Tk_Button
   -- SOURCE
   function Create
     (pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) return Tk_Button;
   procedure Create
     (Widgt: out Tk_Button; pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null);
   -- ****

   -- ****f* Button/Flash
   -- FUNCTION
   -- Flash the button.
   -- PARAMETERS
   -- Buttn - Tk_Button to flash
   -- SOURCE
   procedure Flash(Buttn: in Tk_Button'Class);
   -- ****

   -- ****f* Button/Invoke
   -- FUNCTION
   -- Invoke the Tcl command associated with the button.
   -- PARAMETERS
   -- Buttn   - Tk_Button from which Tcl command will be invoked
   -- options - Tk options for the Tcl command invoke
   -- SOURCE
   function Invoke
     (Buttn: in Tk_Button'Class; options: in String := "") return String;
   -- ****

private

   type Tk_Button is new Tk_Widget with null record;

end Tcl.Tk.Ada.Widgets.Button;

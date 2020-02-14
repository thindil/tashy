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

-- ****h* Widgets/Toplevel
-- FUNCTION
-- Provides code for manipulate Tk widget Toplevel
-- SOURCE
package Tcl.Tk.Ada.Widgets.Toplevel is
-- ****

   -- ****t* Toplevel/Tk_Toplevel
   -- FUNCTION
   -- This is a non-abstract type derived directly from Tk_Widget.
   -- Each of the derived widgets redefines the Create subprogram
   -- in order to create the correct type of widget.
   -- SOURCE
   type Tk_Toplevel is new Tk_Widget with private;
   -- ****

   -- ****f* Toplevel/Create
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
   -- RESULT
   -- Newly created Tk_Toplevel
   -- SOURCE
   function Create
     (pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) return Tk_Toplevel with
      Pre => pathName /= "";
   procedure Create
     (Widgt: out Tk_Toplevel; pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) with
      Pre => pathName /= "";
      -- ****

private

   type Tk_Toplevel is new Tk_Widget with null record;

end Tcl.Tk.Ada.Widgets.Toplevel;

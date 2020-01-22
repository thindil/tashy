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

-- ****h* Image/Photo
-- FUNCTION
-- Provides code for manipulate Tk image of type photo
-- SOURCE
package Tcl.Tk.Ada.Image.Photo is
-- ****

   -- ****t* Photo/Tk_Photo
   -- FUNCTION
   -- This is a non-abstract type derived directly from Tk_Widget.
   -- Each of the derived widgets redefines the Create subprogram
   -- in order to create the correct type of widget.
   -- SOURCE
   type Tk_Photo is new Tk_Widget with private;
   -- ****

   -- ****f* Photo/Create
   -- FUNCTION
   -- Creates a new Tk_Photo in the specified interpreter.
   -- PARAMETERS
   -- Widgt    - Tk_Photo which will be created
   -- pathName - Tk name of the image
   -- options  - Options which will be passed to the image. Default value is
   --            empty
   -- Interp   - Tcl interpreter to which the image will be created. If null,
   --            the image will be created in the "contextual" interpreter.
   --            Default value is null.
   -- RESULT
   -- Newly created Tk_Photo
   -- SOURCE
   function Create
     (pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) return Tk_Photo with
      Pre => (pathName /= "");
   procedure Create
     (Widgt: out Tk_Photo; pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) with
      Pre => (pathName /= "");
      -- ****

      -- ****f* Photo/Copy
      -- FUNCTION
      -- Copy one photo to another
      -- PARAMETERS
      -- Source  - Tk_Photo which will be used as source
      -- Target  - Tk_Photo which will be used as destination
      -- Options - Aditional Tk options for copy command. Default value is
      --           empty
      -- SOURCE
   procedure Copy(Source, Target: in Tk_Photo; Options: in String := "");
   -- ****

private

   type Tk_Photo is new Tk_Widget with null record;

end Tcl.Tk.Ada.Image.Photo;

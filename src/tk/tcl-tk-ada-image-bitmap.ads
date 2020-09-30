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

-- ****h* Image/Bitmap
-- FUNCTION
-- Provides code for manipulate Tk image of type bitmap
-- SOURCE
package Tcl.Tk.Ada.Image.Bitmap is
-- ****

   -- ****t* Bitmap/Bitmap.Tk_Bitmap
   -- FUNCTION
   -- This is a non-abstract type derived directly from Tk_Widget.
   -- Each of the derived widgets redefines the Create subprogram
   -- in order to create the correct type of widget.
   -- SOURCE
   type Tk_Bitmap is new Tk_Widget with private;
   -- ****

   -- ****f* Bitmap/Bitmap.Create_(function)
   -- FUNCTION
   -- Creates a new Tk_Bitmap in the specified interpreter.
   -- PARAMETERS
   -- pathName - Tk name of the image
   -- options  - Options which will be passed to the image. Default value is
   --            empty
   -- Interp   - Tcl interpreter to which the image will be created. If null,
   --            the image will be created in the "contextual" interpreter.
   --            Default value is null.
   -- RESULT
   -- Newly created Tk_Bitmap
   -- HISTORY
   -- 8.6.1 - Added
   -- EXAMPLE
   -- -- Create bitmap image with name arrow-up from the code on default interpreter
   -- Arrow_Up: constant Tk_Bitmap := Create("arrow-up", "-data {#define arrowUp_width 7  #define arrowUp_height 4 static char arrowUp_bits[] = { 0x08, 0x1c, 0x3e, 0x7f };}");
   -- COMMANDS
   -- image create bitmap name ?options?
   -- SEE ALSO
   -- Bitmap.Create_(procedure)
   -- SOURCE
   function Create
     (pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) return Tk_Bitmap with
      Pre => (pathName /= "");
      -- ****

      -- ****f* Bitmap/Bitmap.Create_(procedure)
      -- FUNCTION
      -- Creates a new Tk_Bitmap in the specified interpreter.
      -- PARAMETERS
      -- Widgt    - Tk_Bitmap which will be created
      -- pathName - Tk name of the image
      -- options  - Options which will be passed to the image. Default value is
      --            empty
      -- Interp   - Tcl interpreter to which the image will be created. If null,
      --            the image will be created in the "contextual" interpreter.
      --            Default value is null.
      -- OUTPUT
      -- Newly created Tk_Bitmap as the Widgt parameter
      -- HISTORY
      -- 8.6.1 - Added
      -- EXAMPLE
      -- -- Create bitmap image with name arrow-down from the code on default interpreter
      -- declare
      --    Arrow_Down: Tk_Bitmap;
      -- begin
      --    Create(Arror_Down, "arrow-down", "-data {#define arrowDown_width 7  #define arrowDown_height 4 static char arrowDown_bits[] = { 0x7f, 0x3e, 0x1c, 0x08 };}");
      -- end;
      -- COMMANDS
      -- image create bitmap name ?options?
      -- SEE ALSO
      -- Bitmap.Create_(function)
      -- SOURCE
   procedure Create
     (Widgt: out Tk_Bitmap; pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) with
      Pre => (pathName /= "");
      -- ****

     -- ****f* Bitmap/Bitmap.Get_Widget
     -- FUNCTION
     -- Get the existing Tk_Bitmap image
     -- PARAMETERS
     -- pathName - Tk path (starts with dot) for the image
     -- Interp   - Tcl interpreter on which the image exists. Can be empty.
     --            Default value is current Tcl interpreter
     -- RESULT
     -- Existing Tk_Bitmap image
     -- HISTORY
     -- 8.6.9 - Added
     -- EXAMPLE
     -- -- Get bitmap image with name .mybitmap on the current Tcl interpreter
     -- My_Bitmap: constant Tk_Bitmap := Get_Widget(".mybitmap");
     -- SOURCE
   overriding function Get_Widget
     (pathName: in String; Interp: in Tcl_Interp := Get_Context)
      return Tk_Bitmap;
     -- ****

private

   type Tk_Bitmap is new Tk_Widget with null record;

end Tcl.Tk.Ada.Image.Bitmap;

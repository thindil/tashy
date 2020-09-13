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

   -- ****f* Photo/Create (function)
   -- FUNCTION
   -- Creates a new Tk_Photo in the specified interpreter.
   -- PARAMETERS
   -- pathName - Tk name of the image
   -- options  - Options which will be passed to the image. Default value is
   --            empty
   -- Interp   - Tcl interpreter to which the image will be created. If null,
   --            the image will be created in the "contextual" interpreter.
   --            Default value is null.
   -- RESULT
   -- Newly created Tk_Photo
   -- HISTORY
   -- 8.6.1 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- EXAMPLE
   -- -- Create image Logo from file mylogo.png on the current Tcl interpreter
   -- My_Logo: constant Tk_Photo := Create("Logo", "-file mylogo.png");
   -- COMMANDS
   -- image create photo name ?options?
   -- SEE ALSO
   -- Create (procedure)
   -- SOURCE
   function Create
     (pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) return Tk_Photo with
      Pre => (pathName /= "");
      -- ****

      -- ****f* Photo/Create (procedure)
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
      -- OUTPUT
      -- Newly created Tk_Photo as parameter Widgt
      -- HISTORY
      -- 8.6.1 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- EXAMPLE
      -- -- Create image Paint from file mypaint.gif on the current Tcl interpreter
      -- declare
      --    My_Paint: Tk_Photo;
      -- begin
      --    Create(My_Paint, "Paint", "-file mypaint.gif");
      -- end;
      -- COMMANDS
      -- image create photo name ?options?
      -- SEE ALSO
      -- Create (function)
      -- SOURCE
   procedure Create
     (Widgt: out Tk_Photo; pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) with
      Pre => (pathName /= "");
      -- ****

     -- ****f* Bitmap/Get_Widget
     -- FUNCTION
     -- Get the existing Tk_Photo image
     -- PARAMETERS
     -- pathName - Tk path (starts with dot) for the image
     -- Interp   - Tcl interpreter on which the image exists. Can be empty.
     --            Default value is current Tcl interpreter
     -- RESULT
     -- Existing Tk_Photo image
     -- HISTORY
     -- 8.6.9 - Added
     -- EXAMPLE
     -- -- Get photo image with name .myphoto on the current Tcl interpreter
     -- My_Photo: constant Tk_Photo := Get_Widget(".myphoto");
     -- SOURCE
   overriding function Get_Widget
     (pathName: in String; Interp: in Tcl_Interp := Get_Context)
      return Tk_Photo;

      -- ****f* Photo/Blank
      -- FUNCTION
      -- Blank the image, make it transparent
      -- PARAMETERS
      -- Image - Tk_Photo to blank
      -- HISTORY
      -- 8.6.2 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- EXAMPLE
      -- -- Make transparent image My_Image
      -- Blank(My_Image);
      -- COMMANDS
      -- imageName blank
      -- SOURCE
   procedure Blank(Image: in Tk_Photo);
   -- ****

   -- ****f* Photo/Copy
   -- FUNCTION
   -- Copy one photo to another
   -- PARAMETERS
   -- Source  - Tk_Photo which will be used as source
   -- Target  - Tk_Photo which will be used as destination
   -- Options - Aditional Tk options for copy command. Default value is
   --           empty
   -- HISTORY
   -- 8.6.1 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- EXAMPLE
   -- -- Copy image My_Image to Other_Image and shrink it
   -- Copy(My_Image, Other_Image, "-shrink");
   -- COMMANDS
   -- target copy source ?option value(s) ...?
   -- SOURCE
   procedure Copy(Source, Target: in Tk_Photo; Options: in String := "");
   -- ****

   -- ****f* Photo/Data
   -- FUNCTION
   -- Get the selected image data
   -- PARAMETERS
   -- Image   - Tk_Photo which will be queried for the data
   -- Options - Tk options for data to query. Default value is empty
   -- RESULT
   -- Image data, all if options are empty or specified option data
   -- HISTORY
   -- 8.6.2 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- EXAMPLE
   -- -- Get the data of the My_Image from (0,5) point to (10,10)
   -- ImageData: constant String := Data(My_Image, "0", "5", "10", "10");
   -- COMMANDS
   -- imageName data ?option value(s) ...?
   -- SOURCE
   function Data(Image: in Tk_Photo; Options: in String := "") return String;
   -- ****

   -- ****f* Photo/Get
   -- FUNCTION
   -- Get color of the selected pixel in the image
   -- PARAMETERS
   -- Image - Tk_Photo which will be queried for data
   -- X     - X coordinate of pixel to get color
   -- Y     - Y coordinate of pixel to get color
   -- RESULT
   -- Three values of colors red, green, blue from 0 to 255
   -- HISTORY
   -- 8.6.2 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- EXAMPLE
   -- -- Get the color of the pixel at (1, 4) of the My_Image
   -- PixelColor: constant String := Get(My_Image, "1", "4");
   -- COMMANDS
   -- imageName get x y
   -- SOURCE
   function Get(Image: in Tk_Photo; X, Y: in String) return String with
      Pre => X /= "" and Y /= "";
      -- ****

      -- ****f* Photo/Put
      -- FUNCTION
      -- Set pixels in the selected Tk_Photo to specified data
      -- PARAMETERS
      -- Image   - Tk_Photo which will be modified
      -- Data    - Proper data for selected image format which will be changed
      -- Options - Additional options: -format or -to with proper values.
      --           Default value is empty
      -- HISTORY
      -- 8.6.3 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- EXAMPLE
      -- -- Set all pixels of the My_Image to red color
      -- Put(My_Image, "red");
      -- COMMANDS
      -- imageName put data ?option value(s) ...?
      -- SOURCE
   procedure Put
     (Image: in Tk_Photo; Data: in String; Options: in String := "") with
      Pre => Data /= "";
      -- ****

      -- ****f* Photo/Read
      -- FUNCTION
      -- Read selected file and put it data to the selected Tk_Photo
      -- PARAMETERS
      -- Image    - Tk_Photo in which data will be loaded
      -- FileName - Name of file which will be read
      -- Options  - Additional options for read data. Default value is empty
      -- HISTORY
      -- 8.6.3 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- EXAMPLE
      -- -- Read file myimage.png and put it to the My_Image
      -- Read(My_Image, "myimage.png");
      -- -- Read file image.gif, put it into Some_Image and shrink
      -- Read(Some_Image, "image.gif", "-shrink");
      -- COMMANDS
      -- imageName read filename ?option value(s) ...?
      -- SOURCE
   procedure Read
     (Image: in Tk_Photo; FileName: in String; Options: in String := "") with
      Pre => FileName /= "";
      -- ****

      -- ****f* Photo/Redither
      -- FUNCTION
      -- Recalculate dithered image
      -- PARAMETERS
      -- Image - Tk_Photo to recalculate
      -- HISTORY
      -- 8.6.3 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- EXAMPLE
      -- -- Redither My_Image
      -- Redither(My_Image);
      -- COMMANDS
      -- imageName redither
      -- SOURCE
   procedure Redither(Image: in Tk_Photo);
   -- ****

   -- ****f* Photo/Transparency_Get
   -- FUNCTION
   -- Get the selected pixel transparency in the selected image
   -- PARAMETERS
   -- Image - Tk_Photo to query for transparency
   -- X     - X coordinate of pixel to check
   -- Y     - Y coordinate of pixel to check
   -- RESULT
   -- If pixel is transparent return true, otherwise false
   -- HISTORY
   -- 8.6.3 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- EXAMPLE
   -- -- Get the transparency of the pixel (5, 12) at My_Image
   -- Transparency: constant String := Transparency_Get(My_Image, "5", "12");
   -- COMMANDS
   -- imageName transparency get x y
   -- SOURCE
   function Transparency_Get
     (Image: in Tk_Photo; X, Y: in String) return String with
      Pre => X /= "" and Y /= "";
      -- ****

      -- ****f* Photo/Transparency_Set
      -- FUNCTION
      -- Set transparency for the selected pixel in the selected image
      -- PARAMETERS
      -- Image  - Tk_Photo in which pixel transparency will be set
      -- X      - X coordinate of the pixel which transparency will be set
      -- Y      - Y coordinate of the pixel which transparency will be set
      -- Enable - If true, enable transparency, otherwise disable it
      -- HISTORY
      -- 8.6.3 - Added
      -- 8.6.8 - Fixed setting transparency
      -- TODO
      -- Replace it with higher level of binding
      -- EXAMPLE
      -- -- Enable transparency for pixel (7, 12) in My_Image
      -- Transparency_Set(My_Image, "7", "12", "true");
      -- COMMANDS
      -- imageName transparency set x y enable
      -- SOURCE
   procedure Transparency_Set(Image: in Tk_Photo; X, Y, Enable: in String) with
      Pre => X /= "" and Y /= "" and Enable in "true" | "false";
      -- ****

      -- ****f* Photo/Write
      -- FUNCTION
      -- Write image to the specified file
      -- PARAMETERS
      -- Image    - Tk_Photo to write to the file
      -- FileName - Name of the file to which image will be written
      -- Options  - Additional options for writting image to file. Default
      --            value is empty
      -- HISTORY
      -- 8.6.3 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- EXAMPLE
      -- -- Write My_Image to the "myimage.png" file in grayscale
      -- Write(My_Image, "myimage.png", "-grayscale");
      -- COMMANDS
      -- imageName write filename ?option value(s) ...?
      -- SOURCE
   procedure Write
     (Image: in Tk_Photo; FileName: in String; Options: in String := "") with
      Pre => FileName /= "";
      -- ****

private

   type Tk_Photo is new Tk_Widget with null record;

end Tcl.Tk.Ada.Image.Photo;

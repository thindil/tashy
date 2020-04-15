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

with Tcl.Tk.Ada.Widgets; use Tcl.Tk.Ada.Widgets;

-- ****h* TkAda/Image
-- FUNCTION
-- Provides code for manipulate Tk command image
-- SOURCE
package Tcl.Tk.Ada.Image is
-- ****

   -- ****f* Image/Delete
   -- FUNCTION
   -- Delete the selected image widget
   -- PARAMETERS
   -- Img - Image to delete
   -- SOURCE
   procedure Delete(Img: in out Tk_Widget'Class);
   -- ****

   -- ****f* Image/Height
   -- FUNCTION
   -- Get the selected image height
   -- PARAMETERS
   -- Img - Image to query
   -- RESULT
   -- The selected image height in pixels
   -- HISTORY
   -- 8.6.4 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   function Height(Img: in Tk_Widget'Class) return String;
   -- ****

   -- ****f* Image/Inuse
   -- FUNCTION
   -- Check if the selected image is used by any widget
   -- PARAMETERS
   -- Img - Image to check
   -- RESULT
   -- 0 if image is not used, otherwise 1
   -- HISTORY
   -- 8.6.4 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   function Inuse(Img: in Tk_Widget'Class) return String;
   -- ****

   -- ****f* Image/Names
   -- FUNCTION
   -- Get names of all existing images
   -- RESULT
   -- List of names of all existing images or {} if no images exists
   -- HISTORY
   -- 8.6.4 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   function Names return String;
   -- ****

   -- ****f* Image/Types
   -- FUNCTION
   -- Get types of images available
   -- RESULT
   -- List of types of images available
   -- SOURCE
   function Types return String;
   -- ****

   -- ****f* Image/Width
   -- FUNCTION
   -- Get the selected image width
   -- PARAMETERS
   -- Img - Image to query
   -- RESULT
   -- The selected image width in pixels
   -- HISTORY
   -- 8.6.4 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   function Width(Img: in Tk_Widget'Class) return String;
   -- ****

end Tcl.Tk.Ada.Image;

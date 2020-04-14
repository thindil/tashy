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

with Tcl.Ada; use Tcl.Ada;

package body Tcl.Tk.Ada.Image is

   procedure Delete(Img: in out Tk_Widget'Class) is
   begin
      Tcl_Eval(Img.Interp, "image delete " & Widget_Image(Img));
      C.Strings.Free(Img.Name);
   end Delete;

   function Height(Img: in Tk_Widget'Class) return String is
   begin
      Tcl_Eval(Img.Interp, "image height " & Widget_Image(Img));
      return Tcl_GetResult(Img.Interp);
   end Height;

   function Inuse(Img: in Tk_Widget'Class) return String is
   begin
      Tcl_Eval(Img.Interp, "image inuse " & Widget_Image(Img));
      return Tcl_GetResult(Img.Interp);
   end Inuse;

   function Types return String is
   begin
      Tcl_Eval(Get_Context, "image types");
      return Tcl_GetResult(Get_Context);
   end Types;

   function Width(Img: in Tk_Widget'Class) return String is
   begin
      Tcl_Eval(Img.Interp, "image width " & Widget_Image(Img));
      return Tcl_GetResult(Img.Interp);
   end Width;

end Tcl.Tk.Ada.Image;

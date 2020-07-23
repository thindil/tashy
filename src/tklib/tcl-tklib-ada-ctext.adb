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
with Tcl.Tk.Ada; use Tcl.Tk.Ada;

package body Tcl.Tklib.Ada.Ctext is

   procedure Ctext_Init(Interp: in Tcl_Interp) is
   begin
      if Tcl.Ada.Tcl_Eval(Interp, "package require ctex") /= 0 then
         raise Program_Error
           with "Failed to load ctext package: " &
           Tcl.Ada.Tcl_GetStringResult(Interp);
      end if;
   end Ctext_Init;

   function Create
     (pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) return Tklib_Ctext is
      The_Widget: Tklib_Ctext;
   begin
      if Interp = null then
         The_Widget.Interp := Get_Context;
      else
         The_Widget.Interp := Interp;
      end if;
      The_Widget.Name := C.Strings.New_String(pathName);
      Tcl_Eval(The_Widget.Interp, "ctext " & pathName & " " & options);
      return The_Widget;
   end Create;

   procedure Create
     (Widgt: out Tklib_Ctext; pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) is
   begin
      Widgt := Create(pathName, options, Interp);
   end Create;

   procedure Add_Highlight_Class
     (CtextWidget: in Tklib_Ctext; Class, Color, Keywordlist: in String) is
   begin
      Tcl.Ada.Tcl_Eval
        (CtextWidget.Interp,
         "::ctext::AddHighlightClass " & Widget_Image(CtextWidget) & " " &
         Class & " " & Color & " [list " & Keywordlist & "]");
   end Add_Highlight_Class;

end Tcl.Tklib.Ada.Ctext;

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
         "::ctext::addHighlightClass " & Widget_Image(CtextWidget) & " " &
         Class & " " & Color & " [list " & Keywordlist & "]");
   end Add_Highlight_Class;

   procedure Add_Highlight_Class_With_Only_Char_Start
     (CtextWidget: in Tklib_Ctext; Class, Color, Char: in String) is
   begin
      Tcl.Ada.Tcl_Eval
        (CtextWidget.Interp,
         "::ctext::addHighlightClassWithOnlyCharStart " &
         Widget_Image(CtextWidget) & " " & Class & " " & Color & " " & Char);
   end Add_Highlight_Class_With_Only_Char_Start;

   procedure Add_Highlight_Class_For_Special_Chars
     (CtextWidget: in Tklib_Ctext; Class, Color, CharString: in String) is
   begin
      Tcl.Ada.Tcl_Eval
        (CtextWidget.Interp,
         "::ctext::addHighlightClassForSpecialChars " &
         Widget_Image(CtextWidget) & " " & Class & " " & Color & " " &
         CharString);
   end Add_Highlight_Class_For_Special_Chars;

   procedure Add_Highlight_Class_For_Regexp
     (CtextWidget: in Tklib_Ctext; Class, Color, Pattern: in String) is
   begin
      Tcl.Ada.Tcl_Eval
        (CtextWidget.Interp,
         "::ctext::addHighlightClassForRegexp " & Widget_Image(CtextWidget) &
         " " & Class & " " & Color & " " & Pattern);
   end Add_Highlight_Class_For_Regexp;

   procedure Clear_Highlight_Classes(CtextWidget: in Tklib_Ctext) is
   begin
      Tcl.Ada.Tcl_Eval
        (CtextWidget.Interp,
         "::ctext::clearHighlightClasses " & Widget_Image(CtextWidget));
   end Clear_Highlight_Classes;

   procedure Copy(CtextWidget: in Tklib_Ctext) is
   begin
      Execute_Widget_Command(CtextWidget, "copy");
   end Copy;

   procedure Delete_Highlight_Class
     (CtextWidget: in Tklib_Ctext; Class: in String) is
   begin
      Tcl.Ada.Tcl_Eval
        (CtextWidget.Interp,
         "::ctext::deleteHighlightClass " & Widget_Image(CtextWidget) & " " &
         Class);
   end Delete_Highlight_Class;

   procedure Disable_Comments(CtextWidget: in Tklib_Ctext) is
   begin
      Tcl.Ada.Tcl_Eval
        (CtextWidget.Interp,
         "ctext::disableComments " & Widget_Image(CtextWidget));
   end Disable_Comments;

   procedure Enable_Comments(CtextWidget: in Tklib_Ctext) is
   begin
      Tcl.Ada.Tcl_Eval
        (CtextWidget.Interp,
         "ctext::enableComments " & Widget_Image(CtextWidget));
   end Enable_Comments;

   procedure Fast_Delete
     (CtextWidget: in Tklib_Ctext; Index1: in String;
      Index2: in String := "") is
   begin
      Execute_Widget_Command(CtextWidget, "fastdelete", Index1 & " " & Index2);
   end Fast_Delete;

   procedure Fast_Insert
     (CtextWidget: in Tklib_Ctext; Index, Text: in String) is
   begin
      Execute_Widget_Command(CtextWidget, "fastinsert", Index & " " & Text);
   end Fast_Insert;

   function Get_Highlight_Classes(CtextWidget: in Tklib_Ctext) return String is
   begin
      Tcl.Ada.Tcl_Eval
        (CtextWidget.Interp,
         "::ctext::getHighlightClasses " & Widget_Image(CtextWidget));
      return Tcl.Ada.Tcl_GetResult(CtextWidget.Interp);
   end Get_Highlight_Classes;

   procedure Highlight
     (CtextWidget: in Tklib_Ctext; StartIndex, EndIndex: in String) is
   begin
      Execute_Widget_Command
        (CtextWidget, "highlight", StartIndex & " " & EndIndex);
   end Highlight;

end Tcl.Tklib.Ada.Ctext;

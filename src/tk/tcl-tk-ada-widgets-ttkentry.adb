-- Copyright (c) 2020 Bartek thindil Jasicki <thindil@laeran.pl>
--
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
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

with Tcl.Ada;

package body Tcl.Tk.Ada.Widgets.TtkEntry is

   function Create
     (pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := Null_Interp) return Ttk_Entry is
      The_Widget: Ttk_Entry;
   begin
      if Interp = Null_Interp then
         The_Widget.Interp := Context;
      else
         The_Widget.Interp := Interp;
      end if;
      The_Widget.Name := C.Strings.New_String(pathName);
      Tcl_Eval(The_Widget.Interp, "ttk::entry " & pathName & " " & options);
      return The_Widget;
   end Create;

   procedure Create
     (Widgt: out Ttk_Entry; pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := Null_Interp) is
   begin
      Widgt := Create(pathName, options, Interp);
   end Create;

   overriding function Get_Widget
     (pathName: in String; Interp: in Tcl_Interp := Get_Context)
      return Ttk_Entry is
   begin
      return New_Entry: Ttk_Entry do
         New_Entry.Interp := Interp;
         New_Entry.Name := C.Strings.New_String(pathName);
      end return;
   end Get_Widget;

   function BBox
     (TextEntry: in Ttk_Entry'Class; Index: in String) return String is
   begin
      Execute_Widget_Command(TextEntry, "bbox", Index);
      return Tcl.Ada.Tcl_GetResult(TextEntry.Interp);
   end BBox;

   procedure Delete
     (TextEntry: in Ttk_Entry; FirstIndex: in String;
      LastIndex: in String := "") is
   begin
      Execute_Widget_Command
        (TextEntry, "delete", FirstIndex & " " & LastIndex);
   end Delete;

   function Get(Widgt: in Ttk_Entry) return String is
   begin
      Execute_Widget_Command(Widgt, "get");
      return Tcl.Ada.Tcl_GetResult(Widgt.Interp);
   end Get;

   procedure ICursor(TextEntry: in Ttk_Entry'Class; Index: in String) is
   begin
      Execute_Widget_Command(TextEntry, "icursor", Index);
   end ICursor;

   function Index
     (TextEntry: in Ttk_Entry'Class; Index: in String) return String is
   begin
      Execute_Widget_Command(TextEntry, "index", Index);
      return Tcl.Ada.Tcl_GetResult(TextEntry.Interp);
   end Index;

   procedure Insert
     (TextEntry: in Ttk_Entry; Index: in String; Text: in String) is
   begin
      Execute_Widget_Command
        (TextEntry, "insert", Index & " " & "{" & Text & "}");
   end Insert;

   procedure Selection_Clear(TextEntry: in Ttk_Entry'Class) is
   begin
      Execute_Widget_Command(TextEntry, "selection clear");
   end Selection_Clear;

   function Selection_Present(TextEntry: in Ttk_Entry'Class) return String is
   begin
      Execute_Widget_Command(TextEntry, "selection present");
      return Tcl.Ada.Tcl_GetResult(TextEntry.Interp);
   end Selection_Present;

   procedure Selection_Range
     (TextEntry: in Ttk_Entry'Class; StartIndex, EndIndex: in String) is
   begin
      Execute_Widget_Command
        (TextEntry, "selection range", StartIndex & " " & EndIndex);
   end Selection_Range;

   function Validate(TextEntry: in Ttk_Entry'Class) return String is
   begin
      Execute_Widget_Command(TextEntry, "validate");
      return Tcl.Ada.Tcl_GetResult(TextEntry.Interp);
   end Validate;

   function XView(TextEntry: in Ttk_Entry'Class) return String is
   begin
      Execute_Widget_Command(TextEntry, "xview");
      return Tcl.Ada.Tcl_GetResult(TextEntry.Interp);
   end XView;

   procedure XView(TextEntry: in Ttk_Entry'Class; Index: in String) is
   begin
      Execute_Widget_Command(TextEntry, "xview", Index);
   end XView;

   procedure Xview_Move_To
     (TextEntry: in Ttk_Entry'Class; Fraction: in String) is
   begin
      Execute_Widget_Command(TextEntry, "xview moveto", Fraction);
   end Xview_Move_To;

   procedure Xview_Scroll
     (TextEntry: in Ttk_Entry'Class; Number, What: in String) is
   begin
      Execute_Widget_Command(TextEntry, "xview scroll", Number & " " & What);
   end Xview_Scroll;

end Tcl.Tk.Ada.Widgets.TtkEntry;

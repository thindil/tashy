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

package body Tcl.Tk.Ada.Widgets.Text is

   function Create
     (pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) return Tk_Text is
      The_Widget: Tk_Text;
   begin
      if Interp = null then
         The_Widget.Interp := Context;
      else
         The_Widget.Interp := Interp;
      end if;
      The_Widget.Name := C.Strings.New_String(pathName);
      Tcl_Eval(The_Widget.Interp, "text " & pathName & " " & options);
      return The_Widget;
   end Create;

   procedure Create
     (Widgt: out Tk_Text; pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) is
   begin
      Widgt := Create(pathName, options, Interp);
   end Create;

   function BBox(TextWidget: in Tk_Text; Index: in String) return String is
   begin
      Execute_Widget_Command(TextWidget, "bbox", Index);
      return Tcl.Ada.Tcl_GetResult(TextWidget.Interp);
   end BBox;

   function Compare
     (TextWidget: in Tk_Text; Index1, Op, Index2: in String) return String is
   begin
      Execute_Widget_Command
        (TextWidget, "compare", Index1 & " " & Op & " " & Index2);
      return Tcl.Ada.Tcl_GetResult(TextWidget.Interp);
   end Compare;

   function Count
     (TextWidget: in Tk_Text; Options, Index1, Index2: in String)
      return String is
   begin
      Execute_Widget_Command
        (TextWidget, "count", Options & " " & Index1 & " " & Index2);
      return Tcl.Ada.Tcl_GetResult(TextWidget.Interp);
   end Count;

   procedure Debug(TextWidget: in Tk_Text; Enable: in String) is
   begin
      Execute_Widget_Command(TextWidget, "debug", Enable);
   end Debug;

   function Debug(TextWidget: in Tk_Text) return String is
   begin
      Execute_Widget_Command(TextWidget, "debug");
      return Tcl.Ada.Tcl_GetResult(TextWidget.Interp);
   end Debug;

   procedure Delete
     (TextWidget: in Tk_Text; StartIndex: in String;
      Indexes: in String := "") is
   begin
      Execute_Widget_Command(TextWidget, "delete", StartIndex & " " & Indexes);
   end Delete;

   function DLineInfo
     (TextWidget: in Tk_Text; Index: in String) return String is
   begin
      Execute_Widget_Command(TextWidget, "dlineinfo", Index);
      return Tcl.Ada.Tcl_GetResult(TextWidget.Interp);
   end DLineInfo;

   procedure Insert(TextWidget: in Tk_Text; Index, Text: in String) is
   begin
      Execute_Widget_Command(TextWidget, "insert", Index & " " & Text);
   end Insert;

   procedure Tag_Add
     (TextWidget: in Tk_Text; TagName, StartIndex: in String;
      Indexes: in String := "") is
   begin
      Execute_Widget_Command
        (TextWidget, "tag add", TagName & " " & StartIndex & " " & Indexes);
   end Tag_Add;

   procedure Tag_Configure
     (TextWidget: in Tk_Text; TagName, Options: in String) is
   begin
      Execute_Widget_Command
        (TextWidget, "tag configure", TagName & " " & Options);
   end Tag_Configure;

   function Tag_Configure
     (TextWidget: in Tk_Text; TagName: in String; Option: in String := "")
      return String is
   begin
      Execute_Widget_Command
        (TextWidget, "tag configure", TagName & " " & Option);
      return Tcl.Ada.Tcl_GetResult(TextWidget.Interp);
   end Tag_Configure;

end Tcl.Tk.Ada.Widgets.Text;

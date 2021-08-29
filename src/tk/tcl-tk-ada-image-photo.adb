-- Copyright (c) 2020-2021 Bartek thindil Jasicki <thindil@laeran.pl>
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
--
-- As a special exception, if other files instantiate generics from this
-- unit, or you link this unit with other files to produce an executable,
-- this unit does not by itself cause the resulting executable to be
-- covered by the GNU General Public License. This exception does not
-- however invalidate any other reasons why the executable file might be
-- covered by the GNU Public License.

with Interfaces.C.Strings; use Interfaces.C.Strings;
with Tcl.Ada;

package body Tcl.Tk.Ada.Image.Photo is

   function Create
     (pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := Null_Interp) return Tk_Photo is
      The_Widget: Tk_Photo;
   begin
      if Interp = Null_Interp then
         The_Widget.Interp := Context;
      else
         The_Widget.Interp := Interp;
      end if;
      The_Widget.Name := C.Strings.New_String(pathName);
      Tcl_Eval
        (The_Widget.Interp, "image create photo " & pathName & " " & options);
      return The_Widget;
   end Create;

   procedure Create
     (Widgt: out Tk_Photo; pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := Null_Interp) is
   begin
      Widgt := Create(pathName, options, Interp);
   end Create;

   function Get_Widget
     (pathName: in String; Interp: in Tcl_Interp := Get_Context)
      return Tk_Photo is
   begin
      return New_Photo: Tk_Photo do
         New_Photo.Interp := Interp;
         New_Photo.Name := C.Strings.New_String(pathName);
      end return;
   end Get_Widget;

   procedure Execute_Image_Command
     (Image: in Tk_Photo; command: in String; options: in String := "") is
   begin
      Tcl_Eval
        (Image.Interp, Value(Image.Name) & " " & command & " " & options);
   end Execute_Image_Command;

   procedure Blank(Image: in Tk_Photo) is
   begin
      Execute_Image_Command(Image, "blank");
   end Blank;

   procedure Copy(Source, Target: in Tk_Photo; Options: in String := "") is
   begin
      Execute_Image_Command
        (Target, "copy", Value(Source.Name) & " " & Options);
   end Copy;

   function Data(Image: in Tk_Photo; Options: in String := "") return String is
   begin
      Execute_Image_Command(Image, "data", Options);
      return Tcl.Ada.Tcl_GetResult(Image.Interp);
   end Data;

   function Get(Image: in Tk_Photo; X, Y: in String) return String is
   begin
      Execute_Image_Command(Image, "get", X & " " & Y);
      return Tcl.Ada.Tcl_GetResult(Image.Interp);
   end Get;

   procedure Put
     (Image: in Tk_Photo; Data: in String; Options: in String := "") is
   begin
      Execute_Image_Command(Image, "put", Data & " " & Options);
   end Put;

   procedure Read
     (Image: in Tk_Photo; FileName: in String; Options: in String := "") is
   begin
      Execute_Image_Command(Image, "read", FileName & " " & Options);
   end Read;

   procedure Redither(Image: in Tk_Photo) is
   begin
      Execute_Image_Command(Image, "redither");
   end Redither;

   function Transparency_Get
     (Image: in Tk_Photo; X, Y: in String) return String is
   begin
      Execute_Image_Command(Image, "transparency get", X & " " & Y);
      return Tcl.Ada.Tcl_GetResult(Image.Interp);
   end Transparency_Get;

   procedure Transparency_Set(Image: in Tk_Photo; X, Y, Enable: in String) is
   begin
      Execute_Image_Command
        (Image, "transparency set", X & " " & Y & " " & Enable);
   end Transparency_Set;

   procedure Write
     (Image: in Tk_Photo; FileName: in String; Options: in String := "") is
   begin
      Execute_Image_Command(Image, "write", "{" & FileName & "} " & Options);
   end Write;

end Tcl.Tk.Ada.Image.Photo;

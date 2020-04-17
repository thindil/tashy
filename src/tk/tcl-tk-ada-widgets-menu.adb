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

with Tcl.Ada;

package body Tcl.Tk.Ada.Widgets.Menu is

   function Create
     (pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) return Tk_Menu is
      The_Widget: Tk_Menu;
   begin
      if Interp = null then
         The_Widget.Interp := Context;
      else
         The_Widget.Interp := Interp;
      end if;
      The_Widget.Name := C.Strings.New_String(pathName);
      Tcl_Eval(The_Widget.Interp, "menu " & pathName & " " & options);
      return The_Widget;
   end Create;

   procedure Create
     (Widgt: out Tk_Menu; pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) is
   begin
      Widgt := Create(pathName, options, Interp);
   end Create;

   procedure Activate(MenuWidget: in Tk_Menu'Class; Index: in String) is
   begin
      Execute_Widget_Command(MenuWidget, "activate", Index);
   end Activate;

   procedure Add
     (MenuWidget: in Tk_Menu'Class; EntryType: in String;
      Options: in String := "") is
   begin
      Execute_Widget_Command(MenuWidget, "add", EntryType & " " & Options);
   end Add;

   procedure Clone
     (MenuWidget: in Tk_Menu'Class; NewPathName, CloneType: in String) is
   begin
      Execute_Widget_Command
        (MenuWidget, "clone", NewPathName & " " & CloneType);
   end Clone;

   procedure Delete
     (MenuWidget: in Tk_Menu; StartIndex: in String;
      EndIndex: in String := "") is
   begin
      Execute_Widget_Command
        (MenuWidget, "delete", StartIndex & " " & EndIndex);
   end Delete;

   function Entry_Cget
     (MenuWidget: in Tk_Menu; Index, Option: in String) return String is
   begin
      Execute_Widget_Command(MenuWidget, "entrycget", Index & " " & Option);
      return Tcl.Ada.Tcl_GetResult(MenuWidget.Interp);
   end Entry_Cget;

   procedure Entry_Configure
     (MenuWidget: in Tk_Menu; Index, Options: in String) is
   begin
      Execute_Widget_Command
        (MenuWidget, "entryconfigure", Index & " " & Options);
   end Entry_Configure;

   function Entry_Configure
     (MenuWidget: in Tk_Menu; Index: in String) return String is
   begin
      Execute_Widget_Command(MenuWidget, "entryconfigure", Index);
      return Tcl.Ada.Tcl_GetResult(MenuWidget.Interp);
   end Entry_Configure;

   function Index(MenuWidget: in Tk_Menu; Index: in String) return String is
   begin
      Execute_Widget_Command(MenuWidget, "index", Index);
      return Tcl.Ada.Tcl_GetResult(MenuWidget.Interp);
   end Index;

   procedure Insert
     (MenuWidget: in Tk_Menu'Class; Index, EntryType: in String;
      Options: in String := "") is
   begin
      Execute_Widget_Command
        (MenuWidget, "insert", Index & " " & EntryType & " " & Options);
   end Insert;

   function Invoke(MenuWidget: in Tk_Menu; Index: in String) return String is
   begin
      Execute_Widget_Command(MenuWidget, "invoke", Index);
      return Tcl.Ada.Tcl_GetResult(MenuWidget.Interp);
   end Invoke;

   procedure Post(MenuWidget: in Tk_Menu; X, Y: in String) is
   begin
      Execute_Widget_Command(MenuWidget, "post", X & " " & Y);
   end Post;

   function Post(MenuWidget: in Tk_Menu; X, Y: in String) return String is
   begin
      Execute_Widget_Command(MenuWidget, "post", X & " " & Y);
      return Tcl.Ada.Tcl_GetResult(MenuWidget.Interp);
   end Post;

end Tcl.Tk.Ada.Widgets.Menu;

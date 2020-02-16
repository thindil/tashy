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

package body Tcl.Tk.Ada.Widgets.TtkNotebook is

   function Create
     (pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) return Ttk_Notebook is
      The_Widget: Ttk_Notebook;
   begin
      if Interp = null then
         The_Widget.Interp := Context;
      else
         The_Widget.Interp := Interp;
      end if;
      The_Widget.Name := C.Strings.New_String(pathName);
      Tcl_Eval(The_Widget.Interp, "ttk::notebook " & pathName & " " & options);
      return The_Widget;
   end Create;

   procedure Create
     (Widgt: out Ttk_Notebook; pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) is
   begin
      Widgt := Create(pathName, options, Interp);
   end Create;

   procedure Add
     (Notebook: in Ttk_Notebook; WindowName: in String;
      Options: String := "") is
   begin
      Execute_Widget_Command
        (Notebook, "add", WindowName & " " & Options);
   end Add;

   procedure Hide(Notebook: in Ttk_Notebook; TabId: in String) is
   begin
      Execute_Widget_Command(Notebook, "hide", TabId);
   end Hide;

   procedure Notebook_Select(Notebook: in Ttk_Notebook; TabId: in String) is
   begin
      Execute_Widget_Command(Notebook, "select", TabId);
   end Notebook_Select;

   function Get_Selected(Notebook: in Ttk_Notebook) return String is
   begin
      Execute_Widget_Command(Notebook, "select");
      return Tcl.Ada.Tcl_GetResult(Notebook.Interp);
   end Get_Selected;

end Tcl.Tk.Ada.Widgets.TtkNotebook;

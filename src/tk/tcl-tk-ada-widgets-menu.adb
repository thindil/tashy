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

with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Ada.Strings.Maps.Constants; use Ada.Strings.Maps.Constants;

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

   procedure Add
     (MenuWidget: in Tk_Menu'Class; Options: in Menu_Entry_Options) is
      TkOptions: Unbounded_String :=
        To_Unbounded_String
          (Translate(Menu_Items'Image(Options.MType), Lower_Case_Map));
   begin
      if Options.Label /= Null_Unbounded_String then
         if Options.MType = SEPARATOR then
            raise Constraint_Error
              with "Option label is not available for separators";
         end if;
         Append(TkOptions, " -label """ & Options.Label & """");
      end if;
      if Options.Command /= Null_Unbounded_String then
         if Options.MType = SEPARATOR then
            raise Constraint_Error
              with "Option command is not available for separators";
         end if;
         Append(TkOptions, " -command " & Options.Command);
      end if;
      if Options.Underline > -1 then
         if Options.MType = SEPARATOR then
            raise Constraint_Error
              with "Option underline is not available for separators";
         end if;
         if Options.Underline >= Length(Options.Label) then
            raise Constraint_Error
              with "Option underline is bigger than length of menu entry label";
         end if;
         Append(TkOptions, " -underline" & Integer'Image(Options.Underline));
      end if;
      if Options.Accelerator /= Null_Unbounded_String then
         if Options.MType = SEPARATOR then
            raise Constraint_Error
              with "Option accelerator is not available for separators";
         end if;
         Append(TkOptions, " -accelerator " & Options.Accelerator);
      end if;
      if Options.State /= NORMAL then
         if Options.MType = SEPARATOR then
            raise Constraint_Error
              with "Option state is not available for separators";
         end if;
         Append
           (TkOptions,
            " -state " &
            Translate(Menu_Entry_States'Image(Options.State), Lower_Case_Map));
      end if;
      if Options.Other /= Null_Unbounded_String then
         Append(TkOptions, " " & Options.Other);
      end if;
      case Options.MType is
         when CASCADE =>
            if Options.SubMenu /= Null_Unbounded_String then
               Append(TkOptions, " -menu " & Options.SubMenu);
            end if;
         when CHECKBUTTON =>
            if Options.CheckVariable /= Null_Unbounded_String then
               Append(TkOptions, " -variable " & Options.CheckVariable);
            end if;
         when RADIOBUTTON =>
            if Options.Value /= Null_Unbounded_String then
               Append(TkOptions, " -value """ & Options.Value & """");
            end if;
            if Options.RadioVariable /= Null_Unbounded_String then
               Append(TkOptions, " -variable " & Options.RadioVariable);
            end if;
         when others =>
            null;
      end case;
      Execute_Widget_Command
        (Tk_Widget'Class(MenuWidget), "add", To_String(TkOptions));
   end Add;

end Tcl.Tk.Ada.Widgets.Menu;

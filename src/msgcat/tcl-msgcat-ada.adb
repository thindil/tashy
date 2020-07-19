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

package body Tcl.MsgCat.Ada is

   procedure MsgCat_Init(Interp: in Tcl_Interp) is
   begin
      if Tcl.Ada.Tcl_Eval(Interp, "package require msgcat") /= 0 then
         raise Program_Error
           with "Failed to load msgcat package: " &
           Tcl.Ada.Tcl_GetStringResult(Interp);
      end if;
   end MsgCat_Init;

   function Mc
     (Interp: Tcl_Interp; Src_String: in String; Arguments: in String := "")
      return String is
   begin
      Tcl.Ada.Tcl_Eval(Interp, "::msgcat::mc " & Src_String & " " & Arguments);
      return Tcl.Ada.Tcl_GetResult(Interp);
   end Mc;

   function Mc_Exists
     (Interp: Tcl_Interp; Src_String: in String; Options: in String := "")
      return String is
   begin
      Tcl.Ada.Tcl_Eval
        (Interp, "::msgcat::mcexists " & Options & " " & Src_String);
      return Tcl.Ada.Tcl_GetResult(Interp);
   end Mc_Exists;

   procedure Mc_Load(DirName: in String; Interp: in Tcl_Interp) is
   begin
      Tcl.Ada.Tcl_Eval(Interp, "::msgcat::mcload " & DirName);
   end Mc_Load;

   function Mc_Load(DirName: in String; Interp: in Tcl_Interp) return String is
   begin
      Tcl.Ada.Tcl_Eval(Interp, "::msgcat::mcload " & DirName);
      return Tcl.Ada.Tcl_GetResult(Interp);
   end Mc_Load;

   procedure Mc_Locale(NewLocale: in String; Interp: Tcl_Interp) is
   begin
      Tcl.Ada.Tcl_Eval(Interp, "::msgcat::mclocale " & NewLocale);
   end Mc_Locale;

   function Mc_Locale(Interp: Tcl_Interp) return String is
   begin
      Tcl.Ada.Tcl_Eval(Interp, "::msgcat::mclocale");
      return Tcl.Ada.Tcl_GetResult(Interp);
   end Mc_Locale;

   function Mc_Max(Strings: in String; Interp: in Tcl_Interp) return String is
   begin
      Tcl.Ada.Tcl_Eval(Interp, "::msgcat::mcmax " & Strings);
      return Tcl.Ada.Tcl_GetResult(Interp);
   end Mc_Max;

   function Mc_Preferences(Interp: in Tcl_Interp) return String is
   begin
      Tcl.Ada.Tcl_Eval(Interp, "::msgcat::mcpreferences");
      return Tcl.Ada.Tcl_GetResult(Interp);
   end Mc_Preferences;

   procedure Mc_Set
     (Interp: Tcl_Interp; Locale, Src_String: in String;
      Translate_String: in String := "") is
   begin
      Tcl.Ada.Tcl_Eval
        (Interp,
         "::msgcat::mcset " & Locale & " " & Src_String & " " &
         Translate_String);
   end Mc_Set;

   function Mc_Set
     (Interp: Tcl_Interp; Locale, Src_String: in String;
      Translate_String: in String := "") return String is
   begin
      Tcl.Ada.Tcl_Eval
        (Interp,
         "::msgcat::mcset " & Locale & " " & Src_String & " " &
         Translate_String);
      return Tcl.Ada.Tcl_GetResult(Interp);
   end Mc_Set;

end Tcl.MsgCat.Ada;

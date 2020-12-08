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

-- As a special exception, if other files instantiate generics from this
-- unit, or you link this unit with other files to produce an executable,
-- this unit does not by itself cause the resulting executable to be
-- covered by the GNU General Public License. This exception does not
-- however invalidate any other reasons why the executable file might be
-- covered by the GNU Public License.

-- As a special exception, if other files instantiate generics from this
-- unit, or you link this unit with other files to produce an executable,
-- this unit does not by itself cause the resulting executable to be
-- covered by the GNU General Public License. This exception does not
-- however invalidate any other reasons why the executable file might be
-- covered by the GNU Public License.

with Tcl.Ada;

package body Tcl.Tk.Ada.Widgets is

   function Widget_Image(Win: in Tk_Widget'Class) return String is
   begin --  Widget_Image
      return CHelper.Value(Win.Name);
   end Widget_Image;

   function "&"
     (Left: in Tk_Widget'Class; Right: in Tk_Widget'Class) return String is
   begin --  "&"
      return Widget_Image(Left) & Widget_Image(Right);
   end "&";

   function "&"(Left: in Tk_Widget'Class; Right: in String) return String is
   begin --  "&"
      return Widget_Image(Left) & Right;
   end "&";

   function "&"(Left: in String; Right: in Tk_Widget'Class) return String is
   begin --  "&"
      return Left & Widget_Image(Right);
   end "&";

   function Get_Interp(Widgt: in Tk_Widget'Class) return Tcl_Interp is
   begin --  Get_Interp
      return Widgt.Interp;
   end Get_Interp;

   procedure Destroy(Widgt: in out Tk_Widget'Class) is
   begin --  Destroy
      Tcl_Eval(Widgt.Interp, "destroy " & Widget_Image(Widgt));
      C.Strings.Free(Widgt.Name);
   end Destroy;

   function cget(Widgt: in Tk_Widget'Class; option: in String) return String is
   begin --  cget
      Execute_Widget_Command(Widgt, "cget", option);
      return Tcl.Ada.Tcl_GetResult(Widgt.Interp);
   end cget;

   function configure
     (Widgt: in Tk_Widget'Class; options: in String := "") return String is
   begin --  configure
      Execute_Widget_Command(Widgt, "configure", options);
      return Tcl.Ada.Tcl_GetResult(Widgt.Interp);
   end configure;

   procedure configure(Widgt: in Tk_Widget'Class; options: in String) is
   begin --  configure
      Execute_Widget_Command(Widgt, "configure", options);
   end configure;

   procedure Bind
     (Widgt: in Tk_Widget'Class; Sequence: in String; Script: in String) is
   begin --  Bind
      Tcl_Eval
        (Widgt.Interp,
         "bind " & Widget_Image(Widgt) & " " & Sequence & " " & Script);
   end Bind;

   function Bind
     (Widgt: in Tk_Widget'Class; Sequence: in String) return String is
   begin
      Tcl_Eval(Widgt.Interp, "bind " & Widget_Image(Widgt) & " " & Sequence);
      return Tcl.Ada.Tcl_GetResult(Widgt.Interp);
   end Bind;

   procedure Bind_Tags(Widgt: in Tk_Widget'Class; TagList: in String) is
   begin
      Tcl_Eval
        (Widgt.Interp, "bindtags " & Widget_Image(Widgt) & " " & TagList);
   end Bind_Tags;

   function Bind_Tags(Widgt: in Tk_Widget'Class) return String is
   begin
      Tcl_Eval(Widgt.Interp, "bindtags " & Widget_Image(Widgt));
      return Tcl.Ada.Tcl_GetResult(Widgt.Interp);
   end Bind_Tags;

   procedure Unbind(Widgt: in Tk_Widget'Class; Sequence: in String) is
   begin --  Unbind
      Tcl_Eval
        (Widgt.Interp, "bind " & Widget_Image(Widgt) & " " & Sequence & " {}");
   end Unbind;

   function Unbind
     (Widgt: in Tk_Widget'Class; Sequence: in String) return String is
   begin --  Unbind
      Tcl_Eval
        (Widgt.Interp, "bind " & Widget_Image(Widgt) & " " & Sequence & " {}");
      return Tcl.Ada.Tcl_GetResult(Widgt.Interp);
   end Unbind;

   procedure Bell(Widgt: in Tk_Widget'Class; Option: in String := "") is
   begin
      Tcl_Eval
        (Widgt.Interp,
         "bell -displayof " & Widget_Image(Widgt) & " " & Option);
   end Bell;

   procedure Focus(Widgt: in Tk_Widget'Class; Option: in String := "") is
   begin
      Tcl_Eval(Widgt.Interp, "focus " & Option & " " & Widget_Image(Widgt));
   end Focus;

   function Focus
     (Interp: Tcl_Interp := Get_Context; Option: in String := "")
      return String is
   begin
      Tcl_Eval(Interp, "focus " & Option);
      return Tcl.Ada.Tcl_GetResult(Interp);
   end Focus;

   procedure Focus_Follows_Mouse(Interp: Tcl_Interp := Get_Context) is
   begin
      Tcl_Eval(Interp, "tk_focusFollowsMouse");
   end Focus_Follows_Mouse;

   function Focus_Next(Widgt: in Tk_Widget'Class) return String is
   begin
      Tcl_Eval(Widgt.Interp, "tk_focusNext " & Widget_Image(Widgt));
      return Tcl.Ada.Tcl_GetResult(Widgt.Interp);
   end Focus_Next;

   function Focus_Prev(Widgt: in Tk_Widget'Class) return String is
   begin
      Tcl_Eval(Widgt.Interp, "tk_focusPrev " & Widget_Image(Widgt));
      return Tcl.Ada.Tcl_GetResult(Widgt.Interp);
   end Focus_Prev;

   function Grab_Current(Interp: Tcl_Interp := Get_Context) return String is
   begin
      Tcl_Eval(Interp, "grab current");
      return Tcl.Ada.Tcl_GetResult(Interp);
   end Grab_Current;

   function Grab_Current(Widgt: in Tk_Widget'Class) return String is
   begin
      Tcl_Eval(Widgt.Interp, "grab current " & Widget_Image(Widgt));
      return Tcl.Ada.Tcl_GetResult(Widgt.Interp);
   end Grab_Current;

   procedure Grab_Release(Widgt: in Tk_Widget'Class) is
   begin
      Tcl_Eval(Widgt.Interp, "grab release " & Widget_Image(Widgt));
   end Grab_Release;

   procedure Grab_Set(Widgt: in Tk_Widget'Class; Global: in String := "") is
   begin
      Tcl_Eval(Widgt.Interp, "grab set " & Global & " " & Widget_Image(Widgt));
   end Grab_Set;

   function Grab_Status(Widgt: in Tk_Widget'Class) return String is
   begin
      Tcl_Eval(Widgt.Interp, "grab status " & Widget_Image(Widgt));
      return Tcl.Ada.Tcl_GetResult(Widgt.Interp);
   end Grab_Status;

   procedure Lower(Widgt: in Tk_Widget'Class) is
   begin
      Tcl_Eval(Widgt.Interp, "lower " & Widget_Image(Widgt));
   end Lower;

   procedure Lower(Widgt, BelowThis: in Tk_Widget'Class) is
   begin
      Tcl_Eval
        (Widgt.Interp,
         "lower " & Widget_Image(Widgt) & Widget_Image(BelowThis));
   end Lower;

   procedure Widget_Raise(Widgt: in Tk_Widget'Class) is
   begin
      Tcl_Eval(Widgt.Interp, "raise " & Widgt);
   end Widget_Raise;

   procedure Widget_Raise(Widgt, AboveThis: in Tk_Widget'Class) is
   begin
      Tcl_Eval(Widgt.Interp, "raise " & " " & Widgt & " " & AboveThis);
   end Widget_Raise;

   procedure Tk_Caret(Widgt: in Tk_Widget'Class; X, Y, Height: in String) is
   begin
      Tcl_Eval
        (Widgt.Interp,
         "tk caret " & Widget_Image(Widgt) & " -x " & X & " -y" & Y &
         " -height " & Height);
   end Tk_Caret;

   function Tk_Caret(Widgt: in Tk_Widget'Class) return String is
   begin
      Tcl_Eval(Widgt.Interp, "tk caret " & Widget_Image(Widgt));
      return Tcl.Ada.Tcl_GetResult(Widgt.Interp);
   end Tk_Caret;

   procedure Tk_Inactive(Widgt: in Tk_Widget'Class) is
   begin
      Tcl_Eval
        (Widgt.Interp,
         "tk inactive -display " & Widget_Image(Widgt) & " reset");
   end Tk_Inactive;

   function Tk_Inactive(Widgt: in Tk_Widget'Class) return String is
   begin
      Tcl_Eval(Widgt.Interp, "tk inactive -display " & Widget_Image(Widgt));
      return Tcl.Ada.Tcl_GetResult(Widgt.Interp);
   end Tk_Inactive;

   procedure Tk_Scaling(Widgt: in Tk_Widget'Class; Number: in String) is
   begin
      Tcl_Eval
        (Widgt.Interp,
         "tk scaling -display " & Widget_Image(Widgt) & " " & Number);
   end Tk_Scaling;

   function Tk_Scaling(Widgt: in Tk_Widget'Class) return String is
   begin
      Tcl_Eval(Widgt.Interp, "tk scaling -display " & Widget_Image(Widgt));
      return Tcl.Ada.Tcl_GetResult(Widgt.Interp);
   end Tk_Scaling;

   procedure Tk_Use_Input_Methods
     (Widgt: in Tk_Widget'Class; Enabled: in String) is
   begin
      Tcl_Eval
        (Widgt.Interp,
         "tk useinputmethods -display " & Widget_Image(Widgt) & " " & Enabled);
   end Tk_Use_Input_Methods;

   function Tk_Use_Input_Methods(Widgt: in Tk_Widget'Class) return String is
   begin
      Tcl_Eval
        (Widgt.Interp, "tk useinputmethods -display " & Widget_Image(Widgt));
      return Tcl.Ada.Tcl_GetResult(Widgt.Interp);
   end Tk_Use_Input_Methods;

   procedure Tk_Wait(WaitFor, Name: in String) is
   begin
      Tcl_Eval(Get_Context, "tkwait" & WaitFor & " " & Name);
   end Tk_Wait;

   procedure Execute_Widget_Command
     (Widgt: in Tk_Widget'Class; command: in String;
      options: in String := "") is
   begin --  Execute_Widget_Command
      Tcl_Eval
        (Widgt.Interp, Widget_Image(Widgt) & " " & command & " " & options);
   end Execute_Widget_Command;

end Tcl.Tk.Ada.Widgets;

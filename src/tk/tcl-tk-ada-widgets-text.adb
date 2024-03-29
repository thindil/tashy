-- Copyright (c) 2020 Bartek thindil Jasicki <thindil@laeran.pl>
--
-- This program is free software: you can redistribute it and/or modify it
-- under the terms of the GNU General Public License as published by the Free
-- Software Foundation, either version 3 of the License, or (at your option)
-- any later version.
--
-- This program is distributed in the hope that it will be useful, but WITHOUT
-- ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-- FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
-- for more details.
--
-- You should have received a copy of the GNU General Public License along with
-- this program. If not, see <http://www.gnu.org/licenses/>.
--
-- As a special exception, if other files instantiate generics from this unit,
-- or you link this unit with other files to produce an executable, this unit
-- does not by itself cause the resulting executable to be covered by the GNU
-- General Public License. This exception does not however invalidate any other
-- reasons why the executable file might be covered by the GNU Public License.

with Tcl.Ada;

package body Tcl.Tk.Ada.Widgets.Text is

   function Create
     (pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := Null_Interp) return Tk_Text is
      The_Widget: Tk_Text;
   begin
      if Interp = Null_Interp then
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
      Interp: in Tcl_Interp := Null_Interp) is
   begin
      Widgt := Create(pathName, options, Interp);
   end Create;

   overriding function Get_Widget
     (pathName: in String; Interp: in Tcl_Interp := Get_Context)
      return Tk_Text is
   begin
      return New_Text: Tk_Text do
         New_Text.Interp := Interp;
         New_Text.Name := C.Strings.New_String(pathName);
      end return;
   end Get_Widget;

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

   function Dump
     (TextWidget: in Tk_Text; Switches: in String := "-all"; Index1: in String;
      Index2: in String := "") return String is
   begin
      Execute_Widget_Command
        (TextWidget, "dump", Switches & " " & Index1 & " " & Index2);
      return Tcl.Ada.Tcl_GetResult(TextWidget.Interp);
   end Dump;

   function Edit_CanRedo(TextWidget: in Tk_Text) return String is
   begin
      Execute_Widget_Command(TextWidget, "edit canredo");
      return Tcl.Ada.Tcl_GetResult(TextWidget.Interp);
   end Edit_CanRedo;

   function Edit_CanUndo(TextWidget: in Tk_Text) return String is
   begin
      Execute_Widget_Command(TextWidget, "edit canundo");
      return Tcl.Ada.Tcl_GetResult(TextWidget.Interp);
   end Edit_CanUndo;

   procedure Edit_Modified(TextWidget: in Tk_Text; Value: in String) is
   begin
      Execute_Widget_Command(TextWidget, "edit modified", Value);
   end Edit_Modified;

   function Edit_Modified(TextWidget: in Tk_Text) return String is
   begin
      Execute_Widget_Command(TextWidget, "edit modified");
      return Tcl.Ada.Tcl_GetResult(TextWidget.Interp);
   end Edit_Modified;

   procedure Edit_Redo(TextWidget: in Tk_Text) is
   begin
      Execute_Widget_Command(TextWidget, "edit redo");
   end Edit_Redo;

   procedure Edit_Reset(TextWidget: in Tk_Text) is
   begin
      Execute_Widget_Command(TextWidget, "edit reset");
   end Edit_Reset;

   procedure Edit_Separator(TextWidget: in Tk_Text) is
   begin
      Execute_Widget_Command(TextWidget, "edit separator");
   end Edit_Separator;

   procedure Edit_Undo(TextWidget: in Tk_Text) is
   begin
      Execute_Widget_Command(TextWidget, "edit undo");
   end Edit_Undo;

   function Get(TextWidget: in Tk_Text; Options: in String) return String is
   begin
      Execute_Widget_Command(TextWidget, "get", Options);
      return Tcl.Ada.Tcl_GetResult(TextWidget.Interp);
   end Get;

   function Image_Cget
     (TextWidget: in Tk_Text; Index, Option: in String) return String is
   begin
      Execute_Widget_Command(TextWidget, "image cget", Index & " " & Option);
      return Tcl.Ada.Tcl_GetResult(TextWidget.Interp);
   end Image_Cget;

   procedure Image_Configure
     (TextWidget: in Tk_Text; Index, Options: in String) is
   begin
      Execute_Widget_Command
        (TextWidget, "image configure", Index & " " & Options);
   end Image_Configure;

   function Image_Configure
     (TextWidget: in Tk_Text; Index: in String; Option: in String := "")
      return String is
   begin
      Execute_Widget_Command
        (TextWidget, "image configure", Index & " " & Option);
      return Tcl.Ada.Tcl_GetResult(TextWidget.Interp);
   end Image_Configure;

   function Image_Create
     (TextWidget: in Tk_Text; Index: in String; Options: in String := "")
      return String is
   begin
      Execute_Widget_Command
        (TextWidget, "image create", Index & " " & Options);
      return Tcl.Ada.Tcl_GetResult(TextWidget.Interp);
   end Image_Create;

   function Image_Names(TextWidget: in Tk_Text) return String is
   begin
      Execute_Widget_Command(TextWidget, "image names");
      return Tcl.Ada.Tcl_GetResult(TextWidget.Interp);
   end Image_Names;

   function Index
     (TextWidget: in Tk_Text; TextIndex: in String) return String is
   begin
      Execute_Widget_Command(TextWidget, "index", TextIndex);
      return Tcl.Ada.Tcl_GetResult(TextWidget.Interp);
   end Index;

   procedure Insert(TextWidget: in Tk_Text; Index, Text: in String) is
   begin
      Execute_Widget_Command(TextWidget, "insert", Index & " " & Text);
   end Insert;

   procedure Mark_Gravity
     (TextWidget: in Tk_Text; MarkName, Direction: in String) is
   begin
      Execute_Widget_Command
        (TextWidget, "mark gravity", MarkName & " " & Direction);
   end Mark_Gravity;

   function Mark_Gravity
     (TextWidget: in Tk_Text; MarkName: in String) return String is
   begin
      Execute_Widget_Command(TextWidget, "mark gravity", MarkName);
      return Tcl.Ada.Tcl_GetResult(TextWidget.Interp);
   end Mark_Gravity;

   function Mark_Names(TextWidget: in Tk_Text) return String is
   begin
      Execute_Widget_Command(TextWidget, "mark names");
      return Tcl.Ada.Tcl_GetResult(TextWidget.Interp);
   end Mark_Names;

   function Mark_Next
     (TextWidget: in Tk_Text; Index: in String) return String is
   begin
      Execute_Widget_Command(TextWidget, "mark next", Index);
      return Tcl.Ada.Tcl_GetResult(TextWidget.Interp);
   end Mark_Next;

   function Mark_Previous
     (TextWidget: in Tk_Text; Index: in String) return String is
   begin
      Execute_Widget_Command(TextWidget, "mark previous", Index);
      return Tcl.Ada.Tcl_GetResult(TextWidget.Interp);
   end Mark_Previous;

   procedure Mark_Set(TextWidget: in Tk_Text; MarkName, Index: in String) is
   begin
      Execute_Widget_Command(TextWidget, "mark set", MarkName & " " & Index);
   end Mark_Set;

   procedure Mark_Unset(TextWidget: in Tk_Text; MarkName: in String) is
   begin
      Execute_Widget_Command(TextWidget, "mark unset", MarkName);
   end Mark_Unset;

   procedure Peer_Create
     (TextWidget: in Tk_Text; NewPathName: in String;
      Options: in String := "") is
   begin
      Execute_Widget_Command
        (TextWidget, "peer create", NewPathName & " " & Options);
   end Peer_Create;

   function Peer_Names(TextWidget: in Tk_Text) return String is
   begin
      Execute_Widget_Command(TextWidget, "peer names");
      return Tcl.Ada.Tcl_GetResult(TextWidget.Interp);
   end Peer_Names;

   function PendingSync(TextWidget: in Tk_Text) return String is
   begin
      Execute_Widget_Command(TextWidget, "pendingsync");
      return Tcl.Ada.Tcl_GetResult(TextWidget.Interp);
   end PendingSync;

   procedure Replace
     (TextWidget: in Tk_Text; Index1, Index2, Chars: in String) is
   begin
      Execute_Widget_Command
        (TextWidget, "replace", Index1 & " " & Index2 & " " & Chars);
   end Replace;

   procedure Scan_Mark(TextWidget: in Tk_Text; X, Y: in String) is
   begin
      Execute_Widget_Command(TextWidget, "scan mark", X & " " & Y);
   end Scan_Mark;

   procedure Scan_DragTo(TextWidget: in Tk_Text; X, Y: in String) is
   begin
      Execute_Widget_Command(TextWidget, "scan dragto", X & " " & Y);
   end Scan_DragTo;

   function Search
     (TextWidget: in Tk_Text; Switches: in String := "";
      Pattern, Index: in String; StopIndex: in String := "") return String is
   begin
      Execute_Widget_Command
        (TextWidget, "search",
         Switches & " " & Pattern & " " & Index & " " & StopIndex);
      return Tcl.Ada.Tcl_GetResult(TextWidget.Interp);
   end Search;

   procedure See(TextWidget: in Tk_Text; Index: in String) is
   begin
      Execute_Widget_Command(TextWidget, "see", Index);
   end See;

   procedure Sync(TextWidget: in Tk_Text) is
   begin
      Execute_Widget_Command(TextWidget, "sync");
   end Sync;

   procedure Sync_Command(TextWidget: in Tk_Text; Command: in String) is
   begin
      Execute_Widget_Command(TextWidget, "sync", "-command " & Command);
   end Sync_Command;

   procedure Tag_Add
     (TextWidget: in Tk_Text; TagName, StartIndex: in String;
      Indexes: in String := "") is
   begin
      Execute_Widget_Command
        (TextWidget, "tag add", TagName & " " & StartIndex & " " & Indexes);
   end Tag_Add;

   procedure Tag_Bind
     (TextWidget: in Tk_Text; TagName, Sequence, Script: in String) is
   begin
      Execute_Widget_Command
        (TextWidget, "tag bind", TagName & " " & Sequence & " " & Script);
   end Tag_Bind;

   function Tag_Bind
     (TextWidget: in Tk_Text; TagName: in String; Sequence: in String := "")
      return String is
   begin
      Execute_Widget_Command(TextWidget, "tag bind", TagName & " " & Sequence);
      return Tcl.Ada.Tcl_GetResult(TextWidget.Interp);
   end Tag_Bind;

   function Tag_Cget
     (TextWidget: in Tk_Text; TagName, Option: in String) return String is
   begin
      Execute_Widget_Command(TextWidget, "tag cget", TagName & " " & Option);
      return Tcl.Ada.Tcl_GetResult(TextWidget.Interp);
   end Tag_Cget;

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

   procedure Tag_Delete(TextWidget: in Tk_Text; TagName: in String) is
   begin
      Execute_Widget_Command(TextWidget, "tag delete", TagName);
   end Tag_Delete;

   procedure Tag_Lower
     (TextWidget: in Tk_Text; TagName: in String;
      BelowThis: in String := "") is
   begin
      Execute_Widget_Command
        (TextWidget, "tag lower", TagName & " " & BelowThis);
   end Tag_Lower;

   function Tag_Names
     (TextWidget: in Tk_Text; Index: in String := "") return String is
   begin
      Execute_Widget_Command(TextWidget, "tag names", Index);
      return Tcl.Ada.Tcl_GetResult(TextWidget.Interp);
   end Tag_Names;

   function Tag_NextRange
     (TextWidget: in Tk_Text; TagName, Index1: in String;
      Index2: in String := "") return String is
   begin
      Execute_Widget_Command
        (TextWidget, "tag nextrange", TagName & " " & Index1 & " " & Index2);
      return Tcl.Ada.Tcl_GetResult(TextWidget.Interp);
   end Tag_NextRange;

   function Tag_PrevRange
     (TextWidget: in Tk_Text; TagName, Index1: in String;
      Index2: in String := "") return String is
   begin
      Execute_Widget_Command
        (TextWidget, "tag prevrange", TagName & " " & Index1 & " " & Index2);
      return Tcl.Ada.Tcl_GetResult(TextWidget.Interp);
   end Tag_PrevRange;

   procedure Tag_Raise
     (TextWidget: in Tk_Text; TagName: in String;
      AboveThis: in String := "") is
   begin
      Execute_Widget_Command
        (TextWidget, "tag raise", TagName & " " & AboveThis);
   end Tag_Raise;

   function Tag_Ranges
     (TextWidget: in Tk_Text; TagName: in String) return String is
   begin
      Execute_Widget_Command(TextWidget, "tag ranges", TagName);
      return Tcl.Ada.Tcl_GetResult(TextWidget.Interp);
   end Tag_Ranges;

   procedure Tag_Remove
     (TextWidget: in Tk_Text; TagName, Index1: in String;
      Index2: in String := "") is
   begin
      Execute_Widget_Command
        (TextWidget, "tag remove", TagName & " " & Index1 & " " & Index2);
   end Tag_Remove;

   function Window_Cget
     (TextWidget: in Tk_Text; Index, Option: in String) return String is
   begin
      Execute_Widget_Command(TextWidget, "window cget", Index & " " & Option);
      return Tcl.Ada.Tcl_GetResult(TextWidget.Interp);
   end Window_Cget;

   procedure Window_Configure
     (TextWidget: in Tk_Text; Index, Options: in String) is
   begin
      Execute_Widget_Command
        (TextWidget, "window configure", Index & " " & Options);
   end Window_Configure;

   function Window_Configure
     (TextWidget: in Tk_Text; Index: in String; Option: in String := "")
      return String is
   begin
      Execute_Widget_Command
        (TextWidget, "window configure", Index & " " & Option);
      return Tcl.Ada.Tcl_GetResult(TextWidget.Interp);
   end Window_Configure;

   function Window_Create
     (TextWidget: in Tk_Text; Index: in String; Options: in String := "")
      return String is
   begin
      Execute_Widget_Command
        (TextWidget, "window create", Index & " " & Options);
      return Tcl.Ada.Tcl_GetResult(TextWidget.Interp);
   end Window_Create;

   function Window_Names(TextWidget: in Tk_Text) return String is
   begin
      Execute_Widget_Command(TextWidget, "window names");
      return Tcl.Ada.Tcl_GetResult(TextWidget.Interp);
   end Window_Names;

   function XView(TextWidget: in Tk_Text) return String is
   begin
      Execute_Widget_Command(TextWidget, "xview");
      return Tcl.Ada.Tcl_GetResult(TextWidget.Interp);
   end XView;

   procedure Xview_Move_To(TextWidget: in Tk_Text; Fraction: in String) is
   begin
      Execute_Widget_Command(TextWidget, "xview moveto", Fraction);
   end Xview_Move_To;

   procedure Xview_Scroll(TextWidget: in Tk_Text; Number, What: in String) is
   begin
      Execute_Widget_Command(TextWidget, "xview scroll", Number & " " & What);
   end Xview_Scroll;

   function YView(TextWidget: in Tk_Text) return String is
   begin
      Execute_Widget_Command(TextWidget, "yview");
      return Tcl.Ada.Tcl_GetResult(TextWidget.Interp);
   end YView;

   procedure Yview_Move_To(TextWidget: in Tk_Text; Fraction: in String) is
   begin
      Execute_Widget_Command(TextWidget, "yview moveto", Fraction);
   end Yview_Move_To;

   procedure Yview_Scroll(TextWidget: in Tk_Text; Number, What: in String) is
   begin
      Execute_Widget_Command(TextWidget, "yview scroll", Number & " " & What);
   end Yview_Scroll;

end Tcl.Tk.Ada.Widgets.Text;

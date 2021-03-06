--------------------------------------------------------------------
--
-- tcl-tk-ada.adb --
--
--  Copyright (c) 1995-2000 Terry J. Westley
--  Copyright (c) 2020 Bartek Jasicki <thindil@laeran.pl>
--
--  Tashy is free software; you can redistribute it and/or modify it under
--  terms of the GNU General Public License as published by the Free
--  Software Foundation; either version 2, or (at your option) any later
--  version. Tash is distributed in the hope that it will be useful, but
--  WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
--  or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
--  for more details. You should have received a copy of the GNU General
--  Public License distributed with Tash; see file COPYING. If not, write to
--
--          Free Software Foundation
--          59 Temple Place - Suite 330
--          Boston, MA 02111-1307, USA
--
--  As a special exception, if other files instantiate generics from this
--  unit, or you link this unit with other files to produce an executable,
--  this unit does not by itself cause the resulting executable to be
--  covered by the GNU General Public License. This exception does not
--  however invalidate any other reasons why the executable file might be
--  covered by the GNU Public License.
--
--------------------------------------------------------------------

with Tcl.Ada;
with Ada.Text_IO; use Ada.Text_IO;

package body Tcl.Tk.Ada is

   Trace: Boolean := False;

   procedure Tcl_Eval(Interp: in Tcl_Interp; Cmd: in String) is
   begin --  Tcl_Eval
      if Trace then
         Put_Line(Cmd);
      end if;
      Tcl.Ada.Tcl_Eval(Interp, Cmd);
   end Tcl_Eval;

   procedure Set_Trace(State: in Boolean) is
   begin --  Set_Trace
      Trace := State;
   end Set_Trace;

   procedure Set_Context(Interp: in Tcl_Interp) is
   begin --  Set_Context
      Context := Interp;
   end Set_Context;

   function Get_Context return Tcl_Interp is
   begin --  Get_Context
      return Context;
   end Get_Context;

   procedure After(Ms: in Natural) is
      --
      use CArgv;
      Argv: CArgv.Chars_Ptr_Ptr := CArgv.Empty & Natural'Image(Ms);
   begin --  After
      Tcl_Eval(Context, "after " & Natural'Image(Ms));
      CArgv.Free(Argv);
   end After;

   procedure After(Interp: in Tcl_Interp; Ms: in Natural) is
   begin --  After
      Tcl_Eval(Interp, "after " & Natural'Image(Ms));
   end After;

   function After(Ms: in Natural; Script: in String) return String is
   begin --  After
      Tcl_Eval(Context, "after " & Natural'Image(Ms) & " " & Script);
      return Tcl.Ada.Tcl_GetResult(Context);
   end After;

   procedure After(Ms: in Natural; Script: in String) is
   begin --  After
      Tcl_Eval(Context, "after " & Natural'Image(Ms) & " " & Script);
   end After;

   function After
     (Interp: in Tcl_Interp; Ms: in Natural; Script: in String)
      return String is
   begin --  After
      Tcl_Eval(Interp, "after " & Natural'Image(Ms) & " " & Script);
      return Tcl.Ada.Tcl_GetResult(Context);
   end After;

   procedure After(Interp: in Tcl_Interp; Ms: in Natural; Script: in String) is
   begin --  After
      Tcl_Eval(Interp, "after " & Natural'Image(Ms) & " " & Script);
   end After;

   procedure Cancel(id_or_script: in String) is
   begin --  Cancel
      Tcl_Eval(Context, "after cancel " & id_or_script);
   end Cancel;

   procedure Cancel(Interp: in Tcl_Interp; id_or_script: in String) is
   begin --  Cancel
      Tcl_Eval(Interp, "after cancel " & id_or_script);
   end Cancel;

   function Idle(Script: in String) return String is
   begin --  Idle
      Tcl_Eval(Context, "after idle " & Script);
      return Tcl.Ada.Tcl_GetResult(Context);
   end Idle;

   procedure Idle(Script: in String) is
   begin --  Idle
      Tcl_Eval(Context, "after idle " & Script);
   end Idle;

   function Idle(Interp: in Tcl_Interp; Script: in String) return String is
   begin --  Idle
      Tcl_Eval(Interp, "after idle " & Script);
      return Tcl.Ada.Tcl_GetResult(Context);
   end Idle;

   procedure Idle(Interp: in Tcl_Interp; Script: in String) is
   begin --  Idle
      Tcl_Eval(Interp, "after idle " & Script);
   end Idle;

   function Info(id: in String := "") return String is
   begin --  Info
      Tcl_Eval(Context, "after info " & id);
      return Tcl.Ada.Tcl_GetResult(Context);
   end Info;

   function Info(Interp: in Tcl_Interp; id: in String := "") return String is
   begin --  Info
      Tcl_Eval(Interp, "after info " & id);
      return Tcl.Ada.Tcl_GetResult(Context);
   end Info;

   function Tk_PathName(tkwin: in Tk_Window) return String is
   begin --  Tk_PathName
      return CHelper.Value(Tcl.Tk.Tk_PathName(tkwin));
   end Tk_PathName;

   procedure Tk_AddOption
     (tkwin: in Tk_Window; name: in String; value: in String;
      priority: in C.int) is
      C_name: aliased C.char_array := C.To_C(name);
      C_value: aliased C.char_array := C.To_C(value);
   begin --  Tk_AddOption
      Tcl.Tk.Tk_AddOption
        (tkwin, C.Strings.To_Chars_Ptr(C_name'Unchecked_Access),
         C.Strings.To_Chars_Ptr(C_value'Unchecked_Access), priority);
   end Tk_AddOption;

   function Tk_CanvasGetCoord
     (interp: in Tcl_Interp; canvas: in Tk_Canvas; str: in String;
      doublePtr: access C.double) return C.int is
      C_str: aliased C.char_array := C.To_C(str);
   begin --  Tk_CanvasGetCoord
      return Tcl.Tk.Tk_CanvasGetCoord
          (interp, canvas, C.Strings.To_Chars_Ptr(C_str'Unchecked_Access),
           doublePtr);
   end Tk_CanvasGetCoord;

   function Tk_CanvasTagsParseProc
     (data: in ClientData; interp: in Tcl_Interp; tkwin: in Tk_Window;
      value: in String; widgRec: in String; offset: in C.int) return C.int is
      C_value: aliased C.char_array := C.To_C(value);
      C_widgRec: aliased C.char_array := C.To_C(widgRec);
   begin --  Tk_CanvasTagsParseProc
      return Tcl.Tk.Tk_CanvasTagsParseProc
          (data, interp, tkwin,
           C.Strings.To_Chars_Ptr(C_value'Unchecked_Access),
           C.Strings.To_Chars_Ptr(C_widgRec'Unchecked_Access), offset);
   end Tk_CanvasTagsParseProc;

   function Tk_CanvasTagsPrintProc
     (data: in ClientData; tkwin: in Tk_Window; widgRec: in String;
      offset: in C.int; freeProcPtr: in Tcl_FreeProc) return String is
      C_widgRec: aliased C.char_array := C.To_C(widgRec);
   begin --  Tk_CanvasTagsPrintProc
      return CHelper.Value
          (Tcl.Tk.Tk_CanvasTagsPrintProc
             (data, tkwin, C.Strings.To_Chars_Ptr(C_widgRec'Unchecked_Access),
              offset, freeProcPtr));
   end Tk_CanvasTagsPrintProc;

   function Tk_ConfigureInfo
     (interp: in Tcl_Interp; tkwin: in Tk_Window; specs: in Tk_ConfigSpec;
      widgRec: in String; argvName: in String; flags: in C.int) return C.int is
      C_widgRec: aliased C.char_array := C.To_C(widgRec);
      C_argvName: aliased C.char_array := C.To_C(argvName);
   begin --  Tk_ConfigureInfo
      return Tcl.Tk.Tk_ConfigureInfo
          (interp, tkwin, specs,
           C.Strings.To_Chars_Ptr(C_widgRec'Unchecked_Access),
           C.Strings.To_Chars_Ptr(C_argvName'Unchecked_Access), flags);
   end Tk_ConfigureInfo;

   function Tk_ConfigureValue
     (interp: in Tcl_Interp; tkwin: in Tk_Window; specs: in Tk_ConfigSpec;
      widgRec: in String; argvName: in String; flags: in C.int) return C.int is
      C_widgRec: aliased C.char_array := C.To_C(widgRec);
      C_argvName: aliased C.char_array := C.To_C(argvName);
   begin --  Tk_ConfigureValue
      return Tcl.Tk.Tk_ConfigureValue
          (interp, tkwin, specs,
           C.Strings.To_Chars_Ptr(C_widgRec'Unchecked_Access),
           C.Strings.To_Chars_Ptr(C_argvName'Unchecked_Access), flags);
   end Tk_ConfigureValue;

   function Tk_ConfigureWidget
     (interp: in Tcl_Interp; tkwin: in Tk_Window; specs: in Tk_ConfigSpec;
      argc: in C.int; argv: in CArgv.Chars_Ptr_Ptr; widgRec: in String;
      flags: in C.int) return C.int is
      C_widgRec: aliased C.char_array := C.To_C(widgRec);
   begin --  Tk_ConfigureWidget
      return Tcl.Tk.Tk_ConfigureWidget
          (interp, tkwin, specs, argc, argv,
           C.Strings.To_Chars_Ptr(C_widgRec'Unchecked_Access), flags);
   end Tk_ConfigureWidget;

   function Tk_ComputeTextLayout
     (font: in Tk_Font; str: in String; numChars: in C.int;
      wrapLength: in C.int; justify: in Tk_Justify; flags: in C.int;
      widthPtr: access C.int; heightPtr: access C.int) return Tk_TextLayout is
      C_str: aliased C.char_array := C.To_C(str);
   begin --  Tk_ComputeTextLayout
      return Tcl.Tk.Tk_ComputeTextLayout
          (font, C.Strings.To_Chars_Ptr(C_str'Unchecked_Access), numChars,
           wrapLength, justify, flags, widthPtr, heightPtr);
   end Tk_ComputeTextLayout;

   function Tk_CreateBinding
     (interp: in Tcl_Interp; bindingTable: in Tk_BindingTable;
      object: in ClientData; eventStr: in String; command: in String;
      append: in C.int) return C.unsigned_long is
      C_eventStr: aliased C.char_array := C.To_C(eventStr);
      C_command: aliased C.char_array := C.To_C(command);
   begin --  Tk_CreateBinding
      return Tcl.Tk.Tk_CreateBinding
          (interp, bindingTable, object,
           C.Strings.To_Chars_Ptr(C_eventStr'Unchecked_Access),
           C.Strings.To_Chars_Ptr(C_command'Unchecked_Access), append);
   end Tk_CreateBinding;

   function Tk_CreateWindow
     (interp: in Tcl_Interp; parent: in Tk_Window; name: in String;
      screenName: in String) return Tk_Window is
      C_name: aliased C.char_array := C.To_C(name);
      C_screenName: aliased C.char_array := C.To_C(screenName);
   begin --  Tk_CreateWindow
      return Tcl.Tk.Tk_CreateWindow
          (interp, parent, C.Strings.To_Chars_Ptr(C_name'Unchecked_Access),
           C.Strings.To_Chars_Ptr(C_screenName'Unchecked_Access));
   end Tk_CreateWindow;

   function Tk_CreateWindowFromPath
     (interp: in Tcl_Interp; tkwin: in Tk_Window; pathName: in String;
      screenName: in String) return Tk_Window is
      C_pathName: aliased C.char_array := C.To_C(pathName);
      C_screenName: aliased C.char_array := C.To_C(screenName);
   begin --  Tk_CreateWindowFromPath
      return Tcl.Tk.Tk_CreateWindowFromPath
          (interp, tkwin, C.Strings.To_Chars_Ptr(C_pathName'Unchecked_Access),
           C.Strings.To_Chars_Ptr(C_screenName'Unchecked_Access));
   end Tk_CreateWindowFromPath;

   function Tk_DefineBitmap
     (interp: in Tcl_Interp; name: in String; source: in String;
      width: in C.int; height: in C.int) return C.int is
      C_name: aliased C.char_array := C.To_C(name);
      C_source: aliased C.char_array := C.To_C(source);
   begin --  Tk_DefineBitmap
      return Tcl.Tk.Tk_DefineBitmap
          (interp, C.Strings.To_Chars_Ptr(C_name'Unchecked_Access),
           C.Strings.To_Chars_Ptr(C_source'Unchecked_Access), width, height);
   end Tk_DefineBitmap;

   function Tk_DeleteBinding
     (interp: in Tcl_Interp; bindingTable: in Tk_BindingTable;
      object: in ClientData; eventStr: in String) return C.int is
      C_eventStr: aliased C.char_array := C.To_C(eventStr);
   begin --  Tk_DeleteBinding
      return Tcl.Tk.Tk_DeleteBinding
          (interp, bindingTable, object,
           C.Strings.To_Chars_Ptr(C_eventStr'Unchecked_Access));
   end Tk_DeleteBinding;

   procedure Tk_DeleteImage(interp: in Tcl_Interp; name: in String) is
      C_name: aliased C.char_array := C.To_C(name);
   begin --  Tk_DeleteImage
      Tcl.Tk.Tk_DeleteImage
        (interp, C.Strings.To_Chars_Ptr(C_name'Unchecked_Access));
   end Tk_DeleteImage;

   function Tk_DisplayName(tkwin: in Tk_Window) return String is
   begin --  Tk_DisplayName
      return CHelper.Value(Tcl.Tk.Tk_DisplayName(tkwin));
   end Tk_DisplayName;

   function Tk_FindPhoto
     (interp: in Tcl_Interp; imageName: in String) return Tk_PhotoHandle is
      C_imageName: aliased C.char_array := C.To_C(imageName);
   begin --  Tk_FindPhoto
      return Tcl.Tk.Tk_FindPhoto
          (interp, C.Strings.To_Chars_Ptr(C_imageName'Unchecked_Access));
   end Tk_FindPhoto;

   function Tk_GetAnchor
     (interp: in Tcl_Interp; str: in String; anchorPtr: in Tk_Anchor) return C
     .int is
      C_str: aliased C.char_array := C.To_C(str);
   begin --  Tk_GetAnchor
      return Tcl.Tk.Tk_GetAnchor
          (interp, C.Strings.To_Chars_Ptr(C_str'Unchecked_Access), anchorPtr);
   end Tk_GetAnchor;

   function Tk_GetBinding
     (interp: in Tcl_Interp; bindingTable: in Tk_BindingTable;
      object: in ClientData; eventStr: in String) return String is
      C_eventStr: aliased C.char_array := C.To_C(eventStr);
   begin --  Tk_GetBinding
      return CHelper.Value
          (Tcl.Tk.Tk_GetBinding
             (interp, bindingTable, object,
              C.Strings.To_Chars_Ptr(C_eventStr'Unchecked_Access)));
   end Tk_GetBinding;

   function Tk_GetCapStyle
     (interp: in Tcl_Interp; str: in String; capPtr: access C.int) return C
     .int is
      C_str: aliased C.char_array := C.To_C(str);
   begin --  Tk_GetCapStyle
      return Tcl.Tk.Tk_GetCapStyle
          (interp, C.Strings.To_Chars_Ptr(C_str'Unchecked_Access), capPtr);
   end Tk_GetCapStyle;

   function Tk_GetCursorFromData
     (interp: in Tcl_Interp; tkwin: in Tk_Window; source: in String;
      mask: in String; width: in C.int; height: in C.int; xHot: in C.int;
      yHot: in C.int; fg: in Tk_Uid; bg: in Tk_Uid) return Tk_Cursor is
      C_source: aliased C.char_array := C.To_C(source);
      C_mask: aliased C.char_array := C.To_C(mask);
   begin --  Tk_GetCursorFromData
      return Tcl.Tk.Tk_GetCursorFromData
          (interp, tkwin, C.Strings.To_Chars_Ptr(C_source'Unchecked_Access),
           C.Strings.To_Chars_Ptr(C_mask'Unchecked_Access), width, height,
           xHot, yHot, fg, bg);
   end Tk_GetCursorFromData;

   function Tk_GetFont
     (interp: in Tcl_Interp; tkwin: in Tk_Window; str: in String)
      return Tk_Font is
      C_str: aliased C.char_array := C.To_C(str);
   begin --  Tk_GetFont
      return Tcl.Tk.Tk_GetFont
          (interp, tkwin, C.Strings.To_Chars_Ptr(C_str'Unchecked_Access));
   end Tk_GetFont;

   function Tk_GetImage
     (interp: in Tcl_Interp; tkwin: in Tk_Window; name: in String;
      changeProc: in Tk_ImageChangedProc; data: in ClientData)
      return Tk_Image is
      C_name: aliased C.char_array := C.To_C(name);
   begin --  Tk_GetImage
      return Tcl.Tk.Tk_GetImage
          (interp, tkwin, C.Strings.To_Chars_Ptr(C_name'Unchecked_Access),
           changeProc, data);
   end Tk_GetImage;

   function Tk_GetImageMasterData
     (interp: in Tcl_Interp; name: in String; typePtrPtr: in Tk_ImageType)
      return ClientData is
      C_name: aliased C.char_array := C.To_C(name);
   begin --  Tk_GetImageMasterData
      return Tcl.Tk.Tk_GetImageMasterData
          (interp, C.Strings.To_Chars_Ptr(C_name'Unchecked_Access),
           typePtrPtr);
   end Tk_GetImageMasterData;

   function Tk_GetJoinStyle
     (interp: in Tcl_Interp; str: in String; joinPtr: access C.int) return C
     .int is
      C_str: aliased C.char_array := C.To_C(str);
   begin --  Tk_GetJoinStyle
      return Tcl.Tk.Tk_GetJoinStyle
          (interp, C.Strings.To_Chars_Ptr(C_str'Unchecked_Access), joinPtr);
   end Tk_GetJoinStyle;

   function Tk_GetJustify
     (interp: in Tcl_Interp; str: in String; justifyPtr: in Tk_Justify)
      return C.int is
      C_str: aliased C.char_array := C.To_C(str);
   begin --  Tk_GetJustify
      return Tcl.Tk.Tk_GetJustify
          (interp, C.Strings.To_Chars_Ptr(C_str'Unchecked_Access), justifyPtr);
   end Tk_GetJustify;

   function Tk_GetOption
     (tkwin: in Tk_Window; name: in String; className: in String)
      return Tk_Uid is
      C_name: aliased C.char_array := C.To_C(name);
      C_className: aliased C.char_array := C.To_C(className);
   begin --  Tk_GetOption
      return Tcl.Tk.Tk_GetOption
          (tkwin, C.Strings.To_Chars_Ptr(C_name'Unchecked_Access),
           C.Strings.To_Chars_Ptr(C_className'Unchecked_Access));
   end Tk_GetOption;

   function Tk_GetPixels
     (interp: in Tcl_Interp; tkwin: in Tk_Window; str: in String;
      intPtr: access C.int) return C.int is
      C_str: aliased C.char_array := C.To_C(str);
   begin --  Tk_GetPixels
      return Tcl.Tk.Tk_GetPixels
          (interp, tkwin, C.Strings.To_Chars_Ptr(C_str'Unchecked_Access),
           intPtr);
   end Tk_GetPixels;

   function Tk_GetRelief
     (interp: in Tcl_Interp; name: in String; reliefPtr: access C.int) return C
     .int is
      C_name: aliased C.char_array := C.To_C(name);
   begin --  Tk_GetRelief
      return Tcl.Tk.Tk_GetRelief
          (interp, C.Strings.To_Chars_Ptr(C_name'Unchecked_Access), reliefPtr);
   end Tk_GetRelief;

   function Tk_GetScreenMM
     (interp: in Tcl_Interp; tkwin: in Tk_Window; str: in String;
      doublePtr: access C.double) return C.int is
      C_str: aliased C.char_array := C.To_C(str);
   begin --  Tk_GetScreenMM
      return Tcl.Tk.Tk_GetScreenMM
          (interp, tkwin, C.Strings.To_Chars_Ptr(C_str'Unchecked_Access),
           doublePtr);
   end Tk_GetScreenMM;

   function Tk_GetUid(str: in String) return Tk_Uid is
      C_str: aliased C.char_array := C.To_C(str);
   begin --  Tk_GetUid
      return Tcl.Tk.Tk_GetUid(C.Strings.To_Chars_Ptr(C_str'Unchecked_Access));
   end Tk_GetUid;

   function Tk_MeasureChars
     (tkfont: in Tk_Font; source: in String; numBytes: in C.int;
      maxPixels: in C.int; flags: in C.int; lengthPtr: access C.int) return C
     .int is
      C_source: aliased C.char_array := C.To_C(source);
   begin --  Tk_MeasureChars
      return Tcl.Tk.Tk_MeasureChars
          (tkfont, C.Strings.To_Chars_Ptr(C_source'Unchecked_Access), numBytes,
           maxPixels, flags, lengthPtr);
   end Tk_MeasureChars;

   function Tk_NameOf3DBorder(border: in Tk_3DBorder) return String is
   begin --  Tk_NameOf3DBorder
      return CHelper.Value(Tcl.Tk.Tk_NameOf3DBorder(border));
   end Tk_NameOf3DBorder;

   function Tk_NameOfAnchor(anchor: in Tk_Anchor) return String is
   begin --  Tk_NameOfAnchor
      return CHelper.Value(Tcl.Tk.Tk_NameOfAnchor(anchor));
   end Tk_NameOfAnchor;

   function Tk_NameOfCapStyle(cap: in C.int) return String is
   begin --  Tk_NameOfCapStyle
      return CHelper.Value(Tcl.Tk.Tk_NameOfCapStyle(cap));
   end Tk_NameOfCapStyle;

   function Tk_NameOfFont(font: in Tk_Font) return String is
   begin --  Tk_NameOfFont
      return CHelper.Value(Tcl.Tk.Tk_NameOfFont(font));
   end Tk_NameOfFont;

   function Tk_NameOfImage(imageMaster: in Tk_ImageMaster) return String is
   begin --  Tk_NameOfImage
      return CHelper.Value(Tcl.Tk.Tk_NameOfImage(imageMaster));
   end Tk_NameOfImage;

   function Tk_NameOfJoinStyle(join: in C.int) return String is
   begin --  Tk_NameOfJoinStyle
      return CHelper.Value(Tcl.Tk.Tk_NameOfJoinStyle(join));
   end Tk_NameOfJoinStyle;

   function Tk_NameOfJustify(justify: in Tk_Justify) return String is
   begin --  Tk_NameOfJustify
      return CHelper.Value(Tcl.Tk.Tk_NameOfJustify(justify));
   end Tk_NameOfJustify;

   function Tk_NameOfRelief(relief: in C.int) return String is
   begin --  Tk_NameOfRelief
      return CHelper.Value(Tcl.Tk.Tk_NameOfRelief(relief));
   end Tk_NameOfRelief;

   function Tk_NameToWindow
     (interp: in Tcl_Interp; pathName: in String; tkwin: in Tk_Window)
      return Tk_Window is
      C_pathName: aliased C.char_array := C.To_C(pathName);
   begin --  Tk_NameToWindow
      return Tcl.Tk.Tk_NameToWindow
          (interp, C.Strings.To_Chars_Ptr(C_pathName'Unchecked_Access), tkwin);
   end Tk_NameToWindow;

   function Tk_SetAppName
     (tkwin: in Tk_Window; name: in String) return String is
      C_name: aliased C.char_array := C.To_C(name);
   begin --  Tk_SetAppName
      return CHelper.Value
          (Tcl.Tk.Tk_SetAppName
             (tkwin, C.Strings.To_Chars_Ptr(C_name'Unchecked_Access)));
   end Tk_SetAppName;

   procedure Tk_SetClass(tkwin: in Tk_Window; className: in String) is
      C_className: aliased C.char_array := C.To_C(className);
   begin --  Tk_SetClass
      Tcl.Tk.Tk_SetClass
        (tkwin, C.Strings.To_Chars_Ptr(C_className'Unchecked_Access));
   end Tk_SetClass;

   function Tk_TextWidth
     (font: in Tk_Font; str: in String; numBytes: in C.int) return C.int is
      C_str: aliased C.char_array := C.To_C(str);
   begin --  Tk_TextWidth
      return Tcl.Tk.Tk_TextWidth
          (font, C.Strings.To_Chars_Ptr(C_str'Unchecked_Access), numBytes);
   end Tk_TextWidth;

   procedure Tk_FreeConfigOptions
     (recordPtr: in String; optionToken: in Tk_OptionTable;
      tkwin: in Tk_Window) is
      C_recordPtr: aliased C.char_array := C.To_C(recordPtr);
   begin --  Tk_FreeConfigOptions
      Tcl.Tk.Tk_FreeConfigOptions
        (C.Strings.To_Chars_Ptr(C_recordPtr'Unchecked_Access), optionToken,
         tkwin);
   end Tk_FreeConfigOptions;

   function Tk_GetOptionInfo
     (interp: in Tcl_Interp; recordPtr: in String;
      optionTable: in Tk_OptionTable; namePtr: in Tcl_Obj; tkwin: in Tk_Window)
      return Tcl_Obj is
      C_recordPtr: aliased C.char_array := C.To_C(recordPtr);
   begin --  Tk_GetOptionInfo
      return Tcl.Tk.Tk_GetOptionInfo
          (interp, C.Strings.To_Chars_Ptr(C_recordPtr'Unchecked_Access),
           optionTable, namePtr, tkwin);
   end Tk_GetOptionInfo;

   function Tk_GetOptionValue
     (interp: in Tcl_Interp; recordPtr: in String;
      optionTable: in Tk_OptionTable; namePtr: in Tcl_Obj; tkwin: in Tk_Window)
      return Tcl_Obj is
      C_recordPtr: aliased C.char_array := C.To_C(recordPtr);
   begin --  Tk_GetOptionValue
      return Tcl.Tk.Tk_GetOptionValue
          (interp, C.Strings.To_Chars_Ptr(C_recordPtr'Unchecked_Access),
           optionTable, namePtr, tkwin);
   end Tk_GetOptionValue;

   function Tk_InitOptions
     (interp: in Tcl_Interp; recordPtr: in String;
      optionToken: in Tk_OptionTable; tkwin: in Tk_Window) return C.int is
      C_recordPtr: aliased C.char_array := C.To_C(recordPtr);
   begin --  Tk_InitOptions
      return Tcl.Tk.Tk_InitOptions
          (interp, C.Strings.To_Chars_Ptr(C_recordPtr'Unchecked_Access),
           optionToken, tkwin);
   end Tk_InitOptions;

   function Tk_SetOptions
     (interp: in Tcl_Interp; recordPtr: in String;
      optionTable: in Tk_OptionTable; objc: in C.int; objv: in Tcl_Obj_Array;
      tkwin: in Tk_Window; savePtr: in Tk_SavedOptions; maskPtr: access C.int)
      return C.int is
      C_recordPtr: aliased C.char_array := C.To_C(recordPtr);
   begin --  Tk_SetOptions
      return Tcl.Tk.Tk_SetOptions
          (interp, C.Strings.To_Chars_Ptr(C_recordPtr'Unchecked_Access),
           optionTable, objc, objv, tkwin, savePtr, maskPtr);
   end Tk_SetOptions;

   function Tk_GetDash
     (interp: in Tcl_Interp; value: in String; dash: in Tk_Dash) return C
     .int is
      C_value: aliased C.char_array := C.To_C(value);
   begin --  Tk_GetDash
      return Tcl.Tk.Tk_GetDash
          (interp, C.Strings.To_Chars_Ptr(C_value'Unchecked_Access), dash);
   end Tk_GetDash;

end Tcl.Tk.Ada;

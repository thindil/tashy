--------------------------------------------------------------------
--
--  tcl-tk-ada.ads -- This package provides the "thick" binding to Tcl.Tk.
--
--  Copyright (c) 1995-2000 Terry J. Westley
--  Copyrigth (c) 2020 Bartek thindil Jasicki <thindil@laeran.pl>
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

with CArgv;

-- ****h* Tk/TkAda
-- FUNCTION
-- This package provides the "thick" binding to Tcl.Tk.
-- SOURCE
package Tcl.Tk.Ada is
-- ****

   package C renames Interfaces.C;

   -- ****f* TkAda/Set_Trace
   -- FUNCTION
   -- Turn on tracing of Tcl/Tk command execution.
   -- PARAMETERS
   -- State - If true, turn on tracing.
   -- SOURCE
   procedure Set_Trace(State: in Boolean);
   -- ****

   -- ****f* TkAda/Set_Context
   -- FUNCTION
   -- Sets the interpreter context for all Tk calls which do not include
   -- either an Interp or Widget parameter.
   -- PARAMETERS
   -- Interp - Tcl interpreter to which context will be set
   -- SOURCE
   procedure Set_Context(Interp: in Tcl_Interp);
   -- ****

   -- ****f* TkAda/Get_Context
   -- FUNCTION
   -- Gets the current interpreter context.
   -- RESULT
   -- Current Tcl interpreter
   -- SOURCE
   function Get_Context return Tcl_Interp;
   -- ****

   ---------------------------------------------
   --
   --   After commands
   --
   --   These commands delay execution and schedule (and unschedule)
   --   future execution of Tcl commands.
   --
   ---------------------------------------------

   -- ****f* TkAda/After
   -- FUNCTION
   -- Sleeps for Ms milliseconds in the "contextual" interpreter.
   -- SOURCE
   procedure After(Ms: in Natural);
   -- ****

   -- ****f* TkAda/After2
   -- FUNCTION
   -- Sleeps for Ms milliseconds in the specified interpreter.
   -- SOURCE
   procedure After(Interp: in Tcl_Interp; Ms: in Natural);
   -- ****

   -- ****f* TkAda/After3
   -- FUNCTION
   -- Arranges for the Tcl Script to be executed after Ms milliseconds
   -- in the "contextual" interpreter.  The function returns an
   -- identifier suitable for canceling the command.
   -- SOURCE
   function After(Ms: in Natural; Script: in String) return String;
   procedure After(Ms: in Natural; Script: in String);
   -- ****

   -- ****f* TkAda/After4
   -- FUNCTION
   -- Arranges for the Tcl Script to be executed after Ms milliseconds
   -- in the specified interpreter.  The function returns an
   -- identifier suitable for canceling the command.
   -- SOURCE
   function After
     (Interp: in Tcl_Interp; Ms: in Natural; Script: in String) return String;
   procedure After(Interp: in Tcl_Interp; Ms: in Natural; Script: in String);
   -- ****

   -- ****f* TkAda/Cancel
   -- FUNCTION
   -- Cancels the execution of a delayed command in the "contextual"
   -- interpreter.
   -- SOURCE
   procedure Cancel(id_or_script: in String);
   -- ****

   -- ****f* TkAda/Cancel2
   -- FUNCTION
   -- Cancels the execution of a delayed command in the specified
   -- interpreter.
   -- SOURCE
   procedure Cancel(Interp: in Tcl_Interp; id_or_script: in String);
   -- ****

   -- ****f* TkAda/Idle
   -- FUNCTION
   -- Arranges for the Tcl Script to be executed later as an idle
   -- handler in the "contextual" interpreter.  The function returns
   -- an identifier suitable for canceling the command.
   -- SOURCE
   function Idle(Script: in String) return String;
   procedure Idle(Script: in String);
   -- ****

   -- ****f* TkAda/Idle2
   -- FUNCTION
   -- Arranges for the Tcl Script to be executed later as an idle
   -- handler in the specified interpreter.  The function returns
   -- an identifier suitable for canceling the command.
   -- SOURCE
   function Idle(Interp: in Tcl_Interp; Script: in String) return String;
   procedure Idle(Interp: in Tcl_Interp; Script: in String);
   -- ****

   -- ****f* TkAda/Info
   -- FUNCTION
   -- Returns information about existing event handlers in the
   -- "contextual" interpreter.
   -- SOURCE
   function Info(id: in String := "") return String;
   -- ****

   -- ****f* TkAda/Info2
   -- FUNCTION
   -- Returns information about existing event handlers in the
   -- "contextual" interpreter.
   -- SOURCE
   function Info(Interp: in Tcl_Interp; id: in String := "") return String;
   -- ****

   function Tk_PathName(tkwin: in Tk_Window) return String;

   procedure Tk_AddOption
     (tkwin: in Tk_Window; name: in String; value: in String;
      priority: in C.int);

   function Tk_CanvasGetCoord
     (interp: in Tcl_Interp; canvas: in Tk_Canvas; str: in String;
      doublePtr: access C.double) return C.int;

   function Tk_CanvasTagsParseProc
     (data: in ClientData; interp: in Tcl_Interp; tkwin: in Tk_Window;
      value: in String; widgRec: in String; offset: in C.int) return C.int;

   function Tk_CanvasTagsPrintProc
     (data: in ClientData; tkwin: in Tk_Window; widgRec: in String;
      offset: in C.int; freeProcPtr: in Tcl_FreeProc) return String;

   function Tk_ConfigureInfo
     (interp: in Tcl_Interp; tkwin: in Tk_Window; specs: in Tk_ConfigSpec;
      widgRec: in String; argvName: in String; flags: in C.int) return C.int;

   function Tk_ConfigureValue
     (interp: in Tcl_Interp; tkwin: in Tk_Window; specs: in Tk_ConfigSpec;
      widgRec: in String; argvName: in String; flags: in C.int) return C.int;

   function Tk_ConfigureWidget
     (interp: in Tcl_Interp; tkwin: in Tk_Window; specs: in Tk_ConfigSpec;
      argc: in C.int; argv: in CArgv.Chars_Ptr_Ptr; widgRec: in String;
      flags: in C.int) return C.int;

   function Tk_ComputeTextLayout
     (font: in Tk_Font; str: in String; numChars: in C.int;
      wrapLength: in C.int; justify: in Tk_Justify; flags: in C.int;
      widthPtr: access C.int; heightPtr: access C.int) return Tk_TextLayout;

   function Tk_CreateBinding
     (interp: in Tcl_Interp; bindingTable: in Tk_BindingTable;
      object: in ClientData; eventStr: in String; command: in String;
      append: in C.int) return C.unsigned_long;

   function Tk_CreateWindow
     (interp: in Tcl_Interp; parent: in Tk_Window; name: in String;
      screenName: in String) return Tk_Window;

   function Tk_CreateWindowFromPath
     (interp: in Tcl_Interp; tkwin: in Tk_Window; pathName: in String;
      screenName: in String) return Tk_Window;

   function Tk_DefineBitmap
     (interp: in Tcl_Interp; name: in String; source: in String;
      width: in C.int; height: in C.int) return C.int;

   function Tk_DeleteBinding
     (interp: in Tcl_Interp; bindingTable: in Tk_BindingTable;
      object: in ClientData; eventStr: in String) return C.int;

   procedure Tk_DeleteImage(interp: in Tcl_Interp; name: in String);

   function Tk_DisplayName(tkwin: in Tk_Window) return String;

   function Tk_FindPhoto
     (interp: in Tcl_Interp; imageName: in String) return Tk_PhotoHandle;

   function Tk_GetAnchor
     (interp: in Tcl_Interp; str: in String; anchorPtr: in Tk_Anchor) return C
     .int;

   function Tk_GetBinding
     (interp: in Tcl_Interp; bindingTable: in Tk_BindingTable;
      object: in ClientData; eventStr: in String) return String;

   function Tk_GetCapStyle
     (interp: in Tcl_Interp; str: in String; capPtr: access C.int) return C
     .int;

   function Tk_GetCursorFromData
     (interp: in Tcl_Interp; tkwin: in Tk_Window; source: in String;
      mask: in String; width: in C.int; height: in C.int; xHot: in C.int;
      yHot: in C.int; fg: in Tk_Uid; bg: in Tk_Uid) return Tk_Cursor;

   function Tk_GetFont
     (interp: in Tcl_Interp; tkwin: in Tk_Window; str: in String)
      return Tk_Font;

   function Tk_GetImage
     (interp: in Tcl_Interp; tkwin: in Tk_Window; name: in String;
      changeProc: in Tk_ImageChangedProc; data: in ClientData) return Tk_Image;

   function Tk_GetImageMasterData
     (interp: in Tcl_Interp; name: in String; typePtrPtr: in Tk_ImageType)
      return ClientData;

   function Tk_GetJoinStyle
     (interp: in Tcl_Interp; str: in String; joinPtr: access C.int) return C
     .int;

   function Tk_GetJustify
     (interp: in Tcl_Interp; str: in String; justifyPtr: in Tk_Justify)
      return C.int;

   function Tk_GetOption
     (tkwin: in Tk_Window; name: in String; className: in String)
      return Tk_Uid;

   function Tk_GetPixels
     (interp: in Tcl_Interp; tkwin: in Tk_Window; str: in String;
      intPtr: access C.int) return C.int;

   function Tk_GetRelief
     (interp: in Tcl_Interp; name: in String; reliefPtr: access C.int) return C
     .int;

   function Tk_GetScreenMM
     (interp: in Tcl_Interp; tkwin: in Tk_Window; str: in String;
      doublePtr: access C.double) return C.int;

   function Tk_GetUid(str: in String) return Tk_Uid;

   function Tk_MeasureChars
     (tkfont: in Tk_Font; source: in String; numBytes: in C.int;
      maxPixels: in C.int; flags: in C.int; lengthPtr: access C.int) return C
     .int;

   function Tk_NameOf3DBorder(border: in Tk_3DBorder) return String;

   function Tk_NameOfAnchor(anchor: in Tk_Anchor) return String;

   function Tk_NameOfCapStyle(cap: in C.int) return String;

   function Tk_NameOfFont(font: in Tk_Font) return String;

   function Tk_NameOfImage(imageMaster: in Tk_ImageMaster) return String;

   function Tk_NameOfJoinStyle(join: in C.int) return String;

   function Tk_NameOfJustify(justify: in Tk_Justify) return String;

   function Tk_NameOfRelief(relief: in C.int) return String;

   function Tk_NameToWindow
     (interp: in Tcl_Interp; pathName: in String; tkwin: in Tk_Window)
      return Tk_Window;

   function Tk_SetAppName(tkwin: in Tk_Window; name: in String) return String;

   procedure Tk_SetClass(tkwin: in Tk_Window; className: in String);

   function Tk_TextWidth
     (font: in Tk_Font; str: in String; numBytes: in C.int) return C.int;

   procedure Tk_FreeConfigOptions
     (recordPtr: in String; optionToken: in Tk_OptionTable;
      tkwin: in Tk_Window);

   function Tk_GetOptionInfo
     (interp: in Tcl_Interp; recordPtr: in String;
      optionTable: in Tk_OptionTable; namePtr: in Tcl_Obj; tkwin: in Tk_Window)
      return Tcl_Obj;

   function Tk_GetOptionValue
     (interp: in Tcl_Interp; recordPtr: in String;
      optionTable: in Tk_OptionTable; namePtr: in Tcl_Obj; tkwin: in Tk_Window)
      return Tcl_Obj;

   function Tk_InitOptions
     (interp: in Tcl_Interp; recordPtr: in String;
      optionToken: in Tk_OptionTable; tkwin: in Tk_Window) return C.int;

   function Tk_SetOptions
     (interp: in Tcl_Interp; recordPtr: in String;
      optionTable: in Tk_OptionTable; objc: in C.int; objv: in Tcl_Obj_Array;
      tkwin: in Tk_Window; savePtr: in Tk_SavedOptions; maskPtr: access C.int)
      return C.int;

   function Tk_GetDash
     (interp: in Tcl_Interp; value: in String; dash: in Tk_Dash) return C.int;

private

   Context: Tcl_Interp;

   procedure Tcl_Eval(Interp: in Tcl_Interp; Cmd: in String);

end Tcl.Tk.Ada;

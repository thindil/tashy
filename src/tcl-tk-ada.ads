--------------------------------------------------------------------
--
--  tcl-tk-ada.ads -- This package provides the "thick" binding to Tcl.Tk.
--
--  Copyright (c) 1995-2000 Terry J. Westley
--
--  Tash is free software; you can redistribute it and/or modify it under
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
--  Tash is maintained at http://tcladashell.sourceforge.net/.
--
--------------------------------------------------------------------

--------------------------------------------------------------------

with CArgv;

-- ****h* Tashy/Tcl.Tk.Ada
-- FUNCTION
-- This package provides the "thick" binding to Tcl.Tk.
-- SOURCE
package Tcl.Tk.Ada is
-- ****

   package C renames Interfaces.C;

   -- ****f* Tcl.Tk.Ada/Set_Trace
   -- FUNCTION
   -- Turn on tracing of Tcl/Tk command execution.
   -- SOURCE
   procedure Set_Trace(State: in Boolean);
   -- ****

   -- ****t* Tcl.Tk.Ada/Widget
   -- FUNCTION
   -- The Widget data type, parent of all objects displayed on the screen.
   --
   -- It is abstract because it is just a convenience for creating a Widget
   -- class and for creating non-abstract derived widget types.  Since there
   -- is no such data type in Tk, we make it abstract so that no instance of
   -- type Widget may be created.
   --
   -- SOURCE
   type Widget is abstract tagged private;
   -- ****

   ---------------------------------------------
   --
   --   Widget path name constructors
   --
   ---------------------------------------------

   -- ****f* Tcl.Tk.Ada/Widget_Image
   -- FUNCTION
   -- Returns the string name of Win.
   -- SOURCE
   function Widget_Image(Win: in Widget'Class) return String;
   -- ****

   -- ****f* Tcl.Tk.Ada/"&"
   -- FUNCTION
   -- Concatenates and returns the string names of Left and Right.
   -- Does not insert the separating dot.
   -- SOURCE
   function "&"(Left: in Widget'Class; Right: in Widget'Class) return String;
   function "&"(Left: in Widget'Class; Right: in String) return String;
   function "&"(Left: in String; Right: in Widget'Class) return String;
   -- ****

   pragma Inline(Widget_Image, "&");

   -- ****f* Tcl.Tk.Ada/Set_Context
   -- FUNCTION
   -- Sets the interpreter context for all Tk calls which do not include
   -- either an Interp or Widget parameter.
   -- SOURCE
   procedure Set_Context(Interp: in Tcl_Interp);
   -- ****

   -- ****f* Tcl.Tk.Ada/Get_Context
   -- FUNCTION
   -- Gets the current interpreter context.
   -- SOURCE
   function Get_Context return Tcl_Interp;
   -- ****

   -- ****f* Tcl.Tk.Ada/Get_Interp
   -- FUNCTION
   -- Gets the interpreter of the specified Widget.
   -- SOURCE
   function Get_Interp(Widgt: in Widget'Class) return Tcl_Interp;
   -- ****

   ---------------------------------------------
   --
   --   Widget constructors
   --
   ---------------------------------------------

   -- ****f* Tcl.Tk.Ada/Create1
   -- FUNCTION
   -- Creates a new widget in the "contextual" interpreter.  Options
   -- may be specified via the "options" parameter or the option
   -- database to configure the widget.
   -- SOURCE
   function Create
     (pathName: in String; options: in String := "") return Widget is abstract;
   procedure Create
     (Widgt: out Widget; pathName: in String;
      options: in String := "") is abstract;
   -- ****

   -- ****f* Tcl.Tk.Ada/Create2
   -- FUNCTION
   -- Creates a new widget in the specified interpreter.  Options
   -- may be specified via the "options" parameter or the option
   -- database to configure the widget.
   --
   -- SOURCE
   function Create
     (Interp: in Tcl_Interp; pathName: in String; options: in String := "")
      return Widget is abstract;
   procedure Create
     (Widgt: out Widget; Interp: in Tcl_Interp; pathName: in String;
      options: in String := "") is abstract;
   -- ****

   ---------------------------------------------
   --
   --   Widget destructor
   --
   ---------------------------------------------

   -- ****f* Tcl.Tk.Ada/Destroy
   -- FUNCTION
   -- Destroys a widget.
   -- SOURCE
   procedure Destroy(Widgt: in out Widget'Class);
   -- ****

   ---------------------------------------------
   --
   --   Widget configuration query and modify
   --
   ---------------------------------------------

   -- ****f* Tcl.Tk.Ada/cget
   -- FUNCTION
   --  Returns the current value of the specified configuration option.
   -- SOURCE
   function cget(Widgt: in Widget'Class; option: in String) return String;
   -- ****

   -- ****f* Tcl.Tk.Ada/configure
   -- FUNCTION
   -- Queries or modifies the configuration options.  If options is
   -- an empty string, returns a list of all available options
   -- for the widget.
   -- SOURCE
   function configure
     (Widgt: in Widget'Class; options: in String := "") return String;
   procedure configure(Widgt: in Widget'Class; options: in String := "");
   -- ****

   ---------------------------------------------
   --
   --   Bind associates a Tcl script with an
   --   event.  The script is executed when
   --   the event occurs.
   --
   ---------------------------------------------

   -- ****f* Tcl.Tk.Ada/Bind
   -- FUNCTION
   -- Associates Tcl script Script with the event Sequence.
   -- SOURCE
   procedure Bind
     (Widgt: in Widget'Class; Sequence: in String; Script: in String);
   -- ****

   -- ****f* Tcl.Tk.Ada/Unbind
   -- FUNCTION
   -- Disassociates the binding from the event Sequence.
   -- SOURCE
   procedure Unbind(Widgt: in Widget'Class; Sequence: in String);
   function Unbind(Widgt: in Widget'Class; Sequence: in String) return String;
   -- ****

   -- ****f* Tcl.Tk.Ada/Bind2
   -- FUNCTION
   -- Retained for backward compatibility.
   -- SOURCE
   procedure Bind(Widgt: in Widget'Class; Sequence: in String) renames Unbind;
   function Bind
     (Widgt: in Widget'Class; Sequence: in String) return String renames
     Unbind;
   -- ****

   -- ****f* Tcl.Tk.Ada/Bind_To_Main_Window
   -- FUNCTION
   -- Associates Tcl script Script with the event Sequence in the main window.
   -- SOURCE
   procedure Bind_To_Main_Window
     (Interp: in Tcl_Interp; Sequence: in String; Script: in String);
   -- ****

   -- ****f* Tcl.Tk.Ada/Unbind_From_Main_Window
   -- FUNCTION
   -- Disassociates the binding from the event Sequence in the main window.
   -- SOURCE
   procedure Unbind_From_Main_Window
     (Interp: in Tcl_Interp; Sequence: in String);
   function Unbind_From_Main_Window
     (Interp: in Tcl_Interp; Sequence: in String) return String;
   -- ****

   -- ****f* Tcl.Tk.Ada/Bind_To_Main_Window2
   -- FUNCTION
   -- Retained for backward compatibility.
   -- SOURCE
   procedure Bind_To_Main_Window
     (Interp: in Tcl_Interp; Sequence: in String) renames
     Unbind_From_Main_Window;
   function Bind_To_Main_Window
     (Interp: in Tcl_Interp; Sequence: in String) return String renames
     Unbind_From_Main_Window;
   -- ****

   ---------------------------------------------
   --
   --   Frame widget
   --
   --   This is a non-abstract type derived directly from Widget.
   --   Each of the derived widgets redefines the Create subprogram
   --   in order to create the correct type of widget.
   --
   ---------------------------------------------

   type Frame is new Widget with private;

   -- ****f* Tcl.Tk.Ada/CreateFrame
   -- FUNCTION
   -- Creates a new widget in the "contextual" interpreter and makes
   -- it into a frame widget.  Options may be specified via the "options"
   -- parameter or the option database to configure the widget.
   -- SOURCE
   function Create(pathName: in String; options: in String := "") return Frame;
   procedure Create
     (Widgt: out Frame; pathName: in String; options: in String := "");
   -- ****

   -- ****f* Tcl.Tk.Ada/CreateFrame2
   -- FUNCTION
   -- Creates a new widget in the specified interpreter and makes it
   -- into a frame widget.  Options may be specified via the "options"
   -- parameter or the option database to configure the widget.
   -- SOURCE
   function Create
     (Interp: in Tcl_Interp; pathName: in String; options: in String := "")
      return Frame;
   procedure Create
     (Widgt: out Frame; Interp: in Tcl_Interp; pathName: in String;
      options: in String := "");
   -- ****

   ---------------------------------------------
   --
   --   Toplevel widget
   --
   ---------------------------------------------

   type Toplevel is new Frame with private;

   -- ****f* Tcl.Tk.Ada/CreateTopLevel
   -- FUNCTION
   -- Creates a new widget in the "contextual" interpreter and makes it
   -- into a toplevel widget.  Options may be specified via the "options"
   -- parameter or the option database to configure the widget.
   -- SOURCE
   function Create
     (pathName: in String; options: in String := "") return Toplevel;
   procedure Create
     (Widgt: out Toplevel; pathName: in String; options: in String := "");
   -- ****

   -- ****f* Tcl.Tk.Ada/CreateTopLevel2
   -- FUNCTION
   -- Creates a new widget in the specified interpreter and makes it
   -- into a toplevel widget.  Options may be specified via the "options"
   -- parameter or the option database to configure the widget.
   -- SOURCE
   function Create
     (Interp: in Tcl_Interp; pathName: in String; options: in String := "")
      return Toplevel;
   procedure Create
     (Widgt: out Toplevel; Interp: in Tcl_Interp; pathName: in String;
      options: in String := "");
   -- ****

   ---------------------------------------------
   --
   --   Label widget
   --
   ---------------------------------------------

   type Label is new Frame with private;

   -- ****f* Tcl.Tk.Ada/CreateLabel
   -- FUNCTION
   -- Creates a new widget in the "contextual" interpreter and makes it
   -- into a label widget.  Options may be specified via the "options"
   -- parameter or the option database to configure the widget.
   -- SOURCE
   function Create(pathName: in String; options: in String := "") return Label;
   procedure Create
     (Widgt: out Label; pathName: in String; options: in String := "");
   -- ****

   -- ****f* Tcl.Tk.Ada/CreateLabel2
   -- FUNCTION
   -- Creates a new widget in the specified interpreter and makes it
   -- into a label widget.  Options may be specified via the "options"
   -- parameter or the option database to configure the widget.
   -- SOURCE
   function Create
     (Interp: in Tcl_Interp; pathName: in String; options: in String := "")
      return Label;
   procedure Create
     (Widgt: out Label; Interp: in Tcl_Interp; pathName: in String;
      options: in String := "");
   -- ****

   ---------------------------------------------
   --
   --   Message widget
   --
   ---------------------------------------------

   type Message is new Frame with private;

   -- ****f* Tcl.Tk.Ada/CreateMessage
   -- FUNCTION
   -- Creates a new widget in the "contextual" interpreter and makes it
   -- into a message widget.  Options may be specified via the "options"
   -- parameter or the option database to configure the widget.
   -- SOURCE
   function Create
     (pathName: in String; options: in String := "") return Message;
   procedure Create
     (Widgt: out Message; pathName: in String; options: in String := "");
   -- ****

   -- ****f* Tcl.Tk.Ada/CreateMessage2
   -- FUNCTION
   -- Creates a new widget in the specified interpreter and makes it
   -- into a message widget.  Options may be specified via the "options"
   -- parameter or the option database to configure the widget.
   -- SOURCE
   function Create
     (Interp: in Tcl_Interp; pathName: in String; options: in String := "")
      return Message;
   procedure Create
     (Widgt: out Message; Interp: in Tcl_Interp; pathName: in String;
      options: in String := "");
   -- ****

   ---------------------------------------------
   --
   --   Button widget
   --
   ---------------------------------------------

   type Button is new Frame with private;

   -- ****f* Tcl.Tk.Ada/CreateButton
   -- FUNCTION
   -- Creates a new widget in the "contextual" interpreter and makes it
   -- into a button widget.  Options may be specified via the "options"
   -- parameter or the option database to configure the widget.
   -- SOURCE
   function Create
     (pathName: in String; options: in String := "") return Button;
   procedure Create
     (Widgt: out Button; pathName: in String; options: in String := "");
   -- ****

   -- ****f* Tcl.Tk.Ada/CreateButton2
   -- FUNCTION
   -- Creates a new widget in the specified interpreter and makes it
   -- into a button widget.  Options may be specified via the "options"
   -- parameter or the option database to configure the widget.
   -- SOURCE
   function Create
     (Interp: in Tcl_Interp; pathName: in String; options: in String := "")
      return Button;
   procedure Create
     (Widgt: out Button; Interp: in Tcl_Interp; pathName: in String;
      options: in String := "");
   -- ****

   -- ****f* Tcl.Tk.Ada/Flash
   -- FUNCTION
   --  Flash the button.
   -- SOURCE
   procedure Flash(Buttn: in Button'Class);
   -- ****

   -- ****f* Tcl.Tk.Ada/Invoke
   -- FUNCTION
   --  Invoke the Tcl command associated with the button.
   -- SOURCE
   function Invoke
     (Buttn: in Button'Class; options: in String := "") return String;
   -- ****

   ---------------------------------------------
   --
   --   RadioButton widget
   --
   ---------------------------------------------

   type RadioButton is new Button with private;

   -- ****f* Tcl.Tk.Ada/CreateRadioButton
   -- FUNCTION
   -- Creates a new widget in the "contextual" interpreter and makes it
   -- into a radiobutton widget.  Options may be specified via the "options"
   -- parameter or the option database to configure the widget.
   -- SOURCE
   function Create
     (pathName: in String; options: in String := "") return RadioButton;
   procedure Create
     (Widgt: out RadioButton; pathName: in String; options: in String := "");
   -- ****

   -- ****f* Tcl.Tk.Ada/CreateRadioButton2
   -- FUNCTION
   -- Creates a new widget in the specified interpreter and makes it
   -- into a radiobutton widget.  Options may be specified via the "options"
   -- parameter or the option database to configure the widget.
   -- SOURCE
   function Create
     (Interp: in Tcl_Interp; pathName: in String; options: in String := "")
      return RadioButton;
   procedure Create
     (Widgt: out RadioButton; Interp: in Tcl_Interp; pathName: in String;
      options: in String := "");
   -- ****

   -- ****f* Tcl.Tk.Ada/Deselect
   -- FUNCTION
   -- Deselect the button.
   -- SOURCE
   procedure Deselect(Buttn: in RadioButton);
   -- ****

   -- ****f* Tcl.Tk.Ada/Tk_Select
   -- FUNCTION
   -- Select the button.
   -- SOURCE
   procedure Tk_Select(Buttn: in RadioButton);
   -- ****

   -- ****f* Tcl.Tk.Ada/Toggle
   -- FUNCTION
   -- Toggle the button.
   -- SOURCE
   procedure Toggle(Buttn: in RadioButton);
   -- ****

   ---------------------------------------------
   --
   --   CheckButton widget
   --
   ---------------------------------------------

   type CheckButton is new Button with private;

   -- ****f* Tcl.Tk.Ada/CreateCheckButton
   -- FUNCTION
   -- Creates a new widget in the "contextual" interpreter and makes it
   -- into a checkbutton widget.  Options may be specified via the "options"
   -- parameter or the option database to configure the widget.
   -- SOURCE
   function Create
     (pathName: in String; options: in String := "") return CheckButton;
   procedure Create
     (Widgt: out CheckButton; pathName: in String; options: in String := "");
   -- ****

   -- ****f* Tcl.Tk.Ada/CreateCheckButton2
   -- FUNCTION
   -- Creates a new widget in the specified interpreter and makes it
   -- into a checkbutton widget.  Options may be specified via the "options"
   -- parameter or the option database to configure the widget.
   -- SOURCE
   function Create
     (Interp: in Tcl_Interp; pathName: in String; options: in String := "")
      return CheckButton;
   procedure Create
     (Widgt: out CheckButton; Interp: in Tcl_Interp; pathName: in String;
      options: in String := "");
   -- ****

   -- ****f* Tcl.Tk.Ada/DeselectCheckButton
   -- FUNCTION
   -- Deselect the button.
   -- SOURCE
   procedure Deselect(Buttn: in CheckButton);
   -- ****

   -- ****f* Tcl.Tk.Ada/Tk_SelectCheckButton
   -- FUNCTION
   --  Select the button.
   -- SOURCE
   procedure Tk_Select(Buttn: in CheckButton);
   -- ****

   -- ****f* Tcl.Tk.Ada/ToggleCheckButton
   -- FUNCTION
   -- Toggle the button.
   -- SOURCE
   procedure Toggle(Buttn: in CheckButton);
   -- ****

   ---------------------------------------------
   --
   --   Entry widget
   --
   ---------------------------------------------

   type EntryWidget is new Frame with private;

   -- ****f* Tcl.Tk.Ada/CreateEntry
   -- FUNCTION
   -- Creates a new widget in the "contextual" interpreter and makes it
   -- into a entry widget.  Options may be specified via the "options"
   -- parameter or the option database to configure the widget.
   -- SOURCE
   function Create
     (pathName: in String; options: in String := "") return EntryWidget;
   procedure Create
     (Widgt: out EntryWidget; pathName: in String; options: in String := "");
   -- ****

   -- ****f* Tcl.Tk.Ada/CreateEntry2
   -- FUNCTION
   -- Creates a new widget in the specified interpreter and makes it
   -- into a entry widget.  Options may be specified via the "options"
   -- parameter or the option database to configure the widget.
   -- SOURCE
   function Create
     (Interp: in Tcl_Interp; pathName: in String; options: in String := "")
      return EntryWidget;
   procedure Create
     (Widgt: out EntryWidget; Interp: in Tcl_Interp; pathName: in String;
      options: in String := "");
   -- ****

   -- ****f* Tcl.Tk.Ada/get
   -- FUNCTION
   -- Returns the entry's string.
   -- SOURCE
   function get(Widgt: in EntryWidget) return String;
   -- ****

   ---------------------------------------------
   --
   --   After commands
   --
   --   These commands delay execution and schedule (and unschedule)
   --   future execution of Tcl commands.
   --
   ---------------------------------------------

   -- ****f* Tcl.Tk.Ada/After
   -- FUNCTION
   -- Sleeps for Ms milliseconds in the "contextual" interpreter.
   -- SOURCE
   procedure After(Ms: in Natural);
   -- ****

   -- ****f* Tcl.Tk.Ada/After2
   -- FUNCTION
   -- Sleeps for Ms milliseconds in the specified interpreter.
   -- SOURCE
   procedure After(Interp: in Tcl_Interp; Ms: in Natural);
   -- ****

   -- ****f* Tcl.Tk.Ada/After3
   -- FUNCTION
   -- Arranges for the Tcl Script to be executed after Ms milliseconds
   -- in the "contextual" interpreter.  The function returns an
   -- identifier suitable for canceling the command.
   -- SOURCE
   function After(Ms: in Natural; Script: in String) return String;
   procedure After(Ms: in Natural; Script: in String);
   -- ****

   -- ****f* Tcl.Tk.Ada/After4
   -- FUNCTION
   -- Arranges for the Tcl Script to be executed after Ms milliseconds
   -- in the specified interpreter.  The function returns an
   -- identifier suitable for canceling the command.
   -- SOURCE
   function After
     (Interp: in Tcl_Interp; Ms: in Natural; Script: in String) return String;
   procedure After(Interp: in Tcl_Interp; Ms: in Natural; Script: in String);
   -- ****

   -- ****f* Tcl.Tk.Ada/Cancel
   -- FUNCTION
   -- Cancels the execution of a delayed command in the "contextual"
   -- interpreter.
   -- SOURCE
   procedure Cancel(id_or_script: in String);
   -- ****

   -- ****f* Tcl.Tk.Ada/Cancel2
   -- FUNCTION
   -- Cancels the execution of a delayed command in the specified
   -- interpreter.
   -- SOURCE
   procedure Cancel(Interp: in Tcl_Interp; id_or_script: in String);
   -- ****

   -- ****f* Tcl.Tk.Ada/Idle
   -- FUNCTION
   -- Arranges for the Tcl Script to be executed later as an idle
   -- handler in the "contextual" interpreter.  The function returns
   -- an identifier suitable for canceling the command.
   -- SOURCE
   function Idle(Script: in String) return String;
   procedure Idle(Script: in String);
   -- ****

   -- ****f* Tcl.Tk.Ada/Idle2
   -- FUNCTION
   -- Arranges for the Tcl Script to be executed later as an idle
   -- handler in the specified interpreter.  The function returns
   -- an identifier suitable for canceling the command.
   -- SOURCE
   function Idle(Interp: in Tcl_Interp; Script: in String) return String;
   procedure Idle(Interp: in Tcl_Interp; Script: in String);
   -- ****

   -- ****f* Tcl.Tk.Ada/Info
   -- FUNCTION
   -- Returns information about existing event handlers in the
   -- "contextual" interpreter.
   -- SOURCE
   function Info(id: in String := "") return String;
   -- ****

   -- ****f* Tcl.Tk.Ada/Info2
   -- FUNCTION
   -- Returns information about existing event handlers in the
   -- "contextual" interpreter.
   -- SOURCE
   function Info(Interp: in Tcl_Interp; id: in String := "") return String;
   -- ****

   ---------------------------------------------
   --
   --   Pack commands
   --
   --   These commands provide for packing widgets within other
   --   widgets and therefore rendering them to the screen.
   --
   ---------------------------------------------

   procedure Pack(Slave: in Widget'Class; Options: in String);

   -- ****f* Tcl.Tk.Ada/Pack_Configure
   -- FUNCTION
   -- Tells the packer how to configure the specified Slave window.
   -- SOURCE
   procedure Pack_Configure(Slave: in Widget'Class; Options: in String);
   -- ****

   -- ****f* Tcl.Tk.Ada/Pack_Forget
   -- FUNCTION
   -- Removes the Slave window from the packing list for its master
   -- and unmaps their windows.
   -- SOURCE
   procedure Pack_Forget(Slave: in Widget'Class);
   -- ****

   -- ****f* Tcl.Tk.Ada/Pack_Info
   -- FUNCTION
   -- Returns a list whose elements are the current configuration
   -- state of the specified Slave window.
   -- SOURCE
   function Pack_Info(Slave: in Widget'Class) return String;
   -- ****

   -- ****f* Tcl.Tk.Ada/Pack_Propagate
   -- FUNCTION
   -- Enables or disables propagation for the specified Master window.
   -- SOURCE
   procedure Pack_Propagate(Master: in Widget'Class; State: in Boolean);
   -- ****

   -- ****f* Tcl.Tk.Ada/Pack_Propagate2
   -- FUNCTION
   -- Returns state of propagation in the specified Master window.
   -- SOURCE
   function Pack_Propagate(Master: in Widget'Class) return Boolean;
   -- ****

   -- ****f* Tcl.Tk.Ada/Pack_Slaves
   -- FUNCTION
   -- Returns a list of slaves in the packing order of the specified
   -- Master window.
   -- SOURCE
   function Pack_Slaves(Master: in Widget'Class) return String;
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

   type Widget is abstract tagged record
      Name: C.Strings.chars_ptr;
      Interp: Tcl_Interp;
   end record;

   Context: Tcl_Interp;

   procedure Execute_Widget_Command
     (Widgt: in Widget'Class; command: in String; options: in String := "");

   type Frame is new Widget with null record;
   type Toplevel is new Frame with null record;
   type Label is new Frame with null record;
   type Message is new Frame with null record;
   type Button is new Frame with null record;
   type RadioButton is new Button with null record;
   type CheckButton is new Button with null record;
   type EntryWidget is new Frame with null record;

end Tcl.Tk.Ada;

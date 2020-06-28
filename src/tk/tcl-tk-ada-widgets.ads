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

-- ****h* TkAda/Widgets
-- FUNCTION
-- Provides code for Tk widgets
-- SOURCE
package Tcl.Tk.Ada.Widgets is
-- ****

   -- ****t* Widgets/Tk_Widget
   -- FUNCTION
   -- The Tk_Widget data type, parent of all objects displayed on the screen.
   --
   -- It is abstract because it is just a convenience for creating a Tk_Widget
   -- class and for creating non-abstract derived widget types.  Since there
   -- is no such data type in Tk, we make it abstract so that no instance of
   -- type Tk_Widget may be created.
   -- PARAMETERS
   -- Name   - Name (Tk path) of the widget
   -- Interp - Tcl interpreter to which the widget is added
   -- SOURCE
   type Tk_Widget is abstract tagged record
      Name: C.Strings.chars_ptr;
      Interp: Tcl_Interp;
   end record;
   -- ****

   ---------------------------------------------
   --
   --   Tk_Widget path name constructors
   --
   ---------------------------------------------

   -- ****f* Widgets/Widget_Image
   -- FUNCTION
   -- Returns the string name of Win.
   -- PARAMETERS
   -- Win - Tk_Widget which name will be returned.
   -- RESULT
   -- String with name of Tk_Widget
   -- SOURCE
   function Widget_Image(Win: in Tk_Widget'Class) return String;
   -- ****

   -- ****f* Widgets/"&"
   -- FUNCTION
   -- Concatenates and returns the string names of Left and Right.
   -- Does not insert the separating dot.
   -- PARAMETERS
   -- Left  - First Tk_Widget or String to concatenate
   -- Right - Second Tk_Widget or String to concatenate
   -- RESULT
   -- String with concantenate name
   -- SOURCE
   function "&"
     (Left: in Tk_Widget'Class; Right: in Tk_Widget'Class) return String;
   function "&"(Left: in Tk_Widget'Class; Right: in String) return String;
   function "&"(Left: in String; Right: in Tk_Widget'Class) return String;
   -- ****

   pragma Inline(Widget_Image, "&");

   -- ****f* Widgets/Get_Interp
   -- FUNCTION
   -- Gets the interpreter of the specified Tk_Widget.
   -- PARAMETERS
   -- Widgt - Tk_Widget which belongs to Tcl interpreter
   -- RESULT
   -- Tcl interpreter of the specified Tk_Widget
   -- SOURCE
   function Get_Interp(Widgt: in Tk_Widget'Class) return Tcl_Interp;
   -- ****

   ---------------------------------------------
   --
   --   Tk_Widget constructors
   --
   ---------------------------------------------

   -- ****f* Widgets/Create (function)
   -- FUNCTION
   -- Creates a new Tk_Widget in the specified interpreter. This is abstract
   -- function. Its content depends on each child widget code.
   -- PARAMETERS
   -- pathName - Tk path (starts with dot) for the widget
   -- options  - Options which will be passed to the widget. Default value is
   --            empty
   -- Interp   - Tcl interpreter to which the widget will be created. If null,
   --            the widget will be created in the "contextual" interpreter.
   --            Default value is null.
   -- RESULT
   -- Newly created Tk_Widget
   -- SOURCE
   function Create
     (pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) return Tk_Widget is abstract;
   -- ****

   -- ****f* Widgets/Create (procedure)
   -- FUNCTION
   -- Creates a new Tk_Widget in the specified interpreter. This is abstract
   -- function. Its content depends on each child widget code.
   -- PARAMETERS
   -- Widgt    - Tk_Widget which will be created
   -- pathName - Tk path (starts with dot) for the widget
   -- options  - Options which will be passed to the widget. Default value is
   --            empty
   -- Interp   - Tcl interpreter to which the widget will be created. If null,
   --            the widget will be created in the "contextual" interpreter.
   --            Default value is null.
   -- SOURCE
   procedure Create
     (Widgt: out Tk_Widget; pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) is abstract;
   -- ****

   ---------------------------------------------
   --
   --   Tk_Widget destructor
   --
   ---------------------------------------------

   -- ****f* Widgets/Destroy
   -- FUNCTION
   -- Destroys a Tk_Widget.
   -- PARAMETERS
   -- Widgt - Tk_Widget to destroy
   -- SOURCE
   procedure Destroy(Widgt: in out Tk_Widget'Class);
   -- ****

   ---------------------------------------------
   --
   --   Tk_Widget configuration query and modify
   --
   ---------------------------------------------

   -- ****f* Widgets/cget
   -- FUNCTION
   -- Get the current value of the specified option for specified widget
   -- PARAMETERS
   -- Widgt  - Tk_Widget which option will be get
   -- option - Name of the option to get
   -- RESULT
   -- Returns the current value of the specified configuration option.
   -- SOURCE
   function cget(Widgt: in Tk_Widget'Class; option: in String) return String;
   -- ****

   -- ****f* Widgets/configure (function)
   -- FUNCTION
   -- Queries the configuration options.
   -- PARAMETERS
   -- Widgt   - Tk_Widget from which options will be queried or modified
   -- options - Options to query. If empty, return list of available
   --           options. Default is empty.
   -- RESULT
   -- String with Tcl information about finished action (for example, list
   -- of options).
   -- SOURCE
   function configure
     (Widgt: in Tk_Widget'Class; options: in String := "") return String;
   -- ****

   -- ****f* Widgets/configure (procedure)
   -- FUNCTION
   -- Queries or modifies the configuration options.
   -- PARAMETERS
   -- Widgt   - Tk_Widget from which options will be queried or modified
   -- options - Options to configure.
   -- SOURCE
   procedure configure(Widgt: in Tk_Widget'Class; options: in String) with
      Pre => options /= "";
      -- ****

      ---------------------------------------------
      --
      --   Bind associates a Tcl script with an
      --   event.  The script is executed when
      --   the event occurs.
      --
      ---------------------------------------------

      -- ****f* Widgets/Bind
      -- FUNCTION
      -- Associates Tcl script Script with the event Sequence.
      -- PARAMETERS
      -- Widgt    - Tk_Widget to which script will be binded
      -- Sequence - Name of Tk event which will be binded with the script
      -- Script   - Tcl code which will be binded to the Tk_Widget
      -- SOURCE
   procedure Bind
     (Widgt: in Tk_Widget'Class; Sequence: in String; Script: in String);
   -- ****

   -- ****f* Widgets/Unbind (procedure)
   -- FUNCTION
   -- Disassociates the binding from the event Sequence.
   -- PARAMETERS
   -- Widgt    - Tk_Widget from which selected event will be removed
   -- Sequence - Name of Tk event which will be removed from the widget
   -- SOURCE
   procedure Unbind(Widgt: in Tk_Widget'Class; Sequence: in String);
   -- ****

   -- ****f* Widgets/Unbind (function)
   -- FUNCTION
   -- Disassociates the binding from the event Sequence.
   -- PARAMETERS
   -- Widgt    - Tk_Widget from which selected event will be removed
   -- Sequence - Name of Tk event which will be removed from the widget
   -- RESULT
   -- String with Tcl information about finished action
   -- SOURCE
   function Unbind
     (Widgt: in Tk_Widget'Class; Sequence: in String) return String;
   -- ****

   -- ****f* Widgets/Focus (procedure)
   -- FUNCTION
   -- Set input focus on the selected Tk_Widget with the selected option
   -- PARAMETERS
   -- Widgt  - Tk_Widget to set as input focus
   -- Option - Set to "-force" to set input focus even if application don't
   --        have it. Default value is empty
   -- SOURCE
   procedure Focus(Widgt: in Tk_Widget'Class; Option: in String := "") with
      Pre => Option in "" | "-force";
      -- ****

      -- ****f* Widgets/Focus (function)
      -- FUNCTION
      -- Get input focus Tk widget name in the selected Tcl interpreter
      -- PARAMETERS
      -- Interp - Tcl interpreter in which input focus will be queried.
      --          Default value is current interpreter
      -- Option - Additional option for command.
      -- RESULT
      -- A name of a Tk widget which have input focus or empty string if
      -- no window in this application has focus (depending on the option)
      -- SOURCE
   function Focus
     (Interp: in Tcl_Interp := Get_Context; Option: in String := "")
      return String;
      -- ****

      -- ****f* Widgets/Focus_Follows_Mouse
      -- FUNCTION
      -- Set focus model to follow the mouse movement in the selected Tcl
      -- interpreter
      -- PARAMERERS
      -- Interp - Tcl interpreter in which the focus model will be set
      -- HISTORY
      -- 8.6.6 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   procedure Focus_Follows_Mouse(Interp: Tcl_Interp := Get_Context);
   -- ****

   -- ****f* Widgets/Focus_Next
   -- FUNCTION
   -- Get the next Widget in focus order after the selected Widget
   -- PARAMETERS
   -- Widgt - Tk Widget after which the next Widget will be get
   -- RESULT
   -- Name of the next Tk_Widget in focus order
   -- HISTORY
   -- 8.6.6 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   function Focus_Next(Widgt: in Tk_Widget'Class) return String;
   -- ****

   -- ****f* Widgets/Focus_Prev
   -- FUNCTION
   -- Get the previous Widget in focus order after the selected Widget
   -- PARAMETERS
   -- Widgt - Tk Widget before which the previous Widget will be get
   -- RESULT
   -- Name of the previous Tk_Widget in focus order
   -- HISTORY
   -- 8.6.6 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   function Focus_Prev(Widgt: in Tk_Widget'Class) return String;
   -- ****

   -- ****f* Widgets/Grab_Current (selected interpreter)
   -- FUNCTION
   -- Get the name of the currently set as grab window on the selected Tcl
   -- interpreter
   -- PARAMETERS
   -- Interp - Tcl interpreter which will be queried for the grab window. Can
   --          be empty. Default value is current interpreter
   -- RESULT
   -- Name of the gra window in the selected Tcl interpreter or {} if no window
   -- is set as grab window
   -- HISTORY
   -- 8.6.6 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   function Grab_Current(Interp: Tcl_Interp := Get_Context) return String;
   -- ****

   -- ****f* Widgets/Grab_Current (selected window)
   -- FUNCTION
   -- Get the name of the currently set as grab window on the display where the
   -- selected window is
   -- PARAMETERS
   -- Widgt - Tk_Widget which display will be queried for the grab window
   -- RESULT
   -- Name of the gra window in the selected display or {} if no window is set
   -- as grab window
   -- HISTORY
   -- 8.6.6 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   function Grab_Current(Widgt: in Tk_Widget'Class) return String;
   -- ****

   -- ****f* Widgets/Lower
   -- FUNCTION
   -- Lowers the selected Tk_Widget below of all its siblings in the stacking
   -- order
   -- PARAMETERS
   -- Widgt - Tk_Widget to lower
   -- HISTORY
   -- 8.6.4 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   procedure Lower(Widgt: in Tk_Widget'Class);
   -- ****

   -- ****f* Widgets/Lower (below selected widget)
   -- FUNCTION
   -- Insert the Tk_Widget below the selected widget in the stacking order
   -- PARAMETERS
   -- Widgt     - Tk_Widget to lower
   -- BelowThis - Tk_Widget before which Widgt will be inserted
   -- HISTORY
   -- 8.6.4 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   procedure Lower(Widgt, BelowThis: in Tk_Widget'Class);
   -- ****

   -- ****f* Widgets/Raise
   -- FUNCTION
   -- Raisess the selected Tk_Widget below of all its siblings in the stacking
   -- order
   -- PARAMETERS
   -- Widgt - Tk_Widget to raise
   -- HISTORY
   -- 8.6.4 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   procedure Widget_Raise(Widgt: in Tk_Widget'Class);
   -- ****

   -- ****f* Widgets/Raise (above selected widget)
   -- FUNCTION
   -- Insert the Tk_Widget above the selected widget in the stacking order
   -- PARAMETERS
   -- Widgt     - Tk_Widget to insert
   -- AboveThis - Tk_Widget above which Widgt will be inserted
   -- HISTORY
   -- 8.6.4 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   procedure Widget_Raise(Widgt, AboveThis: in Tk_Widget'Class);
   -- ****

   -- ****f* Widgets/Tk_Wait
   -- FUNCTION
   -- Wait until the selected thing to happen
   -- PARAMETERS
   -- WaitFor - "variable" - the selected variable was modified, "visibility"
   --           the selected window visibility state was changed, "window" the
   --           selected window was destroyed
   -- Name    - Name of variable or window on which Tk_Wait should waits
   -- SOURCE
   procedure Tk_Wait(WaitFor, Name: in String) with
      Pre => WaitFor in "variable" | "visibility" | "window" and Name /= "";
      -- ****

   -- ****f* Widgets/Execute_Widget_Command
   -- FUNCTION
   -- Execute selected Tcl command in the selected widget. Generally, you
   -- should not use this procedure outside library, unless here are no
   -- direct binding for selected Tk widget command.
   -- Widgt   - Tk_Widget in which command will be executed
   -- command - Tcl command to execute
   -- options - Options for the selected Tcl command
   -- SOURCE
   procedure Execute_Widget_Command
     (Widgt: in Tk_Widget'Class; command: in String; options: in String := "");
   -- ****

end Tcl.Tk.Ada.Widgets;

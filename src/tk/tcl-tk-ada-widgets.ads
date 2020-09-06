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
   -- HISTORY
   -- 8.6.0 - Imported from TASH
   -- TODO
   -- Replace it with higher level of binding
   -- EXAMPLE
   -- -- Get the name of widget My_Widget
   -- Name: constant String := Widget_Image(My_Widget);
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
   -- HISTORY
   -- 8.6.0 - Imported from TASH
   -- TODO
   -- Replace it with higher level of binding
   -- EXAMPLE
   -- -- Create name for a new widget from My_Widget name and .subwindow
   -- New_Name: constant String := My_Widget & ".subwindow";
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
   -- HISTORY
   -- 8.6.0 - Imported from TASH
   -- TODO
   -- Replace it with higher level of binding
   -- EXAMPLE
   -- -- Get the interpreter of My_Widget widget
   -- Interp: constant Tcl_Interp := Get_Interp(My_Widget);
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
   -- HISTORY
   -- 8.6.0 - Imported from TASH
   -- TODO
   -- Replace it with higher level of binding
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
   -- HISTORY
   -- 8.6.0 - Imported from TASH
   -- TODO
   -- Replace it with higher level of binding
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
      -- HISTORY
      -- 8.6.0 - Imported from TASH
      -- TODO
      -- Replace it with higher level of binding
      -- EXAMPLE
      -- -- Destroy My_Widget widget
      -- Destroy(My_Widget);
      -- COMMANDS
      -- destroy Widgt
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
   -- HISTORY
   -- 8.6.0 - Imported from TASH
   -- TODO
   -- Replace it with higher level of binding
   -- EXAMPLE
   -- -- Get the text of My_Label widget
   -- Text: constant String := cget(My_Label, "-text");
   -- COMMANDS
   -- Widgt cget option
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
   -- HISTORY
   -- 8.6.0 - Imported from TASH
   -- TODO
   -- Replace it with higher level of binding
   -- EXAMPLE
   -- -- Get the all available options of the My_Label widget
   -- Options: constant String := configure(My_Label);
   -- COMMANDS
   -- Widgt configure ?options?
   -- SEE ALSO
   -- cget, configure (procedure)
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
     -- HISTORY
     -- 8.6.0 - Imported from TASH
     -- TODO
     -- Replace it with higher level of binding
     -- EXAMPLE
     -- -- Configure text to hello world on My_Label widget
     -- configure(My_Label, "-text {hello world}");
     -- COMMANDS
     -- Widgt configure options
     -- SEE ALSO
     -- cget, configure (function)
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

      -- ****f* Widgets/Bind (procedure)
      -- FUNCTION
      -- Associates Tcl script Script with the event Sequence.
      -- PARAMETERS
      -- Widgt    - Tk_Widget to which script will be binded
      -- Sequence - Name of Tk event which will be binded with the script
      -- Script   - Tcl code which will be binded to the Tk_Widget
      -- HISTORY
      -- 8.6.0 - Imported from TASH
      -- TODO
      -- Replace it with higher level of binding
      -- EXAMPLE
      -- -- Exit from the program on press CTRL-q in My_Window widget
      -- Bind(My_Window, "<Control-q>", "exit");
      -- COMMANDS
      -- bind Widgt sequence script
      -- SEE ALSO
      -- Bind (function)
      -- SOURCE
   procedure Bind
     (Widgt: in Tk_Widget'Class; Sequence: in String; Script: in String);
   -- ****

   -- ****f* Widgets/Bind (function)
   -- FUNCTION
   -- Get the associated Tcl script Script with the event Sequence.
   -- PARAMETERS
   -- Widgt    - Tk_Widget to which script will be binded
   -- Sequence - Name of Tk event which the script will be get
   -- RESULT
   -- Script which is associated with the selected event or {} if no script
   -- is binded to that event.
   -- HISTORY
   -- 8.6.8 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- EXAMPLE
   -- -- Get the script associated with left click in My_Window widget
   -- Script: constant String := Bind(My_Window, "<1>");
   -- COMMANDS
   -- bind Widgt sequence
   -- SEE ALSO
   -- Bind (procedure)
   -- SOURCE
   function Bind(Widgt: in Tk_Widget'Class; Sequence: in String) return String;
   -- ****

   -- ****f* Widgets/Bind_Tags (procedure)
   -- FUNCTION
   -- Set binding tags for the selected window
   -- PARAMETERS
   -- Widgt   - Tk_Widget which binding tags will be changed
   -- TagList - The new list of binding tags for the selected window
   -- HISTORY
   -- 8.6.7 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- EXAMPLE
   -- -- Determine order of bindings for My_Button button as itself (name .button) then all
   -- Bind_Tags(My_Button, "{.button all}");
   -- COMMANDS
   -- bindtags Widgt taglist
   -- SEE ALSO
   -- Bind_Tags (function)
   -- SOURCE
   procedure Bind_Tags(Widgt: in Tk_Widget'Class; TagList: in String) with
      Pre => TagList /= "";
      -- ****

      -- ****f* Widgets/Bind_Tags (function)
      -- FUNCTION
      -- Get binding tags for the selected window
      -- PARAMETERS
      -- Widgt   - Tk_Widget which binding tags will be queried
      -- RESULT
      -- List of binding tags associated with the selected window
      -- HISTORY
      -- 8.6.7 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- EXAMPLE
      -- -- Get the order and tags themself for the My_Button widget
      -- Tags_Info: constant String := Bind_Tags(My_Button)
      -- COMMANDS
      -- bindtags Widgt
      -- SEE ALSO
      -- Bind_Tags (procedure)
      -- SOURCE
   function Bind_Tags(Widgt: in Tk_Widget'Class) return String;
   -- ****

   -- ****f* Widgets/Unbind (procedure)
   -- FUNCTION
   -- Disassociates the binding from the event Sequence.
   -- PARAMETERS
   -- Widgt    - Tk_Widget from which selected event will be removed
   -- Sequence - Name of Tk event which will be removed from the widget
   -- HISTORY
   -- 8.6.0 - Imported from TASH
   -- TODO
   -- Replace it with higher level of binding
   -- EXAMPLE
   -- -- Remove left click binding for My_Window widget
   -- Unbind(My_Window, "<1>");
   -- COMMANDS
   -- bind Widgt sequence {}
   -- SEE ALSO
   -- Unbind (function)
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
   -- HISTORY
   -- 8.6.0 - Imported from TASH
   -- TODO
   -- Replace it with higher level of binding
   -- EXAMPLE
   -- -- Remove Control-q binding from My_Frame widget and get info about finished action
   -- Result: constant String := Unbind(My_Frame, "<Control-q>");
   -- COMMANDS
   -- bind Widgt sequence {}
   -- SEE ALSO
   -- Unbind (procedure)
   -- SOURCE
   function Unbind
     (Widgt: in Tk_Widget'Class; Sequence: in String) return String;
     -- ****

     -- ****f* Widgets/Bell
     -- FUNCTION
     -- Rings the bell on the selected Widget display
     -- PARAMETERS
     -- Widgt  - Tk_Widget on which display bell will be rings
     -- Option - Can be empty or "-nice". Default is empty. If is empty then
     --          also reset screen saver state.
     -- HISTORY
     -- 8.6.7 - Added
     -- TODO
     -- Replace it with higher level of binding
     -- EXAMPLE
     -- -- Ring the bell for the widget My_Window display
     -- Bell(My_Window);
     -- COMMANDS
     -- bell -displayof Widgt option
     -- SOURCE
   procedure Bell(Widgt: in Tk_Widget'Class; Option: in String := "") with
      Pre => Option in "" | "-nice";
      -- ****

      -- ****f* Widgets/Focus (procedure)
      -- FUNCTION
      -- Set input focus on the selected Tk_Widget with the selected option
      -- PARAMETERS
      -- Widgt  - Tk_Widget to set as input focus
      -- Option - Set to "-force" to set input focus even if application don't
      --        have it. Default value is empty
      -- HISTORY
      -- 8.6.3 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- EXAMPLE
      -- -- Set the input focus on My_Entry widget
      -- Focus(My_Entry);
      -- COMMANDS
      -- focus Widgt
      -- SEE ALSO
      -- Focus (function)
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
      -- HISTORY
      -- 8.6.3 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- EXAMPLE
      -- -- Get the name of the currently focused widget on the default Tcl interpreter
      -- Focused_Name: constant String := Focus;
      -- COMMANDS
      -- focus
      -- SEE ALSO
      -- Focus (procedure)
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
      -- EXAMPLE
      -- -- Set the focus model to follow the mouse on the default Tcl interpreter
      -- Focus_Follows_Mouse;
      -- COMMANDS
      -- tk_focusFollowsMouse
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
   -- EXAMPLE
   -- -- Get the name of the next widget in focus traversal order after My_Window widget
   -- Widget_Name: constant String := Focus_Next(My_Window);
   -- COMMANDS
   -- tk_focusNext Widgt
   -- SEE ALSO
   -- Focus_Prev
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
   -- EXAMPLE
   -- -- Get the name of the previous widget in focus traversal order before My_Button widget
   -- Widget_Name: constant String := Focus_Prev(My_Button);
   -- COMMANDS
   -- tk_focusPrev Widgt
   -- SEE ALSO
   -- Focus_Next
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
   -- EXAMPLE
   -- -- Get the name of currently set as grab window widget on default Tcl interpreter
   -- Widget_Name: constant String := Grab_Current;
   -- COMMANDS
   -- grab current
   -- SEE ALSO
   -- Grab_Current (selected window)
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
   -- EXAMPLE
   -- Get the name of currently set as grab window widget on display where My_Label is
   -- Widget_Name: constant String := Grab_Current(My_Label);
   -- COMMANDS
   -- grab current Widgt
   -- SEE ALSO
   -- Grab_Current (selected interpreter)
   -- SOURCE
   function Grab_Current(Widgt: in Tk_Widget'Class) return String;
   -- ****

   -- ****f* Widgets/Grab_Release
   -- FUNCTION
   -- Release the grab on the selected Widget
   -- PARAMETERS
   -- Widgt - Tk_Widget on which the grab will be released
   -- HISTORY
   -- 8.6.6 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- EXAMPLE
   -- -- Release the grab from My_Window widget
   -- Grab_Release(My_Window);
   -- COMMANDS
   -- grab release Widgt
   -- SOURCE
   procedure Grab_Release(Widgt: in Tk_Widget'Class);
   -- ****

   -- ****f* Widgets/Grab_Set
   -- FUNCTION
   -- Set the grab to the selected widget
   -- PARAMETERS
   -- Widgt  - Tk_Widget on which the grab will be set
   -- Global - If empty, the grab is local, when "-global" then the grab is
   --          global. Default value is empty
   -- HISTORY
   -- 8.6.6 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- EXAMPLE
   -- -- Set the grab to the My_Entry widget
   -- Grab_Set(My_Entry);
   -- COMMANDS
   -- grab set global Widgt
   -- SOURCE
   procedure Grab_Set(Widgt: in Tk_Widget'Class; Global: in String := "") with
      Pre => Global in "" | "-global";
      -- ****

      -- ****f* Widgets/Grab_Status
      -- FUNCTION
      -- Get the status of the grab for the selected widget
      -- PARAMETERS
      -- Widgt - Tk_Widget which will be queried for the grab status
      -- RESULT
      -- "none" if no grab on the selected widget, "local" if the grab is
      -- local and "global" if the grab is global
      -- HISTORY
      -- 8.6.6 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- EXAMPLE
      -- -- Get the status of the grab for My_Window widget
      -- Status: constant String := Grab_Status(My_Window);
      -- COMMANDS
      -- grab status Widgt
      -- SOURCE
   function Grab_Status(Widgt: in Tk_Widget'Class) return String;
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
   -- EXAMPLE
   -- -- Move the My_Window widget at the end of stacking order
   -- Lower(My_Window);
   -- COMMANDS
   -- lower Widgt
   -- SEE ALSO
   -- Lower (below selected widget)
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
   -- EXAMPLE
   -- -- Move My_Window widget after My_Dialog widget in the stacking order
   -- Lower(My_Window, My_Dialog);
   -- COMMANDS
   -- lower Widgt BelowThis
   -- SEE ALSO
   -- Lower
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
   -- EXAMPLE
   -- -- Raise My_Window widget at top of the stacking order
   -- Widget_Raise(My_Window);
   -- COMMANDS
   -- raise Widgt
   -- SEE ALSO
   -- Raise (above selected widget)
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
   -- EXAMPLE
   -- -- Raise My_Window widget above My_Dialog widget in the stacking order
   -- Widget_Raise(My_Window, My_Dialog);
   -- COMMANDS
   -- raise Widgt AboveThis
   -- SEE ALSO
   -- Raise
   -- SOURCE
   procedure Widget_Raise(Widgt, AboveThis: in Tk_Widget'Class);
   -- ****

   -- ****f* Widgets/Tk_Caret (procedure)
   -- FUNCTION
   -- Set the caret location in the selected window
   -- PARAMETERS
   -- Widgt  - Tk_Widget in which the caret will be set
   -- X      - The new X coordinate of the caret
   -- Y      - The new Y coordinate of the caret
   -- Height - The height of current cursor location
   -- HISTORY
   -- 8.6.7 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- EXAMPLE
   -- -- Set the caret to point (24, 56) and height 54 in My_Text widget
   -- Tk_Caret(My_Text, "24", "56", "54");
   -- COMMANDS
   -- tk caret Widgt x y height
   -- SEE ALSO
   -- Tk_Caret (function)
   -- SOURCE
   procedure Tk_Caret(Widgt: in Tk_Widget'Class; X, Y, Height: in String) with
      Pre => X /= "" and Y /= "" and Height /= "";
      -- ****

      -- ****f* Widgets/Tk_Caret
      -- FUNCTION
      -- Get the caret location in the selected window
      -- PARAMETERS
      -- Widgt  - Tk_Widget in which the caret will be get
      -- RESULT
      -- String with 3 values: X coordinate of the carret, Y coordinate of the
      -- caret and height of the Widgt
      -- HISTORY
      -- 8.6.7 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- EXAMPLE
      -- -- Get the coordinates of the caret in My_Window widget
      -- Coordinates: constant String := Tk_Caret(My_Window);
      -- COMMANDS
      -- tk caret Widgt
      -- SEE ALSO
      -- Tk_Caret (procedure)
      -- SOURCE
   function Tk_Caret(Widgt: in Tk_Widget'Class) return String;
   -- ****

   -- ****f* Widgets/Tk_Inactive (procedure)
   -- FUNCTION
   -- Reset the user inactivity timer
   -- PARAMETERS
   -- Widgt - Tk_Widget on which display inactivity timer will be reseted
   -- HISTORY
   -- 8.6.7 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- EXAMPLE
   -- -- Reset the user inactivity timer for My_Window widget
   -- Tk_Inactive(My_Window);
   -- COMMANDS
   -- tk inactive -displayof Widgt reset
   -- SEE ALSO
   -- Tk_Inactive (function)
   -- SOURCE
   procedure Tk_Inactive(Widgt: in Tk_Widget'Class);
   -- ****

   -- ****f* Widgets/Tk_Inactive (function)
   -- FUNCTION
   -- Get the number of miliseconds since last interaction of the user on the
   -- selected display
   -- PARAMETERS
   -- Widgt - Tk_Widget on which display inactivity timer will be get
   -- RESULT
   -- Number of miliseconds since last interaction of the user
   -- HISTORY
   -- 8.6.7 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- EXAMPLE
   -- -- Get the inactivity time for My_Entry widget
   -- Inactive_For: constant String := Tk_Inactive(My_Entry);
   -- COMMANDS
   -- tk inactive -displayof Widgt
   -- SEE ALSO
   -- Tk_Inactive (procedure)
   -- SOURCE
   function Tk_Inactive(Widgt: in Tk_Widget'Class) return String;
   -- ****

   -- ****f* Widgets/Tk_Scaling (procedure)
   -- FUNCTION
   -- Set the scaling factor for the selected display
   -- PARAMETERS
   -- Widgt  - Tk_Widget on which display the scaling factor will be set
   -- Number - Floating point number which specifies the number of pixels per
   --          point of Widgt display
   -- HISTORY
   -- 8.6.7 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   procedure Tk_Scaling(Widgt: in Tk_Widget'Class; Number: in String) with
      Pre => Number /= "";
      -- ****

      -- ****f* Widgets/Tk_Scaling
      -- FUNCTION
      -- Get the scaling factor of the selected display
      -- PARAMETERS
      -- Widgt  - Tk_Widget on which display the scaling factor will be get
      -- RESULT
      -- Floating point number which specifies the number of pixels per point
      -- of Widgt display
      -- HISTORY
      -- 8.6.7 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Tk_Scaling(Widgt: in Tk_Widget'Class) return String;
   -- ****

   -- ****f* Widgets/Tk_Use_Input_Methods (procedure)
   -- FUNCTION
   -- Set Tk to use XIM (X Input Methods) for filtering events
   -- PARAMETERS
   -- Widgt   - Tk_Widget on which display the filtering will be set
   -- Enabled - If "1" then enable filtering, when "0" disable it
   -- HISTORY
   -- 8.6.7 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   procedure Tk_Use_Input_Methods
     (Widgt: in Tk_Widget'Class; Enabled: in String) with
      Pre => Enabled in "1" | "0";
      -- ****

      -- ****f* Widgets/Tk_Use_Input_Methods (function)
      -- FUNCTION
      -- Get if Tk uses XIM (X Input Methods) for filtering events
      -- PARAMETERS
      -- Widgt   - Tk_Widget on which display the filtering will be get
      -- RESULT
      -- "1" if Tk uses XIM otherwise "0"
      -- HISTORY
      -- 8.6.7 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Tk_Use_Input_Methods(Widgt: in Tk_Widget'Class) return String;
   -- ****

   -- ****f* Widgets/Tk_Wait
   -- FUNCTION
   -- Wait until the selected thing to happen
   -- PARAMETERS
   -- WaitFor - "variable" - the selected variable was modified, "visibility"
   --           the selected window visibility state was changed, "window" the
   --           selected window was destroyed
   -- Name    - Name of variable or window on which Tk_Wait should waits
   -- HISTORY
   -- 8.6.6 - Added
   -- TODO
   -- Replace it with higher level of binding
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
   -- HISTORY
   -- 8.6.0 - Imported from TASH
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   procedure Execute_Widget_Command
     (Widgt: in Tk_Widget'Class; command: in String; options: in String := "");
   -- ****

end Tcl.Tk.Ada.Widgets;

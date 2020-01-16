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

   -- ****f* Widgets/Create
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
   -- RESULT
   -- Newly created Tk_Widget
   -- SOURCE
   function Create
     (pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) return Tk_Widget is abstract;
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

   -- ****f* Widgets/configure
   -- FUNCTION
   -- Queries or modifies the configuration options.
   -- PARAMETERS
   -- Widgt   - Tk_Widget from which options will be queried or modified
   -- options - Options to configure. If empty, return list of available
   --           options. Default is empty.
   -- RESULT
   -- String with Tcl information about finished action (for example, list
   -- of options).
   -- SOURCE
   function configure
     (Widgt: in Tk_Widget'Class; options: in String := "") return String;
   procedure configure(Widgt: in Tk_Widget'Class; options: in String := "");
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

   -- ****f* Widgets/Unbind
   -- FUNCTION
   -- Disassociates the binding from the event Sequence.
   -- PARAMETERS
   -- Widgt    - Tk_Widget from which selected event will be removed
   -- Sequence - Name of Tk event which will be removed from the widget
   -- RESULT
   -- String with Tcl information about finished action
   -- SOURCE
   procedure Unbind(Widgt: in Tk_Widget'Class; Sequence: in String);
   function Unbind
     (Widgt: in Tk_Widget'Class; Sequence: in String) return String;
   -- ****

   ---------------------------------------------
   --
   --   Pack commands
   --
   --   These commands provide for packing widgets within other
   --   widgets and therefore rendering them to the screen.
   --
   ---------------------------------------------

   -- ****f* Widgets/Pack
   -- FUNCTION
   -- Pack selected widget with selected options
   -- PARAMETERS
   -- Slave   - Tk_Widget to pack
   -- Options - Option to pack action
   -- SOURCE
   procedure Pack(Slave: in Tk_Widget'Class; Options: in String);
   -- ****

   -- ****f* Widgets/Pack_Configure
   -- FUNCTION
   -- Tells the packer how to configure the specified Slave window.
   -- PARAMETERS
   -- Slave   - Tk_Widget to configure
   -- Options - Pack options for the slave
   -- SOURCE
   procedure Pack_Configure(Slave: in Tk_Widget'Class; Options: in String);
   -- ****

   -- ****f* Widgets/Pack_Forget
   -- FUNCTION
   -- Removes the Slave window from the packing list for its master
   -- and unmaps their windows.
   -- PARAMETERS
   -- Slave - Tk_Widget to remove
   -- SOURCE
   procedure Pack_Forget(Slave: in Tk_Widget'Class);
   -- ****

   -- ****f* Widgets/Pack_Info
   -- FUNCTION
   -- Get pack options of the selected widget
   -- PARAMETERS
   -- Slave - Tk_Widget to query
   -- RESULT
   -- String with list whose elements are the current configuration
   -- state of the specified Slave window.
   -- SOURCE
   function Pack_Info(Slave: in Tk_Widget'Class) return String;
   -- ****

   -- ****f* Widgets/Pack_Propagate
   -- FUNCTION
   -- Enables or disables propagation for the specified Master window.
   -- PARAMETERS
   -- Master - Tk_Widget which propagation will be set
   -- State  - If true, enable propagation, false disable it
   -- SOURCE
   procedure Pack_Propagate(Master: in Tk_Widget'Class; State: in Boolean);
   -- ****

   -- ****f* Widgets/Pack_Propagate2
   -- FUNCTION
   -- Get propagation state of selected widget
   -- PARAMETERS
   -- Master - Tk_Widget which propagation state will be check
   -- RESULT
   -- Returns state of propagation in the specified Master window.
   -- SOURCE
   function Pack_Propagate(Master: in Tk_Widget'Class) return Boolean;
   -- ****

   -- ****f* Widgets/Pack_Slaves
   -- FUNCTION
   -- Get list of slaves widget of selected widget
   -- PARAMETERS
   -- Master - Tk_Widget which will be queried for slaves
   -- RESULT
   -- Returns a list of slaves in the packing order of the specified
   -- Master window.
   -- SOURCE
   function Pack_Slaves(Master: in Tk_Widget'Class) return String;
   -- ****

private

-- ****f* Widgets/Execute_Widget_Command
-- FUNCTION
-- Execute selected Tcl command in the selected widget. Private.
-- Widgt   - Tk_Widget in which command will be executed
-- command - Tcl command to execute
-- options - Options for the selected Tcl command
-- SOURCE
   procedure Execute_Widget_Command
     (Widgt: in Tk_Widget'Class; command: in String; options: in String := "");
-- ****

end Tcl.Tk.Ada.Widgets;

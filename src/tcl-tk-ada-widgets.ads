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

-- ****h* Tashy/Tcl.Tk.Ada.Widgets
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
   --
   -- SOURCE
   type Tk_Widget is abstract tagged private;
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

   -- ****f* Widgets/Create1
   -- FUNCTION
   -- Creates a new Tk_Widget in the "contextual" interpreter.  Options
   -- may be specified via the "options" parameter or the option
   -- database to configure the Tk_Widget.
   -- SOURCE
   function Create
     (pathName: in String; options: in String := "")
      return Tk_Widget is abstract;
   procedure Create
     (Widgt: out Tk_Widget; pathName: in String;
      options: in String := "") is abstract;
   -- ****

   -- ****f* Widgets/Create2
   -- FUNCTION
   -- Creates a new Tk_Widget in the specified interpreter.  Options
   -- may be specified via the "options" parameter or the option
   -- database to configure the Tk_Widget.
   --
   -- SOURCE
   function Create
     (Interp: in Tcl_Interp; pathName: in String; options: in String := "")
      return Tk_Widget is abstract;
   procedure Create
     (Widgt: out Tk_Widget; Interp: in Tcl_Interp; pathName: in String;
      options: in String := "") is abstract;
   -- ****

   ---------------------------------------------
   --
   --   Tk_Widget destructor
   --
   ---------------------------------------------

   -- ****f* Widgets/Destroy
   -- FUNCTION
   -- Destroys a Tk_Widget.
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
   --  Returns the current value of the specified configuration option.
   -- SOURCE
   function cget(Widgt: in Tk_Widget'Class; option: in String) return String;
   -- ****

   -- ****f* Widgets/configure
   -- FUNCTION
   -- Queries or modifies the configuration options.  If options is
   -- an empty string, returns a list of all available options
   -- for the Tk_Widget.
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
   -- SOURCE
   procedure Bind
     (Widgt: in Tk_Widget'Class; Sequence: in String; Script: in String);
   -- ****

   -- ****f* Widgets/Unbind
   -- FUNCTION
   -- Disassociates the binding from the event Sequence.
   -- SOURCE
   procedure Unbind(Widgt: in Tk_Widget'Class; Sequence: in String);
   function Unbind
     (Widgt: in Tk_Widget'Class; Sequence: in String) return String;
   -- ****

   -- ****f* Widgets/Bind_To_Main_Window
   -- FUNCTION
   -- Associates Tcl script Script with the event Sequence in the main window.
   -- SOURCE
   procedure Bind_To_Main_Window
     (Interp: in Tcl_Interp; Sequence: in String; Script: in String);
   -- ****

   -- ****f* Widgets/Unbind_From_Main_Window
   -- FUNCTION
   -- Disassociates the binding from the event Sequence in the main window.
   -- SOURCE
   procedure Unbind_From_Main_Window
     (Interp: in Tcl_Interp; Sequence: in String);
   function Unbind_From_Main_Window
     (Interp: in Tcl_Interp; Sequence: in String) return String;
   -- ****

   -- ****f* Widgets/Wm_Set
   -- FUNCTION
   -- Communicate with the window manager
   -- PARAMETERS
   -- Tk_Widget   - Tk_Widget which will be modified
   -- Action   - WM action to do
   -- Options  - Options for selected action. Default is empty
   -- SOURCE
   procedure Wm_Set
     (Widgt: in Tk_Widget'Class; Action: in String; Options: in String := "");
   -- ****

   ---------------------------------------------
   --
   --   Menu widget
   --
   ---------------------------------------------

   type Menu is new Tk_Widget with private;

   -- ****f* Widgets/CreateMenu
   -- FUNCTION
   -- Creates a new widget in the "contextual" interpreter and makes it
   -- into a menu widget.  Options may be specified via the "options"
   -- parameter or the option database to configure the widget.
   -- SOURCE
   function Create(pathName: in String; options: in String := "") return Menu;
   procedure Create
     (Widgt: out Menu; pathName: in String; options: in String := "");
   -- ****

   -- ****f* Widgets/CreateMenu2
   -- FUNCTION
   -- Creates a new widget in the specified interpreter and makes it
   -- into a menu widget.  Options may be specified via the "options"
   -- parameter or the option database to configure the widget.
   -- SOURCE
   function Create
     (Interp: in Tcl_Interp; pathName: in String; options: in String := "")
      return Menu;
   procedure Create
     (Widgt: out Menu; Interp: in Tcl_Interp; pathName: in String;
      options: in String := "");
   -- ****

   -- ****f* Widgets/AddMenu
   -- FUNCTION
   --  Add element to the menu.
   -- SOURCE
   procedure Add
     (MenuWidget: in Menu'Class; WidgetType: in String;
      Options: in String := "");
   -- ****

   ---------------------------------------------
   --
   --   Ttk::Button widget
   --
   ---------------------------------------------

   type Ttk_Button is new Tk_Widget with private;

   -- ****f* Widgets/CreateTtkButton
   -- FUNCTION
   -- Creates a new widget in the "contextual" interpreter and makes it
   -- into a ttk::button widget.  Options may be specified via the "options"
   -- parameter or the option database to configure the widget.
   -- SOURCE
   function Create
     (pathName: in String; options: in String := "") return Ttk_Button;
   procedure Create
     (Widgt: out Ttk_Button; pathName: in String; options: in String := "");
   -- ****

   -- ****f* Widgets/CreateTtkButton2
   -- FUNCTION
   -- Creates a new widget in the specified interpreter and makes it
   -- into a ttk::button widget.  Options may be specified via the "options"
   -- parameter or the option database to configure the widget.
   -- SOURCE
   function Create
     (Interp: in Tcl_Interp; pathName: in String; options: in String := "")
      return Ttk_Button;
   procedure Create
     (Widgt: out Ttk_Button; Interp: in Tcl_Interp; pathName: in String;
      options: in String := "");
   -- ****

   ---------------------------------------------
   --
   --   Pack commands
   --
   --   These commands provide for packing widgets within other
   --   widgets and therefore rendering them to the screen.
   --
   ---------------------------------------------

   procedure Pack(Slave: in Tk_Widget'Class; Options: in String);

   -- ****f* Widgets/Pack_Configure
   -- FUNCTION
   -- Tells the packer how to configure the specified Slave window.
   -- SOURCE
   procedure Pack_Configure(Slave: in Tk_Widget'Class; Options: in String);
   -- ****

   -- ****f* Widgets/Pack_Forget
   -- FUNCTION
   -- Removes the Slave window from the packing list for its master
   -- and unmaps their windows.
   -- SOURCE
   procedure Pack_Forget(Slave: in Tk_Widget'Class);
   -- ****

   -- ****f* Widgets/Pack_Info
   -- FUNCTION
   -- Returns a list whose elements are the current configuration
   -- state of the specified Slave window.
   -- SOURCE
   function Pack_Info(Slave: in Tk_Widget'Class) return String;
   -- ****

   -- ****f* Widgets/Pack_Propagate
   -- FUNCTION
   -- Enables or disables propagation for the specified Master window.
   -- SOURCE
   procedure Pack_Propagate(Master: in Tk_Widget'Class; State: in Boolean);
   -- ****

   -- ****f* Widgets/Pack_Propagate2
   -- FUNCTION
   -- Returns state of propagation in the specified Master window.
   -- SOURCE
   function Pack_Propagate(Master: in Tk_Widget'Class) return Boolean;
   -- ****

   -- ****f* Widgets/Pack_Slaves
   -- FUNCTION
   -- Returns a list of slaves in the packing order of the specified
   -- Master window.
   -- SOURCE
   function Pack_Slaves(Master: in Tk_Widget'Class) return String;
   -- ****

private

   type Tk_Widget is abstract tagged record
      Name: C.Strings.chars_ptr;
      Interp: Tcl_Interp;
   end record;

   procedure Execute_Widget_Command
     (Widgt: in Tk_Widget'Class; command: in String; options: in String := "");

   type Menu is new Tk_Widget with null record;
   type Ttk_Button is new Tk_Widget with null record;

end Tcl.Tk.Ada.Widgets;

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

-- ****h* Tashy/Button
-- FUNCTION
-- Provides code for manipulate Tk widget Button
-- SOURCE
package Tcl.Tk.Ada.Widgets.Button is
-- ****

   ---------------------------------------------
   --
   --   Button widget
   --
   ---------------------------------------------

   type Tk_Button is new Tk_Widget with private;

   -- ****f* Button/Create
   -- FUNCTION
   -- Creates a new widget in the "contextual" interpreter and makes it
   -- into a button widget.  Options may be specified via the "options"
   -- parameter or the option database to configure the widget.
   -- SOURCE
   function Create
     (pathName: in String; options: in String := "") return Tk_Button;
   procedure Create
     (Widgt: out Tk_Button; pathName: in String; options: in String := "");
   -- ****

   -- ****f* Button/Create2
   -- FUNCTION
   -- Creates a new widget in the specified interpreter and makes it
   -- into a button widget.  Options may be specified via the "options"
   -- parameter or the option database to configure the widget.
   -- SOURCE
   function Create
     (Interp: in Tcl_Interp; pathName: in String; options: in String := "")
      return Tk_Button;
   procedure Create
     (Widgt: out Tk_Button; Interp: in Tcl_Interp; pathName: in String;
      options: in String := "");
   -- ****

   -- ****f* Button/Flash
   -- FUNCTION
   -- Flash the button.
   -- SOURCE
   procedure Flash(Buttn: in Tk_Button'Class);
   -- ****

   -- ****f* Button/Invoke
   -- FUNCTION
   -- Invoke the Tcl command associated with the button.
   -- SOURCE
   function Invoke
     (Buttn: in Tk_Button'Class; options: in String := "") return String;
   -- ****

   ---------------------------------------------
   --
   --   CheckButton widget
   --
   ---------------------------------------------

   type CheckButton is new Tk_Button with private;

   -- ****f* Widgets/CreateCheckButton
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

   -- ****f* Widgets/CreateCheckButton2
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

   -- ****f* Widgets/DeselectCheckButton
   -- FUNCTION
   -- Deselect the button.
   -- SOURCE
   procedure Deselect(Buttn: in CheckButton);
   -- ****

   -- ****f* Widgets/Tk_SelectCheckButton
   -- FUNCTION
   --  Select the button.
   -- SOURCE
   procedure Tk_Select(Buttn: in CheckButton);
   -- ****

   -- ****f* Widgets/ToggleCheckButton
   -- FUNCTION
   -- Toggle the button.
   -- SOURCE
   procedure Toggle(Buttn: in CheckButton);
   -- ****

private

   type Tk_Button is new Tk_Widget with null record;
   type CheckButton is new Tk_Button with null record;

end Tcl.Tk.Ada.Widgets.Button;

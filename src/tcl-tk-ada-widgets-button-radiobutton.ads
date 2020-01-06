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

package Tcl.Tk.Ada.Widgets.Button.RadioButton is

   type Tk_RadioButton is new Tk_Button with private;

   -- ****f* RadioButton/Create
   -- FUNCTION
   -- Creates a new widget in the "contextual" interpreter and makes it
   -- into a radiobutton widget.  Options may be specified via the "options"
   -- parameter or the option database to configure the widget.
   -- SOURCE
   function Create
     (pathName: in String; options: in String := "") return Tk_RadioButton;
   procedure Create
     (Widgt: out Tk_RadioButton; pathName: in String;
      options: in String := "");
   -- ****

   -- ****f* RadioButton/Create2
   -- FUNCTION
   -- Creates a new widget in the specified interpreter and makes it
   -- into a radiobutton widget.  Options may be specified via the "options"
   -- parameter or the option database to configure the widget.
   -- SOURCE
   function Create
     (Interp: in Tcl_Interp; pathName: in String; options: in String := "")
      return Tk_RadioButton;
   procedure Create
     (Widgt: out Tk_RadioButton; Interp: in Tcl_Interp; pathName: in String;
      options: in String := "");
   -- ****

   -- ****f* RadioButton/Deselect
   -- FUNCTION
   -- Deselect the button.
   -- SOURCE
   procedure Deselect(Buttn: in Tk_RadioButton);
   -- ****

   -- ****f* RadioButton/Tk_Select
   -- FUNCTION
   -- Select the button.
   -- SOURCE
   procedure Tk_Select(Buttn: in Tk_RadioButton);
   -- ****

   -- ****f* RadioButton/Toggle
   -- FUNCTION
   -- Toggle the button.
   -- SOURCE
   procedure Toggle(Buttn: in Tk_RadioButton);
   -- ****

private

   type Tk_RadioButton is new Tk_Button with null record;

end Tcl.Tk.Ada.Widgets.Button.RadioButton;

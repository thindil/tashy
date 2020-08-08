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

with Tcl.Tk.Ada.Widgets; use Tcl.Tk.Ada.Widgets;

-- ****h* TkAda/TkPlace
-- FUNCTION
-- Provides code for manipulate Tk command Place
-- SOURCE
package Tcl.Tk.Ada.Place is
-- ****

   -- ****f* TkPlace/Place
   -- FUNCTION
   -- Place selected widget with selected options
   -- PARAMETERS
   -- Slave   - Tk_Widget to place
   -- Options - Option to place action
   -- HISTORY
   -- 8.6.4 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- EXAMPLE
   -- -- Add My_Entry widget at point (12, 32)
   -- Place.Place(My_Entry, "-x 12 -y 32");
   -- COMMANDS
   -- place slave ?options?
   -- SOURCE
   procedure Place(Slave: in Tk_Widget'Class; Options: in String := "");
   -- ****

   -- ****f* TkPlace/Place_Configure
   -- FUNCTION
   -- Tells the packer how to configure the specified Slave window.
   -- PARAMETERS
   -- Slave   - Tk_Widget to configure
   -- Options - Place options for the slave
   -- HISTORY
   -- 8.6.4 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- EXAMPLE
   -- -- Set My_Label widget width to 20 pixels
   -- Place_Configure(My_Label, "-width 20");
   -- COMMANDS
   -- place configure slave ?options?
   -- SOURCE
   procedure Place_Configure
     (Slave: in Tk_Widget'Class; Options: in String := "");
   -- ****

   -- ****f* TkPlace/Place_Forget
   -- FUNCTION
   -- Removes the Slave window from the packing list for its master
   -- and unmaps their windows.
   -- PARAMETERS
   -- Slave - Tk_Widget to remove
   -- HISTORY
   -- 8.6.4 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- EXAMPLE
   -- -- Remove (hide) My_Label widget from UI
   -- Place_Forget(My_Label);
   -- COMMANDS
   -- place forget slave
   -- SOURCE
   procedure Place_Forget(Slave: in Tk_Widget'Class);
   -- ****

   -- ****f* TkPlace/Place_Info
   -- FUNCTION
   -- Get place options of the selected widget
   -- PARAMETERS
   -- Slave - Tk_Widget to query
   -- RESULT
   -- String with list whose elements are the current configuration
   -- state of the specified Slave window.
   -- HISTORY
   -- 8.6.4 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- EXAMPLE
   -- -- Get the place configuration of the My_Label widget
   -- Place_Options: constant String := Place_Info(My_Label);
   -- COMMANDS
   -- place info slave
   -- SOURCE
   function Place_Info(Slave: in Tk_Widget'Class) return String;
   -- ****

   -- ****f* TkPlace/Place_Slaves
   -- FUNCTION
   -- Get list of slaves widget of selected widget
   -- PARAMETERS
   -- Master - Tk_Widget which will be queried for slaves
   -- RESULT
   -- Returns a list of slaves in the packing order of the specified
   -- Master window.
   -- HISTORY
   -- 8.6.4 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   function Place_Slaves(Master: in Tk_Widget'Class) return String;
   -- ****

end Tcl.Tk.Ada.Place;

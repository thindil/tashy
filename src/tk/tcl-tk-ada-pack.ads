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

-- ****h* TkAda/Pack
-- FUNCTION
-- Provides code for manipulate Tk command Pack
-- SOURCE
package Tcl.Tk.Ada.Pack is
-- ****

   -- ****f* Pack/Pack
   -- FUNCTION
   -- Pack selected widget with selected options
   -- PARAMETERS
   -- Slave   - Tk_Widget to pack
   -- Options - Option to pack action
   -- SOURCE
   procedure Pack(Slave: in Tk_Widget'Class; Options: in String);
   -- ****

   -- ****f* Pack/Pack_Configure
   -- FUNCTION
   -- Tells the packer how to configure the specified Slave window.
   -- PARAMETERS
   -- Slave   - Tk_Widget to configure
   -- Options - Pack options for the slave
   -- SOURCE
   procedure Pack_Configure(Slave: in Tk_Widget'Class; Options: in String);
   -- ****

   -- ****f* Pack/Pack_Forget
   -- FUNCTION
   -- Removes the Slave window from the packing list for its master
   -- and unmaps their windows.
   -- PARAMETERS
   -- Slave - Tk_Widget to remove
   -- SOURCE
   procedure Pack_Forget(Slave: in Tk_Widget'Class);
   -- ****

   -- ****f* Pack/Pack_Info
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

   -- ****f* Pack/Pack_Propagate
   -- FUNCTION
   -- Enables or disables propagation for the specified Master window.
   -- PARAMETERS
   -- Master - Tk_Widget which propagation will be set
   -- State  - If true, enable propagation, false disable it
   -- SOURCE
   procedure Pack_Propagate(Master: in Tk_Widget'Class; State: in Boolean);
   -- ****

   -- ****f* Pack/Pack_Propagate2
   -- FUNCTION
   -- Get propagation state of selected widget
   -- PARAMETERS
   -- Master - Tk_Widget which propagation state will be check
   -- RESULT
   -- Returns state of propagation in the specified Master window.
   -- SOURCE
   function Pack_Propagate(Master: in Tk_Widget'Class) return Boolean;
   -- ****

   -- ****f* Pack/Pack_Slaves
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

end Tcl.Tk.Ada.Pack;

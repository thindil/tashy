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

-- ****h* TkAda/TkPack
-- FUNCTION
-- Provides code for manipulate Tk command Pack
-- SOURCE
package Tcl.Tk.Ada.Pack is
-- ****

   -- ****f* TkPack/Pack
   -- FUNCTION
   -- Pack selected widget with selected options
   -- PARAMETERS
   -- Slave   - Tk_Widget to pack
   -- Options - Option to pack action
   -- HISTORY
   -- 8.6.1 - Moved from Tcl.Tk.Ada.Widgets
   -- TODO
   -- Replace it with higher level of binding
   -- EXAMPLE
   -- -- Add My_Entry widget and strech it in all directions
   -- Pack.Pack(My_Entry, "-fill both");
   -- COMMANDS
   -- pack slave ?options?
   -- SOURCE
   procedure Pack(Slave: in Tk_Widget'Class; Options: in String := "");
   -- ****

   -- ****f* TkPack/Pack_Configure
   -- FUNCTION
   -- Tells the packer how to configure the specified Slave window.
   -- PARAMETERS
   -- Slave   - Tk_Widget to configure
   -- Options - Pack options for the slave
   -- HISTORY
   -- 8.6.1 - Moved from Tcl.Tk.Ada.Widgets
   -- TODO
   -- Replace it with higher level of binding
   -- EXAMPLE
   -- -- Put My_Label widget after .mytext widget
   -- Pack_Configure(My_Label, "-after .mytext");
   -- COMMANDS
   -- pack configure slave ?options?
   -- SOURCE
   procedure Pack_Configure
     (Slave: in Tk_Widget'Class; Options: in String := "");
   -- ****

   -- ****f* TkPack/Pack_Forget
   -- FUNCTION
   -- Removes the Slave window from the packing list for its master
   -- and unmaps their windows.
   -- PARAMETERS
   -- Slave - Tk_Widget to remove
   -- HISTORY
   -- 8.6.1 - Moved from Tcl.Tk.Ada.Widgets
   -- TODO
   -- Replace it with higher level of binding
   -- EXAMPLE
   -- -- Remove (hide) My_Label widget from UI
   -- Pack_Forget(My_Label);
   -- COMMANDS
   -- pack forget slave
   -- SOURCE
   procedure Pack_Forget(Slave: in Tk_Widget'Class);
   -- ****

   -- ****f* TkPack/Pack_Info
   -- FUNCTION
   -- Get pack options of the selected widget
   -- PARAMETERS
   -- Slave - Tk_Widget to query
   -- RESULT
   -- String with list whose elements are the current configuration
   -- state of the specified Slave window.
   -- HISTORY
   -- 8.6.1 - Moved from Tcl.Tk.Ada.Widgets
   -- TODO
   -- Replace it with higher level of binding
   -- EXAMPLE
   -- -- Get the pack configuration of the My_Label widget
   -- Pack_Options: constant String := Pack_Info(My_Label);
   -- COMMANDS
   -- pack info slave
   -- SOURCE
   function Pack_Info(Slave: in Tk_Widget'Class) return String;
   -- ****

   -- ****f* TkPack/Pack_Propagate (procedure)
   -- FUNCTION
   -- Enables or disables propagation for the specified Master window.
   -- PARAMETERS
   -- Master - Tk_Widget which propagation will be set
   -- State  - If true, enable propagation, false disable it
   -- HISTORY
   -- 8.6.1 - Moved from Tcl.Tk.Ada.Widgets
   -- TODO
   -- Replace it with higher level of binding
   -- EXAMPLE
   -- -- Enable propagation on My_Main_Window pack
   -- Pack_Propagate(My_Main_Window, "true");
   -- COMMANDS
   -- pack propagate master boolean
   -- SOURCE
   procedure Pack_Propagate(Master: in Tk_Widget'Class; State: in Boolean);
   -- ****

   -- ****f* TkPack/Pack_Propagate (function)
   -- FUNCTION
   -- Get propagation state of selected widget
   -- PARAMETERS
   -- Master - Tk_Widget which propagation state will be check
   -- RESULT
   -- Returns state of propagation in the specified Master window.
   -- HISTORY
   -- 8.6.1 - Moved from Tcl.Tk.Ada.Widgets
   -- TODO
   -- Replace it with higher level of binding
   -- EXAMPLE
   -- -- Get the propagation state of the My_Main_Window pack
   -- Propagation: constant String := Pack_Propagate(My_Main_Window);
   -- COMMANDS
   -- pack propagate master
   -- SOURCE
   function Pack_Propagate(Master: in Tk_Widget'Class) return Boolean;
   -- ****

   -- ****f* TkPack/Pack_Slaves
   -- FUNCTION
   -- Get list of slaves widget of selected widget
   -- PARAMETERS
   -- Master - Tk_Widget which will be queried for slaves
   -- RESULT
   -- Returns a list of slaves in the packing order of the specified
   -- Master window.
   -- HISTORY
   -- 8.6.1 - Moved from Tcl.Tk.Ada.Widgets
   -- TODO
   -- Replace it with higher level of binding
   -- EXAMPLE
   -- -- Get the list of slaves for the My_Main_Window pack
   -- Slaves: constant String := Pack_Slaves(My_Main_Window)
   -- COMMANDS
   -- pack slaves master
   -- SOURCE
   function Pack_Slaves(Master: in Tk_Widget'Class) return String;
   -- ****

end Tcl.Tk.Ada.Pack;

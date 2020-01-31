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

-- ****h* TkAda/Grid
-- FUNCTION
-- Provides code for manipulate Tk command Grid
-- SOURCE
package Tcl.Tk.Ada.Grid is
-- ****

   -- ****f* Grid/Grid
   -- FUNCTION
   -- Add to the selected widget with selected options to grid
   -- PARAMETERS
   -- Slave   - Tk_Widget to add
   -- Options - Option to grid action. Default value is empty
   -- SOURCE
   procedure Grid(Slave: in Tk_Widget'Class; Options: in String := "");
   -- ****

   -- ****f* Grid/Grid_Configure
   -- FUNCTION
   -- Tells the grid how to configure the specified Slave window.
   -- PARAMETERS
   -- Slave   - Tk_Widget to configure
   -- Options - Grid options for the slave
   -- SOURCE
   procedure Grid_Configure
     (Slave: in Tk_Widget'Class; Options: in String := "");
   -- ****

   -- ****f* Grid/Grid_Forget
   -- FUNCTION
   -- Removes the Slave window from the grid list for its master
   -- and unmaps their windows.
   -- PARAMETERS
   -- Slave - Tk_Widget to remove
   -- SOURCE
   procedure Grid_Forget(Slave: in Tk_Widget'Class);
   -- ****

   -- ****f* Grid/Grid_Info
   -- FUNCTION
   -- Get grid options of the selected widget
   -- PARAMETERS
   -- Slave - Tk_Widget to query
   -- RESULT
   -- String with list whose elements are the current configuration
   -- state of the specified Slave window.
   -- SOURCE
   function Grid_Info(Slave: in Tk_Widget'Class) return String;
   -- ****

   -- ****f* Grid/Row_Configure
   -- FUNCTION
   -- Set row configuration options for Slave widget in Master grid.
   -- PARAMETERS
   -- Master  - Tk_Widget which is set as grid
   -- Slave   - Tk_Widget inside Master
   -- Options - Tk options for selected Slave
   -- SOURCE
   procedure Row_Configure
     (Master, Slave: in Tk_Widget'Class; Options: in String) with
      Pre => Options /= "";
      -- ****

      -- ****f* Grid/Row_Configure2
      -- FUNCTION
      -- Get row configuration options for Slave widget in Master grid.
      -- PARAMETERS
      -- Master  - Tk_Widget which is set as grid
      -- Slave   - Tk_Widget inside Master
      -- RESULT
      -- String with row configuration options for selected Slave widget
      -- SOURCE
   function Row_Configure(Master, Slave: in Tk_Widget'Class) return String;
   -- ****

   -- ****f* Grid/Column_Configure
   -- FUNCTION
   -- Set column configuration options for Slave widget in Master grid.
   -- PARAMETERS
   -- Master  - Tk_Widget which is set as grid
   -- Slave   - Tk_Widget inside Master
   -- Options - Tk options for selected Slave
   -- SOURCE
   procedure Column_Configure
     (Master, Slave: in Tk_Widget'Class; Options: in String) with
      Pre => Options /= "";
      -- ****

      -- ****f* Grid/Column_Configure2
      -- FUNCTION
      -- Get column configuration options for Slave widget in Master grid.
      -- PARAMETERS
      -- Master  - Tk_Widget which is set as grid
      -- Slave   - Tk_Widget inside Master
      -- RESULT
      -- String with column configuration options for selected Slave widget
      -- SOURCE
   function Column_Configure(Master, Slave: in Tk_Widget'Class) return String;
   -- ****

end Tcl.Tk.Ada.Grid;

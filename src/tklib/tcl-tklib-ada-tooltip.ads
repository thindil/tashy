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

-- ****h* TklibAda/Tooltip
-- FUNCTION
-- Provides code for manipulate Tklib tooltip package
-- SOURCE
package Tcl.Tklib.Ada.Tooltip is
-- ****

   -- ****f* Tooltip/Tooltip_Init
   -- FUNCTION
   -- Load package Tooltip. Raise Program_Error if package can't be loaded
   -- PARAMETERS
   -- Interp: Tcl interpreter to which tooltip package will be added
   -- HISTORY
   -- 8.6.1 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   procedure Tooltip_Init(Interp: in Tcl_Interp);
   -- ****

   -- ****f* Tooltip/Add
   -- FUNCTION
   -- Add the tooltip to selected Tk_Widget
   -- PARAMETERS
   -- Widget  - Tk_Widget to which the tooltip will be added
   -- Message - Text which will be show in the tooltip
   -- Options - Additional tooltip options
   -- HISTORY
   -- 8.6.1 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   procedure Add
     (Widget: in Tk_Widget'Class; Message: in String;
      Options: in String := "") with
      Pre => Message /= "";
      -- ****

end Tcl.Tklib.Ada.Tooltip;

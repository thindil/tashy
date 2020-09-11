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

with Tcl.Tk.Ada; use Tcl.Tk.Ada;
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
   -- EXAMPLE
   -- -- Init tooltip package on My_Interp Tcl interpreter
   -- Tooltip_Init(My_Interp);
   -- COMMANDS
   -- package require tooltip
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
   -- EXAMPLE
   -- -- Add tooltip with text my tooltip text to the My_Label widget
   -- Add(My_Label, "my tooltip text");
   -- COMMANDS
   -- ::tooltip::tooltip Widget ?options? message
   -- SOURCE
   procedure Add
     (Widget: in Tk_Widget'Class; Message: in String;
      Options: in String := "") with
      Pre => Message /= "";
      -- ****

      -- ****f* Tooltip/Clear
      -- FUNCTION
      -- Prevent the selected widgets from showing tooltips
      -- PARAMETERS
      -- Pattern - Tk glob pattern for widgets which should not showing
      --           tooltips
      -- Interp  - Tcl interpreter on which widgets will be set. Default value
      --           is current interpreter
      -- HISTORY
      -- 8.6.7 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- EXAMPLE
      -- -- Prevent to show tooltip to all widgets which name starts from .mylabel on current interpreter
      -- Clear("^.mylabel");
      -- COMMANDS
      -- :tooltip::tooltip clear pattern
      -- SOURCE
   procedure Clear
     (Pattern: in String; Interp: in Tcl_Interp := Get_Context) with
      Pre => Pattern /= "";
      -- ****

      -- ****f* Tooltip/Tooltip_Delay (procedure)
      -- FUNCTION
      -- Set delay between show tooltip and moment when the pointer enters a
      -- widget
      -- PARAMETERS
      -- Milisecs  - A new value for delay (in miliseconds)
      -- Interp    - Tcl interpreter on which tooltip delay will be set
      -- HISTORY
      -- 8.6.7 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- EXAMPLE
      -- -- Set the tooltips delay to 2 seconds on current Tcl interpreter
      -- Tooltip_Delay("2000");
      -- COMMANDS
      -- :tooltip::tooltip delay milisecs
      -- SEE ALSO
      -- Tooltip_Delay (function)
      -- SOURCE
   procedure Tooltip_Delay
     (Milisecs: in String; Interp: in Tcl_Interp := Get_Context) with
      Pre => Milisecs /= "";
      -- ****

      -- ****f* Tooltip/Tooltip_Delay (function)
      -- FUNCTION
      -- Get the delay between show tooltip and moment when the pointer enters
      -- a widget
      -- PARAMETERS
      -- Interp    - Tcl interpreter on which tooltip delay will be get
      -- RESULT
      -- The miliseconds difference between entering the pointer a widget and
      -- showing tooltip
      -- HISTORY
      -- 8.6.7 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Tooltip_Delay(Interp: in Tcl_Interp := Get_Context) return String;
   -- ****

   -- ****f* Tooltip/Disable
   -- FUNCTION
   -- Disable all tooptips on the selected Tcl interpreter
   -- PARAMETERS
   -- Interp - Tcl interpreter on which tooltips will be disabled. Default
   --          value is current interpreter
   -- HISTORY
   -- 8.6.7 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   procedure Disable(Interp: in Tcl_Interp := Get_Context);
   procedure Off(Interp: in Tcl_Interp := Get_Context) renames Disable;
   -- ****

   -- ****f* Tooltip/Enable
   -- FUNCTION
   -- Enable all tooptips on the selected Tcl interpreter
   -- PARAMETERS
   -- Interp - Tcl interpreter on which tooltips will be enabled. Default
   --          value is current interpreter
   -- HISTORY
   -- 8.6.7 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   procedure Enable(Interp: in Tcl_Interp := Get_Context);
   procedure On(Interp: in Tcl_Interp := Get_Context) renames Enable;
   -- ****

   -- ****f* Tooltip/Fade
   -- FUNCTION
   -- Enable of disable fading of tooltips
   -- PARAMETERS
   -- Enable - If true, enable fading, if false disable it
   -- Interp - Tcl interpreter on which fading will be set
   -- SOURCE
   procedure Fade(Enable: in String; Interp: in Tcl_Interp := Get_Context) with
      Pre => Enable in "true" | "false";
      -- ****

end Tcl.Tklib.Ada.Tooltip;

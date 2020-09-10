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

-- ****h* TklibAda/Autoscroll
-- FUNCTION
-- Provides code for manipulate Tklib autoscroll package
-- SOURCE
package Tcl.Tklib.Ada.Autoscroll is
-- ****

   -- ****f* Autoscroll/Autoscroll_Init
   -- FUNCTION
   -- Load package autoscroll. Raise Program_Error if package can't be loaded
   -- PARAMETERS
   -- Interp - Tcl interpreter to which autoscroll package will be added
   -- HISTORY
   -- 8.6.7 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- EXAMPLE
   -- -- Init autoscroll package on My_Interp Tcl interpreter
   -- Autoscroll_Init(My_Interp);
   -- COMMANDS
   -- package require autoscroll
   -- SOURCE
   procedure Autoscroll_Init(Interp: in Tcl_Interp);
   -- ****

   -- ****f* Autoscroll/Autoscroll
   -- FUNCTION
   -- Set autohide for the selected scroll
   -- PARAMETERS
   -- Scroll - Tk_Widget which will be arranged for autohiding
   -- HISTORY
   -- 8.6.7 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- EXAMPLE
   -- -- Set autohide for scrollbar My_Scroll
   -- Autoscroll(My_Scroll);
   -- COMMANDS
   -- :autoscroll::autoscroll scroll
   -- SOURCE
   procedure Autoscroll(Scroll: in Tk_Widget'Class);
   -- ****

   -- ****f* Autoscroll/Wrap
   -- FUNCTION
   -- Arranges for all scrollbars created after to be automatically mapped and
   -- unmapped as needed.
   -- PARAMETERS
   -- Interp - Tcl interpreter on which scrollbars will be arranged
   -- HISTORY
   -- 8.6.7 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- EXAMPLE
   -- -- Set autohide for all scrollbars on My_Interp Tcl interpreter
   -- Wrap(My_Interp);
   -- COMMANDS
   -- ::autoscroll::wrap
   -- SOURCE
   procedure Wrap(Interp: in Tcl_Interp);
   -- ****

   -- ****f* Autoscroll/Unautoscroll
   -- FUNCTION
   -- Return the selected scroll to its original static state
   -- PARAMETERS
   -- Scroll - Tk_Widget which state will be reseted
   -- HISTORY
   -- 8.6.7 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- EXAMPLE
   -- -- Set static state for scrollbar My_Scroll
   -- Unautoscroll(My_Scroll);
   -- COMMANDS
   -- :autoscroll::unautoscroll scroll
   -- SOURCE
   procedure Unautoscroll(Scroll: in Tk_Widget'Class);
   -- ****

   -- ****f* Autoscroll/Unwrap
   -- FUNCTION
   -- Turns off the automatic autoscrolling of all new scrollbars. Does not
   -- effect existing scrollbars
   -- PARAMETERS
   -- Interp - Tcl interpreter on which autoscrolling will be disabled
   -- HISTORY
   -- 8.6.7 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   procedure Unwrap(Interp: in Tcl_Interp);
   -- ****

end Tcl.Tklib.Ada.Autoscroll;

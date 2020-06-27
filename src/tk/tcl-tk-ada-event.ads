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

-- ****h* TkAda/Event
-- FUNCTION
-- Provides code for manipulate Tk command Event
-- SOURCE
package Tcl.Tk.Ada.Event is
-- ****

   -- ****f* Event/Add
   -- FUNCTION
   -- Assiociated the selected virtual event with the selected sequence on the
   -- selected interpreter.
   -- PARAMETERS
   -- Virtual  - Name of the virtual event which will be triggered when the
   --            selected Sequence occurs
   -- Sequence - Tcl commands which will trigger the selected Virtual event
   -- Interp   - Tcl interpreter on which the event should be added
   -- HISTORY
   -- 8.6.6 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   procedure Add
     (Virtual, Sequence: in String; Interp: Tcl_Interp := Get_Context) with
      Pre => Virtual /= "" and Sequence /= "";
      -- ****

      -- ****f* Event/Delete
      -- FUNCTION
      -- Delete the selected Sequence from the selected Virtual event on the
      -- selected interpreter
      -- PARAMETERS
      -- Virtual     - Name of the virtual even from which Sequence will be
      --               removed
      -- Sequence    - Tcl commands which will be removed. If empty, remove all
      --               associated commands with the selected Virtual event.
      --               Default value is empty
      -- Interpreter - Tcl interpreter on which Sequence will be removed
      -- HISTORY
      -- 8.6.6 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   procedure Delete
     (Virtual: in String; Sequence: in String := "";
      Interp: Tcl_Interp := Get_Context) with
      Pre => Virtual /= "";
      -- ****

      -- ****f* Event/Generate
      -- FUNCTION
      -- Generate the selected event at the selected window
      -- PARAMETERS
      -- Window    - Tk_Widget on which the selected event will be generated
      -- EventName - Event to generate (like <Escape> or <<MyEvent>>)
      -- Option    - Additional options for the event. Can be empty. Default
      --             value is empty
      -- HISTORY
      -- 8.6.6 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   procedure Generate
     (Window: in Tk_Widget'Class; EventName: in String;
      Options: in String := "") with
      Pre => EventName /= "";
      -- ****

end Tcl.Tk.Ada.Event;

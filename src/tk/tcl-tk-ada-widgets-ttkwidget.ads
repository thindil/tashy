-- Copyright (c) 2020 Bartek thindil Jasicki <thindil@laeran.pl>
--
-- This program is free software: you can redistribute it and/or modify
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

-- ****h* Widgets/TtkWidget
-- FUNCTION
-- Provides code for manipulate Ttk widgets
-- SOURCE
package Tcl.Tk.Ada.Widgets.TtkWidget is
-- ****

   -- ****f* TtkWidget/TtkWidget.Identify_Element
   -- FUNCTION
   -- Get the name of the element at the selected coordinate
   -- PARAMETERS
   -- Widget - Ttk widget which will be queried for the elements
   -- X      - X coordinate to check relative to the Widget
   -- Y      - Y coordinate to check relative to the Widget
   -- RESULT
   -- The name of the element at the selected point or {} if no element was
   -- found
   -- HISTORY
   -- 8.6.6 - Added
   -- EXAMPLE
   -- -- Get the name of the element at point (25, 87) in My_Widget widget
   -- Element_Name: constant String := Identify_Element(My_Widget, "25", "87");
   -- COMMANDS
   -- Widget identify element x y
   -- SOURCE
   function Identify_Element
     (Widget: in Tk_Widget'Class; X, Y: in String) return String with
      Pre => X /= "" and Y /= "";
      -- ****

      -- ****f* TtkWidget/TtkWidget.InState
      -- FUNCTION
      -- Check if the selected Ttk widget is in the selected state
      -- PARAMETERS
      -- Widget    - Ttk widget which will be queried for state
      -- StateSpec - Ttk state to check
      -- Script    - If Widget is in the selected StateSpec, run this Tcl script
      -- RESULT
      -- 1 if the selected widget is in the selected state, otherwise 0.
      -- HISTORY
      -- 8.6.3 - Added
      -- EXAMPLE
      -- -- Check if widget My_Widget is disabled
      -- Is_Disabled: constant String := InState(My_Widget, "disabled");
      -- COMMANDS
      -- Widget instate statespec ?script?
      -- SOURCE
   function InState
     (Widget: in Tk_Widget'Class; StateSpec: in String;
      Script: in String := "") return String with
      Pre => StateSpec /= "";
      -- ****

      -- ****f* TtkWidget/TtkWidget.State_(procedure)
      -- FUNCTION
      -- Set the selected widget to the new state
      -- PARAMETERS
      -- Widget    - Ttk widget which state will be set
      -- StateSpec - Ttk state to set
      -- HISTORY
      -- 8.6.3 - Added
      -- EXAMPLE
      -- -- Reenable My_Widget
      -- State(My_Widget, "!disabled");
      -- COMMANDS
      -- Widget state stateSpec
      -- SEE ALSO
      -- TtkWidget.State_(function)
      -- SOURCE
   procedure State(Widget: in Tk_Widget'Class; StateSpec: in String) with
      Pre => StateSpec /= "";
      -- ****

      -- ****f* TtkWidget/TtkWidget.State_(function)
      -- FUNCTION
      -- Get the current state of the selected widget
      -- PARAMETERS
      -- Widget - Ttk widget which will be queried for the state
      -- RESULT
      -- List of currently enabled state flags
      -- HISTORY
      -- 8.6.3 - Added
      -- EXAMPLE
      -- -- Get the current state of My_Widget widget
      -- Current_State: constant String := State(My_Widget);
      -- COMMANDS
      -- Widget state
      -- SEE ALSO
      -- TtkWidget.State_(procedure)
      -- SOURCE
   function State(Widget: in Tk_Widget'Class) return String;
   -- ****

end Tcl.Tk.Ada.Widgets.TtkWidget;

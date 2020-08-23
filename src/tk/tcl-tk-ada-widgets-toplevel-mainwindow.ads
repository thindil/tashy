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

-- ****h* Toplevel/MainWindow
-- FUNCTION
-- Provides code for manipulate main window widget
-- SOURCE
package Tcl.Tk.Ada.Widgets.Toplevel.MainWindow is
-- ****

   -- ****f* MainWindow/Get_Main_Window
   -- FUNCTION
   -- Get main window of the specified interpreter
   -- PARAMETERS
   -- Interp - Tcl interpreter from which main window will be get
   -- RESULT
   -- Main Tk window as Tk_Toplevel widget
   -- HISTORY
   -- 8.6.1 - Moved from Tcl.Tk.Ada.Widgets
   -- TODO
   -- Replace it with higher level of binding
   -- EXAMPLE
   -- -- Get the main window at current Tcl interpreter
   -- Main_Window: constant Tk_Toplevel := Get_Main_Window(Get_Context);
   -- SOURCE
   function Get_Main_Window(Interp: in Tcl_Interp) return Tk_Toplevel;
   -- ****

   -- ****f* MainWindow/Bind_To_Main_Window
   -- FUNCTION
   -- Associates Tcl script Script with the event Sequence in the main window.
   -- PARAMETERS
   -- Interp   - Tcl interpreter to which main window scrip will be binded
   -- Sequence - Name of Tk event which will be binded with the script
   -- Script   - Tcl code which will be binded to the Tk_Widget
   -- HISTORY
   -- 8.6.1 - Moved from Tcl.Tk.Ada.Widgets
   -- TODO
   -- Replace it with higher level of binding
   -- EXAMPLE
   -- -- Close the program when the press ALT-q on My_Interpreter Tcl interpreter
   -- Bind_To_Main_Window(My_Interpreter, "<Alt-q>", "{exit}");
   -- COMMANDS
   -- bind . sequence script
   -- SOURCE
   procedure Bind_To_Main_Window
     (Interp: in Tcl_Interp; Sequence: in String; Script: in String) with
      Pre => Sequence /= "" and Script /= "";
      -- ****

      -- ****f* MainWindow/Unbind_From_Main_Window (procedure)
      -- FUNCTION
      -- Disassociates the binding from the event Sequence in the main window.
      -- PARAMETERS
      -- Interp   - Tcl interpreter from which event will be unbinded from main
      --            window
      -- Sequence - Name of Tk event to remove
      -- HISTORY
      -- 8.6.1 - Moved from Tcl.Tk.Ada.Widgets
      -- TODO
      -- Replace it with higher level of binding
      -- EXAMPLE
      -- -- Unbind left mouse click from the main window on current Tcl interpreter
      -- Unbind_From_Main_Window(Get_Context, "<1>");
      -- COMMANDS
      -- bind . sequence {}
      -- SOURCE
   procedure Unbind_From_Main_Window
     (Interp: in Tcl_Interp; Sequence: in String) with
      Pre => Sequence /= "";
      -- ****

      -- ****f* MainWindow/Unbind_From_Main_Window (function)
      -- FUNCTION
      -- Disassociates the binding from the event Sequence in the main window.
      -- PARAMETERS
      -- Interp   - Tcl interpreter from which event will be unbinded from main
      --            window
      -- Sequence - Name of Tk event to remove
      -- RESULT
      -- String with Tcl information about finished action
      -- HISTORY
      -- 8.6.1 - Moved from Tcl.Tk.Ada.Widgets
      -- TODO
      -- Replace it with higher level of binding
      -- EXAMPLE
      -- -- Unbind left mouse click from the main window on current Tcl interpreter
      -- Result: constant String := Unbind_From_Main_Window(Get_Context, "<1>");
      -- COMMANDS
      -- bind . sequence {}
      -- SOURCE
   function Unbind_From_Main_Window
     (Interp: in Tcl_Interp; Sequence: in String) return String with
      Pre => Sequence /= "";
      -- ****

end Tcl.Tk.Ada.Widgets.Toplevel.MainWindow;

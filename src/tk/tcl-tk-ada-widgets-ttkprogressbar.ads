-- Copyright (c) 2020-2021 Bartek thindil Jasicki <thindil@laeran.pl>
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

-- As a special exception, if other files instantiate generics from this
-- unit, or you link this unit with other files to produce an executable,
-- this unit does not by itself cause the resulting executable to be
-- covered by the GNU General Public License. This exception does not
-- however invalidate any other reasons why the executable file might be
-- covered by the GNU Public License.

-- ****h* Widgets/TtkProgressBar
-- FUNCTION
-- Provides code for manipulate Tk widget Ttk::ProgressBar
-- SOURCE
package Tcl.Tk.Ada.Widgets.TtkProgressBar with
   SPARK_Mode
is
   pragma Elaborate_Body;
-- ****

   -- ****t* TtkProgressBar/TtkProgressBar.Ttk_ProgressBar
   -- FUNCTION
   -- This is a non-abstract type derived directly from Tk_Widget.
   -- Each of the derived widgets redefines the Create subprogram
   -- in order to create the correct type of widget.
   -- SOURCE
   type Ttk_ProgressBar is new Tk_Widget with private;
   -- ****

   -- ****f* TtkProgressBar/TtkProgressBar.Create_(function)
   -- FUNCTION
   -- Creates a new Ttk_ProgressBar in the specified interpreter.
   -- PARAMETERS
   -- pathName - Tk path (starts with dot) for the widget
   -- options  - Options which will be passed to the widget. Default value is
   --            empty
   -- Interp   - Tcl interpreter to which the widget will be created. If null,
   --            the widget will be created in the "contextual" interpreter.
   --            Default value is null.
   -- RESULT
   -- Newly created Ttk_ProgressBar
   -- HISTORY
   -- 8.6.1 - Added
   -- EXAMPLE
   -- -- Create a new horizontal progressbar with pathname .myprogress
   -- My_Progress: constant Ttk_ProgressBar := Create(".myprogress", "-orient horizontal");
   -- COMMANDS
   -- ttk::progressbar pathName ?options?
   -- SEE ALSO
   -- TtkProgressBar.Create_(procedure)
   -- SOURCE
   overriding function Create
     (pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := Null_Interp) return Ttk_ProgressBar with
      Global => null;
     -- ****

     -- ****f* TtkProgressBar/TtkProgressBar.Create_(procedure)
     -- FUNCTION
     -- Creates a new Ttk_ProgressBar in the specified interpreter.
     -- PARAMETERS
     -- Widgt    - Ttk_ProgressBar which will be created
     -- pathName - Tk path (starts with dot) for the widget
     -- options  - Options which will be passed to the widget. Default value is
     --            empty
     -- Interp   - Tcl interpreter to which the widget will be created. If null,
     --            the widget will be created in the "contextual" interpreter.
     --            Default value is null.
     -- OUTPUT
     -- Newly created Ttk_ProgressBar as parameter Widgt
     -- HISTORY
     -- 8.6.1 - Added
     -- EXAMPLE
     -- -- Create vertical progressbar My_Progress with pathname .myprogress on the current Tcl interpreter
     -- declare
     --    My_Progress: Ttk_ProgressBar;
     -- begin
     --    Create(My_Progress, ".myprogress", "-orient vertical");
     -- end;
     -- COMMANDS
     -- ttk::progressbar pathName ?options?
     -- SEE ALSO
     -- TtkProgressBar.Create_(function)
     -- SOURCE
   overriding procedure Create
     (Widgt: out Ttk_ProgressBar; pathName: in String;
      options: in String := ""; Interp: in Tcl_Interp := Null_Interp) with
      Global => null;
      -- ****

     -- ****f* TtkProgressBar/TtkProgressBar.Get_Widget
     -- FUNCTION
     -- Get the existing Ttk_Scrollbar widget
     -- PARAMETERS
     -- pathName - Tk path (starts with dot) for the widget
     -- Interp   - Tcl interpreter on which the widget exists. Can be empty.
     --            Default value is current Tcl interpreter
     -- RESULT
     -- Existing Ttk_ProgressBar widget
     -- HISTORY
     -- 8.6.9 - Added
     -- EXAMPLE
     -- -- Get progressbar widget with name .myprogress on the current Tcl interpreter
     -- My_Progress: constant Ttk_ProgressBar := Get_Widget(".myprogress");
     -- SOURCE
   overriding function Get_Widget
     (pathName: in String; Interp: in Tcl_Interp := Get_Context)
      return Ttk_ProgressBar with
      Global => null;
     -- ****

     -- ****f* TtkProgressBar/TtkProgressBar.Start
     -- FUNCTION
     -- Begin autoincrement mode, call Step every Interval miliseconds
     -- PARAMETERS
     -- Bar      - Ttk_ProgressBar in which autoincrement mode will be started
     -- Interval - Amount of miliseconds in which Step should be called.
     --            Default value is 50 (20 steps per second)
     -- HISTORY
     -- 8.6.6 - Added
     -- EXAMPLE
     -- -- Start the autoincrement mode on My_Progress progressbar every 100 miliseconds
     -- Start(My_Progress, "100");
     -- COMMANDS
     -- Bar start ?interval?
     -- SOURCE
   procedure Start(Bar: in Ttk_ProgressBar; Interval: in String := "50");
   -- ****

   -- ****f* TtkProgressBar/TtkProgressBar.Step
   -- FUNCTION
   -- Increment value of the Ttk_ProgressBar by amount
   -- PARAMETERS
   -- Bar    - Ttk_ProgressBar which value will be modified
   -- Amount - Amount to incremement. If empty, then value is incremented
   --          by 1.0. Default value is empty
   -- HISTORY
   -- 8.6.2 - Added
   -- EXAMPLE
   -- -- Increment My_Progress progressbar by 10
   -- Step(My_Progress, "10.0");
   -- COMMANDS
   -- Bar step ?amount?
   -- SOURCE
   procedure Step(Bar: in Ttk_ProgressBar; Amount: in String := "");
   -- ****

   -- ****f* TtkProgressBar/TtkProgressBar.Stop
   -- FUNCTION
   -- Stop autoincrement mode: cancels any recurring timer events in the
   -- selected Ttk_ProgressBar
   -- PARAMETERS
   -- Bar - Ttk_ProgressBar in which autoincrement mode will be stoped
   -- HISTORY
   -- 8.6.6 - Added
   -- EXAMPLE
   -- -- Stop the autoincrement mode in My_Progress progressbar
   -- Stop(My_Progress);
   -- COMMANDS
   -- Bar stop
   -- SOURCE
   procedure Stop(Bar: in Ttk_ProgressBar);
   -- ****

private

   type Ttk_ProgressBar is new Tk_Widget with null record;

end Tcl.Tk.Ada.Widgets.TtkProgressBar;

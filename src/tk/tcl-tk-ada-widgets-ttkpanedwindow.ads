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

-- As a special exception, if other files instantiate generics from this
-- unit, or you link this unit with other files to produce an executable,
-- this unit does not by itself cause the resulting executable to be
-- covered by the GNU General Public License. This exception does not
-- however invalidate any other reasons why the executable file might be
-- covered by the GNU Public License.

-- ****h* Widgets/TtkPanedWindow
-- FUNCTION
-- Provides code for manipulate Tk widget Ttk::PanedWindow
-- SOURCE
package Tcl.Tk.Ada.Widgets.TtkPanedWindow is
-- ****

   -- ****t* TtkPanedWindow/Ttk_PanedWindow
   -- FUNCTION
   -- This is a non-abstract type derived directly from Tk_Widget.
   -- Each of the derived widgets redefines the Create subprogram
   -- in order to create the correct type of widget.
   -- SOURCE
   type Ttk_PanedWindow is new Tk_Widget with private;
   -- ****

   -- ****f* TtkPanedWindow/Create (function)
   -- FUNCTION
   -- Creates a new Ttk_PanedWindow in the specified interpreter.
   -- PARAMETERS
   -- pathName - Tk path (starts with dot) for the widget
   -- options  - Options which will be passed to the widget. Default value is
   --            empty
   -- Interp   - Tcl interpreter to which the widget will be created. If null,
   --            the widget will be created in the "contextual" interpreter.
   --            Default value is null.
   -- RESULT
   -- Newly created Ttk_PanedWindow
   -- HISTORY
   -- 8.6.1 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- EXAMPLE
   -- -- Create a new panedwindow with pathname .mypaned
   -- My_Paned: constant Ttk_PanedWindow := Create(".mypaned");
   -- COMMANDS
   -- ttk::panedwindow pathName ?options?
   -- SEE ALSO
   -- Create (procedure)
   -- SOURCE
   overriding function Create
     (pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) return Ttk_PanedWindow with
      Pre => pathName /= "";
     -- ****

     -- ****f* TtkPanedWindow/Create (procedure)
     -- FUNCTION
     -- Creates a new Ttk_PanedWindow in the specified interpreter.
     -- PARAMETERS
     -- Widgt    - Ttk_PanedWindow which will be created
     -- pathName - Tk path (starts with dot) for the widget
     -- options  - Options which will be passed to the widget. Default value is
     --            empty
     -- Interp   - Tcl interpreter to which the widget will be created. If null,
     --            the widget will be created in the "contextual" interpreter.
     --            Default value is null.
     -- HISTORY
     -- 8.6.1 - Added
     -- TODO
     -- Replace it with higher level of binding
     -- EXAMPLE
     -- -- Create panedwindow My_Paned with pathname .mypaned on the current Tcl interpreter
     -- declare
     --    My_Paned: Ttk_PanedWindow;
     -- begin
     --    Create(My_Paned, ".mypaned");
     -- end;
     -- COMMANDS
     -- ttk::panedwindow pathName ?options?
     -- SEE ALSO
     -- Create (function)
     -- SOURCE
   overriding procedure Create
     (Widgt: out Ttk_PanedWindow; pathName: in String;
      options: in String := ""; Interp: in Tcl_Interp := null) with
      Pre => pathName /= "";
     -- ****

     -- ****f* TtkPanedWindow/Get_Widget
     -- FUNCTION
     -- Get the existing Ttk_PanedWindow widget
     -- PARAMETERS
     -- pathName - Tk path (starts with dot) for the widget
     -- Interp   - Tcl interpreter on which the widget exists. Can be empty.
     --            Default value is current Tcl interpreter
     -- RESULT
     -- Existing Ttk_PanedWindow widget
     -- HISTORY
     -- 8.6.9 - Added
     -- EXAMPLE
     -- -- Get panedwindow widget with name .mypaned on the current Tcl interpreter
     -- My_Paned: constant Ttk_PanedWindow := Get_Widget(".mypaned");
     -- SOURCE
   overriding function Get_Widget
     (pathName: in String; Interp: in Tcl_Interp := Get_Context)
      return Ttk_PanedWindow;

     -- ****f* TtkPanedWindow/Add
     -- FUNCTION
     -- Adds the Tk_Widget to the Ttk_PanedWindow.
     -- PARAMETERS
     -- Paned     - Ttk_PanedWindow to which SubWindow will be added
     -- SubWindow - Tk_Widget which will be added to the Ttk_PanedWindow
     -- Options   - Tk options which will be passed to the command. Default
     --             value is empty.
     -- HISTORY
     -- 8.6.1 - Added
     -- TODO
     -- Replace it with higher level of binding
     -- EXAMPLE
     -- -- Add My_Frame widget to My_Paned panedwindow
     -- Add(My_Paned, My_Frame);
     -- COMMANDS
     -- Paned add subwindow ?options?
     -- SOURCE
   procedure Add
     (Paned: in Ttk_PanedWindow; SubWindow: in Tk_Widget'Class;
      Options: in String := "");
   -- ****

   -- ****f* TtkPanedWindow/Forget
   -- FUNCTION
   -- Remove the Tk_Widget from the Ttk_PanedWindow
   -- PARAMETERS
   -- Paned     - Ttk_PanedWindow from which SubWindow will be removed
   -- SubWindow - Tk_Widget which will be removed from the Ttk_PanedWindow
   -- HISTORY
   -- 8.6.1 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- EXAMPLE
   -- -- Remove My_Frame from My_Paned panedwindow
   -- Forget(My_Paned, My_Frame);
   -- COMMANDS
   -- Paned forget subwindow
   -- SOURCE
   procedure Forget(Paned: in Ttk_PanedWindow; SubWindow: in Tk_Widget'Class);
   -- ****

   -- ****f* TtkPanedWindow/Identify_Element
   -- FUNCTION
   -- Get the name of the paned element at the selected point
   -- PARAMETERS
   -- Paned - Ttk_PanedWindow which will be queried for elements
   -- X     - X coordinate of the point to check
   -- Y     - Y coordinate of the point to check
   -- RESULT
   -- Name of the element at the selected point of {} if no element or point
   -- is outside Paned
   -- HISTORY
   -- 8.6.6 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- EXAMPLE
   -- -- Get the name of the element at point (56, 32) in My_Paned panedwindow
   -- Element_Name: constant String := Identify_Element(My_Paned, "56", "32");
   -- COMMANDS
   -- Paned identify element x y
   -- SOURCE
   function Identify_Element
     (Paned: in Ttk_PanedWindow; X, Y: in String) return String with
      Pre => X /= "" and Y /= "";
      -- ****

      -- ****f* TtkPanedWindow/Identify_Sash
      -- FUNCTION
      -- Get the index of the paned sash at the selected point
      -- PARAMETERS
      -- Paned - Ttk_PanedWindow which will be queried for sash
      -- X     - X coordinate of the point to check
      -- Y     - Y coordinate of the point to check
      -- RESULT
      -- Index of the sash at the selected point of {} if no sash or point
      -- is outside Paned
      -- HISTORY
      -- 8.6.6 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- EXAMPLE
      -- -- Identify sash at point (43, 86) in My_Paned panedwindow
      -- Sash_Index: constant String := Identify_Sash(My_Paned, "43", "86");
      -- COMMANDS
      -- Paned identify sash x y
      -- SOURCE
   function Identify_Sash
     (Paned: in Ttk_PanedWindow; X, Y: in String) return String with
      Pre => X /= "" and Y /= "";
      -- ****

      -- ****f* TtkPanedWindow/Insert
      -- FUNCTION
      -- Insert the selected Tk_Widget in the selected Ttk_PanedWindow on the
      -- selected position
      -- PARAMETERS
      -- Paned     - Ttk_PanedWindow in which SubWindow will be inserted
      -- Position  - Position on which SubWindow will be inserted
      -- SubWindow - Tk_Widget to insert to the Ttk_PanedWindow
      -- Options   - Tk options which will be passed to the command. Default
      --             value is empty.
      -- HISTORY
      -- 8.6.3 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- EXAMPLE
      -- -- Insert My_Frame at the end of the My_Paned panedwindow
      -- Insert(My_Paned, "end", My_Frame);
      -- COMMANDS
      -- Paned insert pos subwindow ?options?
      -- SOURCE
   procedure Insert
     (Paned: in Ttk_PanedWindow; Position: in String;
      SubWindow: in Tk_Widget'Class; Options: in String := "") with
      Pre => Position /= "";
      -- ****

      -- ****f* TtkPanedWindow/Pane (procedure)
      -- FUNCTION
      -- Set the selected options of the selected widget in the selected
      -- Ttk_PanedWindow
      -- PARAMETERS
      -- Paned   - Ttk_PanedWindow in which widget's options will be set
      -- Index   - Numeric index or name of widget which options will be set
      -- Options - Options and new values for the selected widget
      -- HISTORY
      -- 8.6.6 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- EXAMPLE
      -- -- Set the weight of first subwindow in My_Paned panedwindow to 2
      -- Pane(My_Paned, "0", "-weight 2");
      -- COMMANDS
      -- Paned pane index ?options?
      -- SOURCE
   procedure Pane(Paned: in Ttk_PanedWindow; Index, Options: in String) with
      Pre => Index /= "" and Options /= "";
      -- ****

      -- ****f* TtkPanedWindow/Pane (function)
      -- FUNCTION
      -- Get the selected options values of the selected widget in the
      -- selected Ttk_PanedWindow
      -- PARAMETERS
      -- Paned  - Ttk_PanedWindow in which widget's options will be queried
      -- Index  - Numeric index or name of widget which options will be get
      -- Option - Name of the option to get. Can be empty. Default value is
      --          empty
      -- RESULT
      -- If Option is specified, then return value of the selected option.
      -- Otherwise, return list of all options with their values.
      -- HISTORY
      -- 8.6.6 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- EXAMPLE
      -- -- Get all available options for first subwindow in My_Paned panedwindow
      -- Options: constant String := Pane(My_Paned, "0");
      -- COMMANDS
      -- Paned pane pane ?option?
      -- SOURCE
   function Pane
     (Paned: in Ttk_PanedWindow; Index: in String; Option: in String := "")
      return String with
      Pre => Index /= "";
      -- ****

      -- ****f* TtkPanedWindow/Panes
      -- FUNCTION
      -- Get list of names of all widgets managed by the Ttk_PanedWindow
      -- PARAMETERS
      -- Paned - Ttk_PanedWindow which will be queried for widgets
      -- RESULT
      -- List of widgets inside of Ttk_PanedWindow
      -- HISTORY
      -- 8.6.1 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- EXAMPLE
      -- -- Get the names of all subwindows in My_Paned panedwindow
      -- Windows_Names: constant String := Panes(My_Paned);
      -- COMMANDS
      -- Paned panes
      -- SOURCE
   function Panes(Paned: in Ttk_PanedWindow) return String;
   -- ****

   -- ****f* TtkPanedWindow/SashPos (procedure)
   -- FUNCTION
   -- Set position of the selected sash in the selected Ttk_PanedWindow to new
   -- position
   -- PARAMETERS
   -- Paned  - Ttk_PanedWindow in which the selected sash will be moved
   -- Index  - Index of the sash to move
   -- NewPos - New position (in pixels) of the selected sash
   -- HISTORY
   -- 8.6.6 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- EXAMPLE
   -- -- Set the position of the first sash in My_Paned panedwindow to 35 pixels from start
   -- SashPos(My_Paned, "0", "35");
   -- COMMANDS
   -- Paned sashpos index newpos
   -- SOURCE
   procedure SashPos(Paned: in Ttk_PanedWindow; Index, NewPos: in String) with
      Pre => Index /= "" and NewPos /= "";
      -- ****

      -- ****f* TtkPanedWindow/SashPos
      -- FUNCTION
      -- Get the current position of the selected sash in the selected
      -- Ttk_PanedWindow
      -- PARAMETERS
      -- Paned  - Ttk_PanedWindow in which the position of the sash will be
      --          taken
      -- Index  - Index of the sash to query for position
      -- RESULT
      -- The current position of the selected sash.
      -- HISTORY
      -- 8.6.6 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- EXAMPLE
      -- -- Get the current position of the second sash in My_Paned panedwindow
      -- Position: constant String := SashPos(My_Paned, "1");
      -- COMMANDS
      -- Paned sashpos index
      -- SOURCE
   function SashPos
     (Paned: in Ttk_PanedWindow; Index: in String) return String with
      Pre => Index /= "";
      -- ****

private

   type Ttk_PanedWindow is new Tk_Widget with null record;

end Tcl.Tk.Ada.Widgets.TtkPanedWindow;

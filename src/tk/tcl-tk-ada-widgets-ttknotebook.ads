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

-- ****h* Widgets/TtkNotebook
-- FUNCTION
-- Provides code for manipulate Tk widget Ttk::Notebook
-- SOURCE
package Tcl.Tk.Ada.Widgets.TtkNotebook with
   SPARK_Mode
is
   pragma Elaborate_Body;
-- ****

   -- ****t* TtkNotebook/TtkNotebook.Ttk_Notebook
   -- FUNCTION
   -- This is a non-abstract type derived directly from Tk_Widget.
   -- Each of the derived widgets redefines the Create subprogram
   -- in order to create the correct type of widget.
   -- SOURCE
   type Ttk_Notebook is new Tk_Widget with private;
   -- ****

   -- ****f* TtkNotebook/TtkNotebook.Create_(function)
   -- FUNCTION
   -- Creates a new Ttk_Notebook in the specified interpreter.
   -- PARAMETERS
   -- pathName - Tk path (starts with dot) for the widget
   -- options  - Options which will be passed to the widget. Default value is
   --            empty
   -- Interp   - Tcl interpreter to which the widget will be created. If null,
   --            the widget will be created in the "contextual" interpreter.
   --            Default value is null.
   -- RESULT
   -- Newly created Ttk_Notebook
   -- HISTORY
   -- 8.6.2 - Added
   -- EXAMPLE
   -- -- Create a new notebook with pathname .mynotebook
   -- My_Notebook: constant Ttk_Notebook := Create(".mynotebook");
   -- COMMANDS
   -- ttk::notebook pathName ?options?
   -- SEE ALSO
   -- TtkNotebook.Create_(procedure)
   -- SOURCE
   overriding function Create
     (pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := Null_Interp) return Ttk_Notebook with
      Global => null;
     -- ****

     -- ****f* TtkNotebook/TtkNotebook.Create_(procedure)
     -- FUNCTION
     -- Creates a new Ttk_Notebook in the specified interpreter.
     -- PARAMETERS
     -- Widgt    - Ttk_Notebook which will be created
     -- pathName - Tk path (starts with dot) for the widget
     -- options  - Options which will be passed to the widget. Default value is
     --            empty
     -- Interp   - Tcl interpreter to which the widget will be created. If null,
     --            the widget will be created in the "contextual" interpreter.
     --            Default value is null.
     -- OUTPUT
     -- Newly created Ttk_Notebook as parameter Widgt
     -- HISTORY
     -- 8.6.2 - Added
     -- EXAMPLE
     -- -- Create notebook My_Notebook with pathname .mynotebook on the current Tcl interpreter
     -- declare
     --    My_Notebook: Ttk_Notebook;
     -- begin
     --    Create(My_Notebook, ".mynotebook");
     -- end;
     -- COMMANDS
     -- ttk::notebook pathName ?options?
     -- SEE ALSO
     -- TtkNotebook.Create_(function)
     -- SOURCE
   overriding procedure Create
     (Widgt: out Ttk_Notebook; pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := Null_Interp) with
      Global => null;
     -- ****

     -- ****f* TtkNotebook/TtkNotebook.Get_Widget
     -- FUNCTION
     -- Get the existing Ttk_Notebook widget
     -- PARAMETERS
     -- pathName - Tk path (starts with dot) for the widget
     -- Interp   - Tcl interpreter on which the widget exists. Can be empty.
     --            Default value is current Tcl interpreter
     -- RESULT
     -- Existing Ttk_Notebook widget
     -- HISTORY
     -- 8.6.9 - Added
     -- EXAMPLE
     -- -- Get notebook widget with name .mynotebook on the current Tcl interpreter
     -- My_Notebook: constant Ttk_Notebook := Get_Widget(".mynotebook");
     -- SOURCE
   overriding function Get_Widget
     (pathName: in String; Interp: in Tcl_Interp := Get_Context)
      return Ttk_Notebook with
      Global => null;
     -- ****

     -- ****f* TtkNotebook/TtkNotebook.Add
     -- FUNCTION
     -- Add a new window to the selected notebook
     -- PARAMETERS
     -- Notebook   - Ttk_Notebook to which window will be added
     -- WindowName - A name of widget to add to Ttk_Notebook
     -- Options    - Tk options for added window. Default value is empty
     -- HISTORY
     -- 8.6.2 - Added
     -- EXAMPLE
     -- -- Add a widget with pathname .myframe to the My_Notebook notebook with tab label my tab
     -- Add(My_Notebook, ".myframe", "-text {my tab}");
     -- COMMANDS
     -- Notebook add windowname ?options?
     -- SOURCE
   procedure Add
     (Notebook: in Ttk_Notebook; WindowName: in String;
      Options: String := "") with
      Pre'Class => WindowName /= "";
      -- ****

      -- ****f* TtkNotebook/TtkNotebook.Forget
      -- FUNCTION
      -- Remove the selected tab and unmap the associated window
      -- PARAMETERS
      -- Notebook - Ttk_Notebook in which the tab will be removed
      -- TabId    - Id of the tab to remove
      -- HISTORY
      -- 8.6.5 - Added
      -- EXAMPLE
      -- -- Remove the currently selected tab in the My_Notebook notebook
      -- Forget(My_Notebook, "current");
      -- COMMANDS
      -- Notebook forget tabid
      -- SOURCE
   procedure Forget(Notebook: in Ttk_Notebook; TabId: in String) with
      Pre'Class => TabId /= "";
      -- ****

      -- ****f* TtkNotebook/TtkNotebook.Hide
      -- FUNCTION
      -- Hide selected tab. Hidden tab can be restored with Add procedure
      -- PARAMETERS
      -- Notebook - Ttk_Notebook in which tab will be hidden
      -- TabId    - Id of the tab to hide
      -- HISTORY
      -- 8.6.2 - Added
      -- EXAMPLE
      -- -- Hide the second tab of My_Notebook notebook
      -- Hide(My_Notebook, "1");
      -- COMMANDS
      -- Notebook hide tabid
      -- SOURCE
   procedure Hide(Notebook: in Ttk_Notebook; TabId: in String) with
      Pre'Class => TabId /= "";
      -- ****

      -- ****f* TtkNotebook/TtkNotebook.Identify_Element
      -- FUNCTION
      -- Get the name of the element at the specific location
      -- PARAMETERS
      -- Notebook - Ttk_Notebook in which element will be queried
      -- X        - X coordinate of the location to query
      -- Y        - Y coordinate of the location to query
      -- RESULT
      -- Name of the element at the specific location or {} if no component
      -- is present there
      -- HISTORY
      -- 8.6.5 - Added
      -- EXAMPLE
      -- -- Get the element at point (24, 82) in My_Notebook notebook
      -- Element_Name: constant String := Identify_Element(My_Notebook, "24", "82");
      -- COMMANDS
      -- Notebook identify element x y
      -- SOURCE
   function Identify_Element
     (Notebook: in Ttk_Notebook; X, Y: in String) return String with
      Pre'Class => X /= "" and Y /= "";
      -- ****

      -- ****f* TtkNotebook/TtkNotebook.Identify_Tab
      -- FUNCTION
      -- Get the index of the tab at the specific location
      -- PARAMETERS
      -- Notebook - Ttk_Notebook in which tabs will be queried
      -- X        - X coordinate of the location to query
      -- Y        - Y coordinate of the location to query
      -- RESULT
      -- Index of the tab at the specific location or {} if no tab is present
      -- there
      -- HISTORY
      -- 8.6.5 - Added
      -- EXAMPLE
      -- -- Get the index of the tab at point (10, 56) in My_Notebook notebook
      -- Tab_Index: constant String := Identify_Tab(Notebook, "10", "56");
      -- COMMANDS
      -- Notebook identify tab x y
      -- SOURCE
   function Identify_Tab
     (Notebook: in Ttk_Notebook; X, Y: in String) return String with
      Pre'Class => X /= "" and Y /= "";
      -- ****

      -- ****f* TtkNotebook/TtkNotebook.Index
      -- FUNCTION
      -- Get numeric index of the selected tab
      -- PARAMETERS
      -- Notebook - Ttk_Notebook which will be queried
      -- TabId    - Index of the tab or "end"
      -- RESULT
      -- Numeric index of the selected tab or amount of all tabs in Notebook,
      -- if TabId was "end"
      -- HISTORY
      -- 8.6.5 - Added
      -- EXAMPLE
      -- -- Get the amount of the tabs in My_Notebook notebook
      -- Amount: constant String := Index(My_Notebook, "end");
      -- COMMANDS
      -- Notebook index tabid
      -- SOURCE
   function Index
     (Notebook: in Ttk_Notebook; TabId: in String) return String with
      Pre'Class => TabId /= "";
      -- ****

      -- ****f* TtkNotebook/TtkNotebook.Insert
      -- FUNCTION
      -- Insert the selected window at the selected position in the selected
      -- Ttk_Notebook. If window is in the selected Ttk_Notebook, move it to
      -- the selected position
      -- PARAMETERS
      -- Notebook  - Ttk_Notebook in which the selected SubWindow will be
      --             inserted or moved
      -- Pos       - Position to which insert or move the selected SubWindow
      -- SubWindow - Tk_Widget which will be inserted or moved
      -- Options   - Additional options for inserted or moved SubWindow
      -- HISTORY
      -- 8.6.6 - Added
      -- EXAMPLE
      -- -- Insert My_Frame to My_Notebook notebook at second position with label my tab
      -- Insert(My_Notebook, "1", My_Frame, "-text {my tab}");
      -- COMMANDS
      -- Notebook insert pos subwindow ?options?
      -- SOURCE
   procedure Insert
     (Notebook: in Ttk_Notebook; Pos: in String; SubWindow: in Tk_Widget'Class;
      Options: in String) with
      Pre'Class => Pos /= "" and Options /= "";
      -- ****

      -- ****f* TtkNotebook/TtkNotebook.Notebook_Select
      -- FUNCTION
      -- Set selected tab as a currently selected in the Ttk_Notebook
      -- PARAMETERS
      -- Notebook - Ttk_Notebook in which the tab will be selected
      -- TabId    - Id of the tab to select
      -- HISTORY
      -- 8.6.2 - Added
      -- EXAMPLE
      -- -- Set the first tab as the currently selected tab in My_Notebook notebook
      -- Notebook_Select(My_Notebook, "0");
      -- COMMANDS
      -- Notebook select tabid
      -- SOURCE
   procedure Notebook_Select(Notebook: in Ttk_Notebook; TabId: in String) with
      Pre'Class => TabId /= "";
      -- ****

      -- ****f* TtkNotebook/TtkNotebook.Get_Selected
      -- FUNCTION
      -- Get selected tab indentifier in the selected Ttk_Notebook
      -- PARAMETERS
      -- Notebook - Ttk_Notebook which will be queried for selected tab
      -- RESULT
      -- Identifier of the selected tab in Notebook
      -- HISTORY
      -- 8.6.2 - Added
      -- EXAMPLE
      -- -- Get the identifier of the selected tab in My_Notebook notebook
      -- Tab_Index: constant String := Get_Selected(My_Notebook);
      -- COMMANDS
      -- Notebook select
      -- SOURCE
   function Get_Selected(Notebook: in Ttk_Notebook) return String;
   -- ****

   -- ****f* TtkNotebook/TtkNotebook.Tab_(procedure)
   -- FUNCTION
   -- Set a new values for the selected options of the selected tab in the
   -- selected Ttk_Notebook
   -- PARAMETERS
   -- Notebook - Ttk_Notebook in which the tab will be set
   -- TabId    - Id of the tab which options will be set
   -- Options  - List of options with their new values
   -- HISTORY
   -- 8.6.6 - Added
   -- EXAMPLE
   -- -- Set the title of the second tab in My_Notebook notebook to my new tab
   -- Tab(My_Notebook, "1", "-text {my new tab}");
   -- COMMANDS
   -- Notebook tab tabid ?options?
   -- SEE ALSO
   -- TtkNotebook.Tab_(function)
   -- SOURCE
   procedure Tab(Notebook: in Ttk_Notebook; TabId, Options: in String) with
      Pre'Class => TabId /= "" and Options /= "";
      -- ****

      -- ****f* TtkNotebook/TtkNotebook.Tab_(function)
      -- FUNCTION
      -- Get the value of the options of the selected tab in the selected
      -- Ttk_Notebook
      -- PARAMETERS
      -- Notebook - Ttk_Notebook in which tab will be queried for the options
      -- TabId    - Id of the tab which options will be queried
      -- Option   - Name of the option to get. Can be empty. Default value is
      --            empty
      -- RESULT
      -- If Option is specified, return value of this option, otherwise return
      -- names and values of all options of the selected tab
      -- HISTORY
      -- 8.6.6 - Added
      -- EXAMPLE
      -- -- Get the title of the last tab in My_Notebook notebook
      -- Title: constant String := Tab(My_Notebook, "end", "-text");
      -- COMMANDS
      -- Notebook tab tabid
      -- SEE ALSO
      -- TtkNotebook.Tab_(procedure)
      -- SOURCE
   function Tab
     (Notebook: in Ttk_Notebook; TabId: in String; Option: in String := "")
      return String with
      Pre'Class => TabId /= "";
      -- ****

      -- ****f* TtkNotebook/TtkNotebook.Tabs
      -- FUNCTION
      -- Get the list of windows names managed by Ttk_Notebook
      -- PARAMETERS
      -- Notebook - Ttk_Notebook which will be queried for subwindows
      -- RESULT
      -- A list of names of the windows managed by Notebook
      -- HISTORY
      -- 8.6.6 - Added
      -- EXAMPLE
      -- -- Get the names of the windows managed by My_Notebook notebook
      -- Names: constant String := Tabs(My_Notebook);
      -- COMMANDS
      -- Notebook tabs
      -- SOURCE
   function Tabs(Notebook: in Ttk_Notebook) return String;
   -- ****

private

   type Ttk_Notebook is new Tk_Widget with null record;

end Tcl.Tk.Ada.Widgets.TtkNotebook;

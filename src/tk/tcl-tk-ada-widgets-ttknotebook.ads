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

-- ****h* Widgets/TtkNotebook
-- FUNCTION
-- Provides code for manipulate Tk widget Ttk::Notebook
-- SOURCE
package Tcl.Tk.Ada.Widgets.TtkNotebook is
-- ****

   -- ****t* TtkNotebook/Ttk_Notebook
   -- FUNCTION
   -- This is a non-abstract type derived directly from Tk_Widget.
   -- Each of the derived widgets redefines the Create subprogram
   -- in order to create the correct type of widget.
   -- SOURCE
   type Ttk_Notebook is new Tk_Widget with private;
   -- ****

   -- ****f* TtkNotebook/Create (function)
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
   -- SOURCE
   overriding function Create
     (pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) return Ttk_Notebook with
      Pre => pathName /= "";
      -- ****

   -- ****f* TtkNotebook/Create (procedure)
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
      -- SOURCE
   overriding procedure Create
     (Widgt: out Ttk_Notebook; pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) with
      Pre => pathName /= "";
      -- ****

      -- ****f* TtkNotebook/Add
      -- FUNCTION
      -- Add a new window to the selected notebook
      -- PARAMETERS
      -- Notebook   - Ttk_Notebook to which window will be added
      -- WindowName - A name of widget to add to Ttk_Notebook
      -- Options    - Tk options for added window. Default value is empty
      -- SOURCE
   procedure Add
     (Notebook: in Ttk_Notebook; WindowName: in String;
      Options: String := "") with
      Pre => WindowName /= "";
      -- ****

      -- ****f* TtkNotebook/Forget
      -- FUNCTION
      -- Remove the selected tab and unmap the associated window
      -- PARAMETERS
      -- Notebook - Ttk_Notebook in which the tab will be removed
      -- TabId    - Id of the tab to remove
      -- HISTORY
      -- 8.6.5 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   procedure Forget(Notebook: in Ttk_Notebook; TabId: in String) with
      Pre => TabId /= "";
      -- ****

      -- ****f* TtkNotebook/Hide
      -- FUNCTION
      -- Hide selected tab. Hidden tab can be restored with Add procedure
      -- PARAMETERS
      -- Notebook - Ttk_Notebook in which tab will be hidden
      -- TabId    - Id of the tab to hide
      -- SOURCE
   procedure Hide(Notebook: in Ttk_Notebook; TabId: in String) with
      Pre => TabId /= "";
      -- ****

      -- ****f* TtkNotebook/Identify_Element
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
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Identify_Element
     (Notebook: in Ttk_Notebook; X, Y: in String) return String with
      Pre => X /= "" and Y /= "";
      -- ****

      -- ****f* TtkNotebook/Notebook_Select
      -- FUNCTION
      -- Set selected tab as a currently selected in the Ttk_Notebook
      -- PARAMETERS
      -- Notebook - Ttk_Notebook in which the tab will be selected
      -- TabId    - Id of the tab to select
      -- SOURCE
   procedure Notebook_Select(Notebook: in Ttk_Notebook; TabId: in String) with
      Pre => TabId /= "";
      -- ****

      -- ****f* TtkNotebook/Get_Selected
      -- FUNCTION
      -- Get selected tab indentifier in the selected Ttk_Notebook
      -- PARAMETERS
      -- Notebook - Ttk_Notebook which will be queried for selected tab
      -- RESULT
      -- Identifier of the selected tab in Notebook
      -- SOURCE
   function Get_Selected(Notebook: in Ttk_Notebook) return String;
   -- ****

private

   type Ttk_Notebook is new Tk_Widget with null record;

end Tcl.Tk.Ada.Widgets.TtkNotebook;

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

-- ****h* Widgets/Menu
-- FUNCTION
-- Provides code for manipulate Tk widget Menu
-- SOURCE
package Tcl.Tk.Ada.Widgets.Menu is
-- ****

   -- ****t* Menu/Tk_Menu
   -- FUNCTION
   -- This is a non-abstract type derived directly from Tk_Widget.
   -- Each of the derived widgets redefines the Create subprogram
   -- in order to create the correct type of widget.
   -- SOURCE
   type Tk_Menu is new Tk_Widget with private;
   -- ****

   -- ****f* Menu/Create
   -- FUNCTION
   -- Creates a new Tk_Menu in the specified interpreter.
   -- PARAMETERS
   -- Widgt    - Tk_Menu which will be created
   -- pathName - Tk path (starts with dot) for the widget
   -- options  - Options which will be passed to the widget. Default value is
   --            empty
   -- Interp   - Tcl interpreter to which the widget will be created. If null,
   --            the widget will be created in the "contextual" interpreter.
   --            Default value is null.
   -- RESULT
   -- Newly created Tk_Menu
   -- SOURCE
   overriding function Create
     (pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) return Tk_Menu with
      Pre => pathName /= "";
   overriding procedure Create
     (Widgt: out Tk_Menu; pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) with
      Pre => pathName /= "";
      -- ****

      -- ****f* Menu/Activate
      -- FUNCTION
      -- Activate the selected item in the selected menu. Previously active
      -- is deactivated.
      -- PARAMETERS
      -- MenuWidget - Tk_Menu in which item will be activated
      -- Index      - Index of the item to activate
      -- HISTORY
      -- 8.6.4 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   procedure Activate(MenuWidget: in Tk_Menu'Class; Index: in String) with
      Pre => Index /= "";
      -- ****

      -- ****f* Menu/AddMenu
      -- FUNCTION
      -- Add element to the menu.
      -- PARAMETERS
      -- MenuWidget - Tk_Menu widget to which the element will be added
      -- EntryType  - Tk type of entry to add
      -- Options    - Tk options for menu entry to add. Default value is empty
      -- SOURCE
   procedure Add
     (MenuWidget: in Tk_Menu'Class; EntryType: in String;
      Options: in String := "") with
      Pre => EntryType /= "";
      -- ****

      -- ****f* Menu/Clone
      -- FUNCTION
      -- Make a clone of the selected menu
      -- PARAMETERS
      -- MenuWidget  - Tk_Menu which will be cloned
      -- NewPathName - Name of a newly created clone menu
      -- CloneType   - Type of newly created clone menu
      -- HISTORY
      -- 8.6.4 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   procedure Clone
     (MenuWidget: in Tk_Menu'Class; NewPathName, CloneType: in String) with
      Pre => NewPathName /= "" and
      CloneType in "normal" | "menubar" | "tearoff" | "";
      -- ****

      -- ****f* Menu/Delete
      -- FUNCTION
      -- Delete elements from the menu.
      -- PARAMETERS
      -- MenuWidget - Tk_Menu widget from which elementrs will be deleted
      -- StartIndex - Index of first element which will be deleted
      -- EndIndex   - Index of last element which will be deleted. If empty,
      --              it will be that same like StartIndex. Default is empty.
      -- SOURCE
   procedure Delete
     (MenuWidget: in Tk_Menu; StartIndex: in String;
      EndIndex: in String := "") with
      Pre => StartIndex /= "";
      -- ****

      -- ****f* Menu/Entry_Cget
      -- FUNCTION
      -- Get current value of the selected option of the selected entry in the
      -- selected Tk_Menu
      -- PARAMETERS
      -- MenuWidget - Tk_Menu widget in which option will be queried
      -- Index      - Index of the menu entry for which option will be queried
      -- Option     - Name of the option to query
      -- RESULT
      -- Current value of the selected Option in the selected menu entry
      -- HISTORY
      -- 8.6.4 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Entry_Cget
     (MenuWidget: in Tk_Menu; Index, Option: in String) return String with
      Pre => Index /= "" and Option /= "";
      -- ****

      -- ****f* Menu/Entry_Configure (procedure)
      -- FUNCTION
      -- Configure selected menu entry
      -- PARAMETERS
      -- MenuWidget - Tk_Menu widget from which entry will be configured
      -- Index      - Index of the menu entry to configure
      -- Options    - Tk options for the menu entry
      -- SOURCE
   procedure Entry_Configure
     (MenuWidget: in Tk_Menu; Index, Options: in String) with
      Pre => Index /= "" and Options /= "";
      -- ****

      -- ****f* Menu/Entry_Configure (function)
      -- FUNCTION
      -- Get configuration of the selected menu entry
      -- PARAMETERS
      -- MenuWidget - Tk_Menu widget from which entry configuration will be
      --              taken
      -- Index      - Index of the menu entry to get configuration
      -- RESULT
      -- String with list of options and their values for the selected menu
      -- entry
      -- SOURCE
   function Entry_Configure
     (MenuWidget: in Tk_Menu; Index: in String) return String with
      Pre => Index /= "";
      -- ****

      -- ****f* Menu/Index
      -- FUNCTION
      -- Get the numerical index of the selected menu entry in the selected
      -- menu
      -- PARAMETERS
      -- MenuWidget - Tk_Menu widget in which entry will be queried
      -- Index      - Index of the entry to query
      -- RESULT
      -- Numerical index of the selected menu entry or none if Index was set
      -- to none
      -- HISTORY
      -- 8.6.4 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Index(MenuWidget: in Tk_Menu; Index: in String) return String with
      Pre => Index /= "";
      -- ****

      -- ****f* Menu/Insert
      -- FUNCTION
      -- Add the selected menu entry before other selected entry.
      -- PARAMETERS
      -- MenuWidget - Tk_Menu widget to which the element will be added
      -- Index      - Index of the other menu entry before which this entry
      --              will be added
      -- EntryType  - Tk type of entry to add
      -- Options    - Tk options for menu entry to add. Default value is empty
      -- HISTORY
      -- 8.6.4 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   procedure Insert
     (MenuWidget: in Tk_Menu'Class; Index, EntryType: in String;
      Options: in String := "") with
      Pre => Index /= "" and EntryType /= "";
      -- ****

      -- ****f* Menu/Invoke
      -- FUNCTION
      -- Invoke command associated with the selected menu entry in the selected
      -- menu
      -- PARAMETERS
      -- MenuWidget - Tk_Menu widget from which entry will be activated
      -- Index      - Index of the menu entry to activate
      -- RESULT
      -- Value returned by the invoked command
      -- SOURCE
   function Invoke(MenuWidget: in Tk_Menu; Index: in String) return String with
      Pre => Index /= "";
      -- ****

      -- ****f* Menu/Post (procedure)
      -- FUNCTION
      -- Display the selected menu at the selected coordinates
      -- PARAMETERS
      -- MenuWidget - Tk_Menu widget which will be shown
      -- X          - X coordinate in the root window where Tk_Menu will be
      --              shown
      -- Y          - Y coordinate in the root window where Tk_Menu will be
      --              shown
      -- HISTORY
      -- 8.6.4 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   procedure Post(MenuWidget: in Tk_Menu; X, Y: in String) with
      Pre => X /= "" and Y /= "";
      -- ****

      -- ****f* Menu/Post (function)
      -- FUNCTION
      -- Display the selected menu at the selected coordinates
      -- PARAMETERS
      -- MenuWidget - Tk_Menu widget which will be shown
      -- X          - X coordinate in the root window where Tk_Menu will be
      --              shown
      -- Y          - Y coordinate in the root window where Tk_Menu will be
      --              shown
      -- RESULT
      -- If Postcommand was set for the selecte MenuWidget, return result of
      -- this command. If error occured during posting the menu, return error.
      -- Otherwise return {}
      -- HISTORY
      -- 8.6.4 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Post(MenuWidget: in Tk_Menu; X, Y: in String) return String with
      Pre => X /= "" and Y /= "";
      -- ****

      -- ****f* Menu/PostCascade
      -- FUNCTION
      -- Show submenu associated with the cascade entry with the selected
      -- index. Unpost previously posted submenu
      -- PARAMETERS
      -- MenuWidget - Tk_Menu from which submenu will be taken
      -- Index      - Index of cascade menu entry to show
      -- HISTORY
      -- 8.6.4 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   procedure PostCascade(MenuWidget: in Tk_Menu; Index: in String) with
      Pre => Index /= "";
      -- ****

private

   type Tk_Menu is new Tk_Widget with null record;

end Tcl.Tk.Ada.Widgets.Menu;

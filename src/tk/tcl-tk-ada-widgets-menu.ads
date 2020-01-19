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

with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

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

   -- ****t* Menu/Menu_Items
   -- FUNCTION
   -- Types of menu entries
   -- SOURCE
   type Menu_Items is (CASCADE, CHECKBUTTON, COMMAND, RADIOBUTTON, SEPARATOR);
   -- ****

   -- ****t* Menu/Menu_Entry_States
   -- FUNCTION
   -- Possible states of menu entry
   -- SOURCE
   type Menu_Entry_States is (NORMAL, ACTIVE, DISABLED);
   -- ****

   -- ****t* Menu/Menu_Entry_Options
   -- FUNCTION
   -- Provide options data structure for creating menu entries
   -- PARAMETERS
   -- MType         - Menu_Items type of the menu entry
   -- Label         - Text to display on the menu entry
   -- Command       - Tcl command to execute when the menu entry was activated
   -- Underline     - Number of character (starts from 0) in the menu entry
   --                 label which will be used as keyboard shortcut. -1 mean
   --                 no keyboard shortcut.
   -- Accelerator   - Text to display as keyboard accelerator for the menu
   --                 entry
   -- State         - Menu_Entry_States state of the menu entry
   -- Other         - Other, additional options for the menu entry
   -- SubMenu       - CASCADE menu entry only - path for submenu which will be
   --                 added to this menu
   -- CheckVariable - CHECKBUTTON menu entry only - Tcl global variable in
   --                 which value of the menu entry will be stored when the
   --                 menu entry will be activated
   -- Value         - RADIOBUTTON menu entry only - value for the menu entry
   --                 which will be set when this menu entry will be activated.
   --                 If empty, this will be value of parameter Label.
   -- RadioVariable - RADIOBUTTON menu entry only - Tcl  global variable in
   --                 which value of the menu entry will be stored when the
   --                 menu entry will be activated
   -- SOURCE
   type Menu_Entry_Options(MType: Menu_Items := COMMAND) is record
      Label: Unbounded_String;
      Command: Unbounded_String;
      Underline: Integer range -1 .. Integer'Last;
      Accelerator: Unbounded_String;
      State: Menu_Entry_States;
      Other: Unbounded_String;
      case MType is
         when CASCADE =>
            SubMenu: Unbounded_String;
         when CHECKBUTTON =>
            CheckVariable: Unbounded_String;
         when RADIOBUTTON =>
            Value: Unbounded_String;
            RadioVariable: Unbounded_String;
         when others =>
            null;
      end case;
   end record;
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
   function Create
     (pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) return Tk_Menu;
   procedure Create
     (Widgt: out Tk_Menu; pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null);
   -- ****

   -- ****f* Menu/AddMenu
   -- FUNCTION
   -- Add element to the menu.
   -- PARAMETERS
   -- MenuWidget - Tk_Menu widget to which the element will be added
   -- Options    - Menu_Entry_Options options for menu entry
   -- SOURCE
   procedure Add(MenuWidget: in Tk_Menu'Class; Options: in Menu_Entry_Options);
   -- ****

private

   type Tk_Menu is new Tk_Widget with null record;

end Tcl.Tk.Ada.Widgets.Menu;

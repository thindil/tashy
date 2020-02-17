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

   -- ****f* TtkPanedWindow/Create
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
   -- RESULT
   -- Newly created Ttk_PanedWindow
   -- SOURCE
   function Create
     (pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) return Ttk_PanedWindow with
      Pre => pathName /= "";
   procedure Create
     (Widgt: out Ttk_PanedWindow; pathName: in String;
      options: in String := ""; Interp: in Tcl_Interp := null) with
      Pre => pathName /= "";
      -- ****

      -- ****f* TtkPanedWindow/Add
      -- FUNCTION
      -- Adds the Tk_Widget to the Ttk_PanedWindow.
      -- PARAMETERS
      -- Paned     - Ttk_PanedWindow to which SubWindow will be added
      -- SubWindow - Tk_Widget which will be added to the Ttk_PanedWindow
      -- Options   - Tk options which will be passed to the command. Default
      --             value is empty.
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
   -- SOURCE
   procedure Forget(Paned: in Ttk_PanedWindow; SubWindow: in Tk_Widget'Class);
   -- ****

   -- ****f* TtkPanedWindow/Panes
   -- FUNCTION
   -- Get list of names of all widgets managed by the Ttk_PanedWindow
   -- PARAMETERS
   -- Paned - Ttk_PanedWindow which will be queried for widgets
   -- RESULT
   -- List of widgets inside of Ttk_PanedWindow
   -- SOURCE
   function Panes(Paned: in Ttk_PanedWindow) return String;
   -- ****

private

   type Ttk_PanedWindow is new Tk_Widget with null record;

end Tcl.Tk.Ada.Widgets.TtkPanedWindow;

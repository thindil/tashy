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

-- ****h* TtkEntry/TtkSpinBox
-- FUNCTION
-- Provides code for manipulate Tk widget Ttk::SpinBox
-- SOURCE
package Tcl.Tk.Ada.Widgets.TtkEntry.TtkSpinBox is
-- ****

   -- ****t* TtkSpinBox/Ttk_SpinBox
   -- FUNCTION
   -- This is a non-abstract type derived directly from Tk_Widget.
   -- Each of the derived widgets redefines the Create subprogram
   -- in order to create the correct type of widget.
   -- SOURCE
   type Ttk_SpinBox is new Ttk_Entry with private;
   -- ****

   -- ****f* TtkSpinBox/Create (function)
   -- FUNCTION
   -- Creates a new Ttk_SpinBox in the specified interpreter.
   -- PARAMETERS
   -- pathName - Tk path (starts with dot) for the widget
   -- options  - Options which will be passed to the widget. Default value is
   --            empty
   -- Interp   - Tcl interpreter to which the widget will be created. If null,
   --            the widget will be created in the "contextual" interpreter.
   --            Default value is null.
   -- RESULT
   -- Newly created Ttk_SpinBox
   -- SOURCE
   overriding function Create
     (pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) return Ttk_SpinBox with
      Pre => pathName /= "";
      -- ****

   -- ****f* TtkSpinBox/Create (procedure)
   -- FUNCTION
   -- Creates a new Ttk_SpinBox in the specified interpreter.
   -- PARAMETERS
   -- Widgt    - Ttk_SpinBox which will be created
   -- pathName - Tk path (starts with dot) for the widget
   -- options  - Options which will be passed to the widget. Default value is
      --            empty
   -- Interp   - Tcl interpreter to which the widget will be created. If null,
      --            the widget will be created in the "contextual" interpreter.
      --            Default value is null.
      -- SOURCE
   overriding procedure Create
     (Widgt: out Ttk_SpinBox; pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) with
      Pre => pathName /= "";
      -- ****

      -- ****f* TtkSpinBox/Current (function)
      -- FUNCTION
      -- Get the current value of the selected Ttk_SpinBox
      -- PARAMETERS
      -- SpinBox - Ttk_SpinBox which the current value will be queried
      -- RESULT
      -- The current value of the SpinBox or "-1" if the value is not in the
      -- list of values for the SpinBox
      -- HISTORY
      -- 8.6.6 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Current(SpinBox: in Ttk_SpinBox) return String;
   -- ****

   -- ****f* TtkSpinBox/Current
   -- FUNCTION
   -- Set the current value for the selected Ttk_SpinBox
   -- PARAMETERS
   -- SpinBox  - Ttk_SpinBox which the current value will be set
   -- NewIndex - A new index of the item from the list of values for the
   --            SpinBox which will be set as the current value
   -- HISTORY
   -- 8.6.6 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   procedure Current(SpinBox: in Ttk_SpinBox; NewIndex: in String) with
      Pre => NewIndex /= "";
      -- ****

      -- ****f* TtkSpinBox/Set
      -- FUNCTION
      -- Set the value of the selected Ttk_SpinBox
      -- PARAMETERS
      -- SpinBox - Ttk_SpinBox which value will be set
      -- Value   - A new value for the SpinBox
      -- HISTORY
      -- 8.6.6 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   procedure Set(SpinBox: in Ttk_SpinBox; Value: in String);
   -- ****

private

   type Ttk_SpinBox is new Ttk_Entry with null record;

end Tcl.Tk.Ada.Widgets.TtkEntry.TtkSpinBox;

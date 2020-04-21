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

-- ****h* Widgets/PanedWindow
-- FUNCTION
-- Provides code for manipulate Tk widget PanedWindow
-- SOURCE
package Tcl.Tk.Ada.Widgets.PanedWindow is
-- ****

   -- ****t* PanedWindow/Tk_Paned_Window
   -- FUNCTION
   -- This is a non-abstract type derived directly from Tk_Widget.
   -- Each of the derived widgets redefines the Create subprogram
   -- in order to create the correct type of widget.
   -- SOURCE
   type Tk_PanedWindow is new Tk_Widget with private;
   -- ****

   -- ****f* PanedWindow/Create
   -- FUNCTION
   -- Creates a new Tk_PanedWindow in the specified interpreter.
   -- PARAMETERS
   -- Widgt    - Tk_PanedWindow which will be created
   -- pathName - Tk path (starts with dot) for the widget
   -- options  - Options which will be passed to the widget. Default value is
   --            empty
   -- Interp   - Tcl interpreter to which the widget will be created. If null,
   --            the widget will be created in the "contextual" interpreter.
   --            Default value is null.
   -- RESULT
   -- Newly created Tk_PanedWindow
   -- SOURCE
   overriding function Create
     (pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) return Tk_PanedWindow with
      Pre => pathName /= "";
   overriding procedure Create
     (Widgt: out Tk_PanedWindow; pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) with
      Pre => pathName /= "";
      -- ****

      -- ****f* PanedWindow/Add
      -- FUNCTION
      -- Adds the Tk_Widget to the Tk_PanedWindow.
      -- PARAMETERS
      -- Paned     - Tk_PanedWindow to which SubWindow will be added
      -- SubWindow - Tk_Widget which will be added to the Tk_PanedWindow
      -- Options   - Tk options which will be passed to the command. Default
      --             value is empty.
      -- HISTORY
      -- 8.6.4 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   procedure Add
     (Paned: in Tk_PanedWindow; SubWindow: in Tk_Widget'Class;
      Options: in String := "");
   -- ****

   -- ****f* PanedWindow/Forget
   -- FUNCTION
   -- Remove the Tk_Widget from the Tk_PanedWindow
   -- PARAMETERS
   -- Paned     - Tk_PanedWindow from which SubWindow will be removed
   -- SubWindow - Tk_Widget which will be removed from the Tk_PanedWindow
   -- HISTORY
   -- 8.6.4 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   procedure Forget(Paned: in Tk_PanedWindow; SubWindow: in Tk_Widget'Class);
   -- ****

   -- ****f* PanedWindow/Identify
   -- FUNCTION
   -- Identify Tk_PanedWindow component at the selected point in window
   -- coordinates
   -- PARAMETERS
   -- Paned - Tk_PanedWindow which will be queried
   -- X     - X coordinate to check
   -- Y     - Y coordinate to check
   -- RESULT
   -- If point is over sash or sash handle return two values: index of the
   -- sash or handle and a word indicating whether it is over a sash or a
   -- handle, such as {0 sash} or {2 handle}. If the point is over any other
   -- part of the window, return {}
   -- HISTORY
   -- 8.6.4 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   function Identify
     (Paned: in Tk_PanedWindow; X, Y: in String) return String with
      Pre => X /= "" and Y /= "";
      -- ****

      -- ****f* PanedWindow/Proxy_Coord
      -- FUNCTION
      -- Get coordinates of current positon of sash proxy
      -- PARAMETERS
      -- Paned - Tk_PanedWindow which will be queried for coordinates
      -- RESULT
      -- List of coordinates (X and Y) of the most recent proxy location
      -- HISTORY
      -- 8.6.4 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Proxy_Coord(Paned: in Tk_PanedWindow) return String;
   -- ****

   -- ****f* PanedWindow/Proxy_Forget
   -- FUNCTION
   -- Remove the proxy from the display
   -- PARAMETERS
   -- Paned - Tk_PanedWindow which the proxy will be removed
   -- HISTORY
   -- 8.6.4 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   procedure Proxy_Forget(Paned: in Tk_PanedWindow);
   -- ****

private

   type Tk_PanedWindow is new Tk_Widget with null record;

end Tcl.Tk.Ada.Widgets.PanedWindow;

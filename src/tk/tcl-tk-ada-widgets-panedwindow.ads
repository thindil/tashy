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

   -- ****f* PanedWindow/Create (function)
   -- FUNCTION
   -- Creates a new Tk_PanedWindow in the specified interpreter.
   -- PARAMETERS
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
      -- ****

   -- ****f* PanedWindow/Create (procedure)
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
      -- SOURCE
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

      -- ****f*  PanedWindow/Pane_Cget
      -- FUNCTION
      -- Get value of the selected option of the selected window in the
      -- selected Tk_PanedWindow
      -- PARAMETERS
      -- Paned  - Tk_PanedWindow in which option will be queried
      -- Window - Name of the window inside Paned which option will be queried
      -- Option - Option to query
      -- RESULT
      -- Current value of the selected Option for the selected Window
      -- HISTORY
      -- 8.6.4 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Pane_Cget
     (Paned: in Tk_PanedWindow; Window, Option: in String) return String with
      Pre => Window /= "" and Option /= "";

      -- ****f* PanedWindow/Pane_Configure (procedure)
      -- FUNCTION
      -- Modify the selected options of the selected window in the selected
      -- Tk_PanedWindow
      -- PARAMETERS
      -- Paned   - Tk_PanedWindow in which options will be modified
      -- Window  - Name of the window inside Paned which options will be
      --           modified
      -- Options - Options names with new values for them
      -- HISTORY
      -- 8.6.4 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   procedure Pane_Configure
     (Paned: in Tk_PanedWindow; Window, Options: in String) with
      Pre => Window /= "" and Options /= "";
      -- ****

      -- ****f* PanedWindow/Pane_Configure (function)
      -- FUNCTION
      -- Modify or query the selected options of the selected window in the
      -- selected Tk_PanedWindow
      -- PARAMETERS
      -- Paned   - Tk_PanedWindow in which options will be modified or
      --           queried
      -- Window  - Name of the window inside Paned which options will be
      --           modified or queried
      -- Options - Options names with new values for them. Can be empty.
      --           Default value is empty
      -- RESULT
      -- List of options with current values for them. If used to modify the
      -- selected Options returns {}
      -- HISTORY
      -- 8.6.4 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Pane_Configure
     (Paned: in Tk_PanedWindow; Window: in String; Options: in String := "")
      return String with
      Pre => Window /= "";
      -- ****

      -- ****f* PanedWindow/Panes
      -- FUNCTION
      -- Get list of names of all widgets managed by the Tk_PanedWindow
      -- PARAMETERS
      -- Paned - Tk_PanedWindow which will be queried for widgets
      -- RESULT
      -- List of widgets inside of Tk_PanedWindow
      -- HISTORY
      -- 8.6.4 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Panes(Paned: in Tk_PanedWindow) return String;
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

   -- ****f* PanedWindow/Proxy_Place
   -- FUNCTION
   -- Place the proxy at the given x and y coordinates
   -- PARAMETERS
   -- Paned - Tk_PanedWindow in which the proxy will be placed
   -- X     - X coordinate of new point for the proxy
   -- Y     - Y coordinate of new point for the proxy
   -- HISTORY
   -- 8.6.4 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   procedure Proxy_Place(Paned: in Tk_PanedWindow; X, Y: in String) with
      Pre => X /= "" and Y /= "";
      -- ****

      -- ****f* PanedWindow/Sash_Coord
      -- FUNCTION
      -- Get coordinates of the selected sash in the selected Tk_PanedWindow
      -- PARAMETERS
      -- Paned - Tk_PanedWindow which will be queried for sash coordinates
      -- Index - Index of the sash which coordinates will be queried
      -- RESULT
      -- Coordinates X and Y of top left corner of the selected sash
      -- HISTORY
      -- 8.6.4 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Sash_Coord
     (Paned: in Tk_PanedWindow; Index: in String) return String with
      Pre => Index /= "";
      -- ****

      -- ****f* PanedWindow/Sash_DragTo
      -- FUNCTION
      -- Move the selected sash by difference between given coordinates and
      -- last Sash_Mark procedure call
      -- PARAMETERS
      -- Paned - Tk_PanedWindow in which the selected sash will be moved
      -- Index - Index of the sash to move
      -- X     - X coordinate for compute a new position for the sash
      -- Y     - Y coordinate for compute a new position for the sash
      -- HISTORY
      -- 8.6.4 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   procedure Sash_DragTo(Paned: in Tk_PanedWindow; Index, X, Y: in String) with
      Pre => Index /= "" and X /= "" and Y /= "";
      -- ****

      -- ****f* PanedWindow/Sash_Mark
      -- FUNCTION
      -- Set position which will be later used to move sash with procedure
      -- Sash_DragTo
      -- PARAMETERS
      -- Paned - Tk_PanedWindow in which the selected sash coordinates will be
      --         marked
      -- Index - Index of the sash to mark
      -- X     - X coordinate a new position to mark
      -- Y     - Y coordinate a new position to mark
      -- HISTORY
      -- 8.6.4 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   procedure Sash_Mark(Paned: in Tk_PanedWindow; Index, X, Y: in String) with
      Pre => Index /= "" and X /= "" and Y /= "";
      -- ****

      -- ****f* PanedWindow/Sash_Place
      -- FUNCTION
      -- Place the selected sash at the selected coordinates
      -- PARAMETERS
      -- Paned - Tk_PanedWindow in which sash will be moved
      -- Index - Index of the sash to move
      -- X     - X coordinate where the sash will be placed
      -- Y     - Y coordinate where the sash will be placed
      -- HISTORY
      -- 8.6.4 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   procedure Sash_Place(Paned: in Tk_PanedWindow; Index, X, Y: in String) with
      Pre => Index /= "" and X /= "" and Y /= "";
      -- ****

private

   type Tk_PanedWindow is new Tk_Widget with null record;

end Tcl.Tk.Ada.Widgets.PanedWindow;

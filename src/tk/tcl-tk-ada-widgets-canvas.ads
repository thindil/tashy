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

-- ****h* Widgets/Canvas
-- FUNCTION
-- Provides code for manipulate Tk widget Canvas
-- SOURCE
package Tcl.Tk.Ada.Widgets.Canvas is
-- ****

   -- ****t* Canvas/Tk_Canvas
   -- FUNCTION
   -- This is a non-abstract type derived directly from Tk_Widget.
   -- Each of the derived widgets redefines the Create subprogram
   -- in order to create the correct type of widget.
   -- SOURCE
   type Tk_Canvas is new Tk_Widget with private;
   -- ****

   -- ****f* Canvas/Create
   -- FUNCTION
   -- Creates a new Tk_Canvas in the specified interpreter.
   -- PARAMETERS
   -- Widgt    - Tk_Canvas which will be created
   -- pathName - Tk path (starts with dot) for the widget
   -- options  - Options which will be passed to the widget. Default value is
   --            empty
   -- Interp   - Tcl interpreter to which the widget will be created. If null,
   --            the widget will be created in the "contextual" interpreter.
   --            Default value is null.
   -- RESULT
   -- Newly created Tk_Canvas
   -- SOURCE
   overriding function Create
     (pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) return Tk_Canvas with
      Pre => pathName /= "";
   overriding procedure Create
     (Widgt: out Tk_Canvas; pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) with
      Pre => pathName /= "";
      -- ****

      -- ****f* Canvas/Add_Tag
      -- FUNCTION
      -- Add tag to the selected items in the Tk_Canvas
      -- PARAMETERS
      -- Tag        - Tag name to add
      -- SearchSpec - Requirement which item must meet to be selected
      -- Arguments  - Arguments for the SearchSpec. Default value is empty
      -- SOURCE
   procedure Add_Tag
     (CanvasWidget: in Tk_Canvas; Tag, SearchSpec: in String;
      Arguments: in String := "") with
      Pre => Tag /= "" and
      SearchSpec in "above" | "all" | "below" | "closest" | "enclosed" |
          "overlapping" | "withtag";
      -- ****

      -- ****f* Canvas/BBox
      -- FUNCTION
      -- Get size of bounding box of items with the selected Tag in the
      -- selected Tk_Canvas
      -- PARAMETERS
      -- CanvasWidget - Tk_Canvas which will be queried
      -- Tag          - Tag or Id of items from which bounding box will be
      --                taken
      -- RESULT
      -- Four values: x1, y1 - coordinates of starting point of bounding box
      -- from top left, x2, y2 - coordinates of ending point from bottom right
      -- of bounding box.
      -- SOURCE
   function BBox
     (CanvasWidget: in Tk_Canvas; TagOrId: in String) return String with
      Pre => TagOrId /= "";
      -- ****

      -- ****f* Canvas/Bind
      -- FUNCTION
      -- Bind the selected command to the selected item in the selected canvas
      -- with the selected sequence
      -- PARAMETERS
      -- CanvasWidget - Tk_Canvas in which bind will be done
      -- TagOrId      - Tag or Id of items to which bind will be done
      -- Sequence     - Sequence to which command will be bound
      -- Command      - Tcl command which will be bound
      -- SOURCE
   procedure Bind
     (CanvasWidget: in Tk_Canvas; TagOrId, Sequence, Command: in String) with
      Pre => TagOrId /= "" and Sequence /= "" and Command /= "";
      -- ****

      -- ****f* Canvas/Bind2
      -- FUNCTION
   -- Get information about binding to selected items in the selected
   -- canvas
   -- PARAMETERS
   -- CanvasWidget - Tk_Canvas which will be queried for the info
   -- TagOrId      - Tag or Id of items which will be queried for the bindings
   -- Sequence     - Sequence to query. Default is empty
   -- RESULT
   -- If sequence is empty, return all bindings associated with the selected
   -- items. Otherwise, return command associated with the selected item and
   -- its sequence
   -- SOURCE
   function Bind
     (CanvasWidget: in Tk_Canvas; TagOrId: in String;
      Sequence: in String := "") return String with
      Pre => TagOrId /= "";
      -- ****

      -- ****f* Canvas/CanvasX
      -- FUNCTION
      -- Get canvas X coordinate for the selected screen X coordinate
      -- PARAMETERS
      -- CanvasWidget - Tk_Canvas which will be queried for X coordinate
      -- ScreenX      - Screen X coordinate which will be looking for in the
      --                CanvasWidget
      -- GridSpacing  - If specified, round result to nearest multiple of
      --                GridSpacing units. Default is empty
      -- RESULT
      -- Canvas X coordinate for the selected screen X coordinate
      -- SOURCE
   function CanvasX
     (CanvasWidget: in Tk_Canvas; ScreenX: in String;
      GridSpacing: in String := "") return String with
      Pre => ScreenX /= "";
      -- ****

      -- ****f* Canvas/CanvasY
      -- FUNCTION
      -- Get canvas Y coordinate for the selected screen Y coordinate
      -- PARAMETERS
      -- CanvasWidget - Tk_Canvas which will be queried for Y coordinate
      -- ScreenX      - Screen Y coordinate which will be looking for in the
      --                CanvasWidget
      -- GridSpacing  - If specified, round result to nearest multiple of
      --                GridSpacing units. Default is empty
      -- RESULT
      -- Canvas Y coordinate for the selected screen Y coordinate
      -- SOURCE
   function CanvasY
     (CanvasWidget: in Tk_Canvas; ScreenY: in String;
      GridSpacing: in String := "") return String with
      Pre => ScreenY /= "";
      -- ****

      -- ****f* Canvas/Coords
      -- FUNCTION
      -- Set new coordinates for the selected widget inside the selected
      -- Tk_Canvas
      -- PARAMETERS
      -- CanvasWidget - Tk_Canvas in which the widget will be moved
      -- TagOrId      - Tag or Id of the item which will be moved. If Tag
      --                refers to multiple items, only first will be used.
      -- Coordinates  - New coordinates for the item
      -- SOURCE
   procedure Coords
     (CanvasWidget: in Tk_Canvas; TagOrId, Coordinates: in String) with
      Pre => TagOrId /= "" and Coordinates /= "";
      -- ****

      -- ****f* Canvas/Coords2
      -- FUNCTION
      -- Get coordinates for the selected widgets inside the selected Tk_Canvas
      -- PARAMETERS
      -- CanvasWidget - Tk_Canvas in which the widgets will be queried
      -- TagOrId      - Tag or Id of the items which will be queried.
      -- RESULT
      -- List with coordinates of the selected items
      -- SOURCE
   function Coords
     (CanvasWidget: in Tk_Canvas; TagOrId: in String) return String with
      Pre => TagOrId /= "";
      -- ****

      -- ****f* Canvas/Canvas_Create
      -- FUNCTION
      -- Add the child to the canvas
      -- PARAMETERS
      -- Parent     - Tk_Canvas to which child will be added
      -- Child_Type - Tk type of child to add
      -- Options    - Tk options to create command
      -- SOURCE
   procedure Canvas_Create
     (Parent: in Tk_Canvas; Child_Type: in String;
      Options: in String := "") with
      Pre => Child_Type /= "";
      -- ****

      -- ****f* Canvas/Dchars
      -- FUNCTION
      -- Delete characters in the selected items in the selected range
      -- PARAMETERS
      -- CanvasWidget - Tk_Canvas in which characters will be deleted
      -- TagOrId      - Tag or Id of the items in which characters will be
      --                deleted
      -- First        - Index or coordinates where to start deleting characters
      -- Last         - Index or coordinates where to end deleting characters.
      --                Default value is empty
      -- SOURCE
   procedure Dchars
     (CanvasWidget: in Tk_Canvas; TagOrId, First: in String;
      Last: in String := "") with
      Pre => TagOrId /= "" and First /= "";
      -- ****

      -- ****f* Canvas/Delete
      -- FUNCTION
      -- Delete selected items from the selected canvas
      -- PARAMETERS
      -- CanvasWidget - Tk_Canvas in which items will be deleted
      -- TagOrId      - Tag or Id of the items to delete
      -- SOURCE
   procedure Delete(CanvasWidget: in Tk_Canvas; TagOrId: in String) with
      Pre => TagOrId /= "";
      -- ****

      -- ****f* Canvas/DTag
      -- FUNCTION
      -- Delete selected Tag from items in the selected canvas
      -- PARAMETERS
      -- CanvasWidget - Tk_Canvas in which tag will be deleted
      -- TagOrId      - Tag or Id of items from which tag will be deleted
      -- TagToDelete  - Tag to delete. If empty, delete value of parameter
      --                TagOrId. Default value is empty
      -- SOURCE
   procedure DTag
     (CanvasWidget: in Tk_Canvas; TagOrId: in String;
      TagToDelete: in String := "") with
      Pre => TagOrId /= "";
      -- ****

      -- ****f* Canvas/Find
      -- FUNCTION
      -- Find items in the selected canvas
      -- PARAMETERS
      -- CanvasWidget  - Tk_Canvas which will be queried for items
      -- SearchCommand - Search criteria for items. It is that same as
      --                 SearchSpec for Add_Tag procedure.
      -- Arguements    - Arguments for SearchCommand. Must be that same as
      --                 arguments for Add_Tag procedure. Default value is
      --                 empty
      -- RESULT
      -- List of items in the stacking order, the lowest item first
      -- SOURCE
   function Find
     (CanvasWidget: in Tk_Canvas; SearchCommand: in String;
      Arguments: in String := "") return String with
      Pre => SearchCommand /= "";
      -- ****

private

   type Tk_Canvas is new Tk_Widget with null record;

end Tcl.Tk.Ada.Widgets.Canvas;

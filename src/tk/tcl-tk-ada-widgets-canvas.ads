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

      -- ****f* Canvas/Bind (procedure)
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

      -- ****f* Canvas/Bind (function)
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

      -- ****f* Canvas/Coords (procedure)
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

      -- ****f* Canvas/Coords (function)
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

      -- ****f* Canvas/Focus
      -- FUNCTION
      -- Set focused item in the selected canvas
      -- PARAMETERS
      -- CanvasWidget - Tk_Canvas in which focus will be set
      -- TagOrId      - Tag or Id of item to set as focused item. If few items
      --                are with this same tag, only first will be used. If no
      --                item with that tag or TagOrId is empty, reset focus.
      --                Default value is empty
      -- SOURCE
   procedure Focus(CanvasWidget: in Tk_Canvas; TagOrId: in String := "");
   -- ****

   -- ****f* Canvas/Get_Tags
   -- FUNCTION
   -- Get list of tags associated with the selected element in the selected
   -- canvas
   -- PARAMETERS
   -- CanvasWidget - Tk_Canvas in which elements will be queried
   -- TagOrId      - Tag or Id of element from which get tags
   -- RESULT
   -- List of tags associated with the selected TagOrId. If there is more than
   -- one element in the CanvasWidget, return tags for the first element in
   -- the list. If there no element with that TagOrId or element don't have
   -- any tag, return empty string
   -- SOURCE
   function Get_Tags
     (CanvasWidget: in Tk_Canvas; TagOrId: in String) return String with
      Pre => TagOrId /= "";
      -- ****

      -- ****f* Canvas/ICursor
      -- FUNCTION
      -- Set insertion cursor in the selected element on selected position
      -- PARAMETERS
      -- CanvasWidget - Tk_Canvas in which insertion cursor will be set
      -- TagOrId      - Tag or Id of the element in which insertion cursor
      --                will be set. If some or all elements specified by
      --                Tag or Id don't support an insertion cursor, this
      --                procedure do nothing
      -- Index        - Index in characters before which an insertion cursor
      --                will be insererted
      -- SOURCE
   procedure ICursor
     (CanvasWidget: in Tk_Canvas; TagOrId, Index: in String) with
      Pre => TagOrId /= "" and Index /= "";
      -- ****

      -- ****f* Canvas/IMove
      -- FUNCTION
      -- Move index'th coordinate of the selected items to a new location
      -- PARAMETERS
      -- CanvasWidget - Tk_Canvas in which items will be queried
      -- TagOrId      - Tag or Id of items which coordinates will be moved
      -- Index        - Index of coordinate to move. Each item interprets this
      --                value independently
      -- X            - A new X coordinate
      -- Y            - A new Y coordinate
      -- SOURCE
   procedure IMove
     (CanvasWidget: in Tk_Canvas; TagOrId, Index, X, Y: in String) with
      Pre => TagOrId /= "" and Index /= "" and X /= "" and Y /= "";
      -- ****

      -- ****f* Canvas/Index
      -- FUNCTION
      -- Get numerical index of the selected Index in the selected items
      -- PARAMETERS
      -- CanvasWidget - Tk_Canvas in which index will be queried
      -- TagOrId      - Tag or Id of items to query for index
      -- Index        - Depends on the item, it can be coordinate or index of
      --                character in textual description
      -- RESULT
      -- Numerical index of the selected Index in the selected items
      -- SOURCE
   function Index
     (CanvasWidget: in Tk_Canvas; TagOrId, Index: in String) return String with
      Pre => TagOrId /= "" and Index /= "";
      -- ****

      -- ****f* Canvas/Insert
      -- FUNCTION
      -- Insert item in the elements in the selected canvas
      -- PARAMETERS
      -- CanvasWidget - Tk_Canvas in which items will be modified
      -- TagOrId      - Tag or Id of the elements in which Item will be
      --                inserted
      -- BeforeThis   - Insert Item before this value. For text elements, it
      --                will be character number, for lines, polygons
      --                coordinates
      -- Item         - Text to insert to the selected elements
      -- SOURCE
   procedure Insert
     (CanvasWidget: in Tk_Canvas; TagOrId, BeforeThis, Item: in String) with
      Pre => TagOrId /= "" and BeforeThis /= "" and Item /= "";
      -- ****

      -- ****f* Canvas/Item_Cget
      -- FUNCTION
      -- Get configuration option for the selected item in the selected canvas
      -- PARAMETERS
      -- CanvasWidget - Tk_Canvas which will be queried for option
      -- TagOrId      - Tag or Id of the item which will be queried for option
      -- Option       - Tk option to query
      -- RESULT
      -- Current value of the selected option of the selected item. If TagOrId
      -- refers to more than one item, only first item is checked.
      -- SOURCE
   function Item_Cget
     (CanvasWidget: in Tk_Canvas; TagOrId, Option: in String)
      return String with
      Pre => TagOrId /= "" and Option /= "";
      -- ****

      -- ****f* Canvas/Item_Configure
      -- FUNCTION
      -- Queries or modifies the configuration options of the selected item
      -- PARAMETERS
      -- CanvasWidget - Tk_Canvas which will be queried or modified for options
      -- TagOrId      - Tag or Id of the item which will be queried or modified
      --                for options
      -- Options      - Options to modify or get.
      -- RESULT
      -- If Options is empty, return all available options and their values for
      -- the selected item. Otherwise, return selected option's value for the
      -- selected item
      -- SOURCE
   procedure Item_Configure
     (CanvasWidget: in Tk_Canvas; TagOrId, Options: in String) with
      Pre => TagOrId /= "" and Options /= "";
   function Item_Configure
     (CanvasWidget: in Tk_Canvas; TagOrId: in String; Options: in String := "")
      return String with
      Pre => TagOrId /= "";
      -- ****

      -- ****f* Canvas/Lower
      -- FUNCTION
      -- Move selected item lower in the display
      -- PARAMETERS
      -- CanvasWidget - Tk_Canvas in which items will be moved
      -- TagOrId      - Tag or Id of the items to move. If refers to more than
      --                one item, all items will be moved but they relative
      --                order will be preserved
      -- BelowThis    - Tag or Id of the item below which selected items will
      --                be moved. Default value is empty
      -- SOURCE
   procedure Lower
     (CanvasWidget: in Tk_Canvas; TagOrId: in String;
      BelowThis: in String := "") with
      Pre => TagOrId /= "";
      -- ****

      -- ****f* Canvas/Move
      -- FUNCTION
      -- Move selected items in the canvas coodinate space
      -- PARAMETERS
      -- CanvasWidget - Tk_Canvas in which items will be moved
      -- TagOrId      - Tag or Id of the items to move
      -- XAmount      - Amount to add to X coordinate of the items
      -- YAmount      - Amount to add to Y coordinate of the items
      -- SOURCE
   procedure Move
     (CanvasWidget: in Tk_Canvas; TagOrId, XAmount, YAmount: in String) with
      Pre => TagOrId /= "" and XAmount /= "" and YAmount /= "";
      -- ****

      -- ****f* Canvas/MoveTo
      -- FUNCTION
      -- Move selected items to the selected position in the selected canvas
      -- PARAMETERS
      -- CanvasWidget - Tk_Canvas in which items will be moved
      -- TagOrId      - Tag or Id of the item to move
      -- XPos         - A new X coordinate of the items
      -- YPos         - A new Y coordinate of the items
      -- SOURCE
   procedure MoveTo
     (CanvasWidget: in Tk_Canvas; TagOrId, XPos, YPos: in String) with
      Pre => XPos /= "" and YPos /= "";
      -- ****

      -- ****f* Canvas/Postscript
      -- FUNCTION
      -- Generate a Postscript representation of part or all of the canvas
      -- PARAMETERS
      -- CanvasWidget - Tk_Canvas which Postscrip representation will be
      --                created
      -- Options      - Additional options passed to the command
      -- RESULT
      -- A Postscript representation of the CanvasWidget or empty string if
      -- representation was selected to write to file
      -- SOURCE
   function Postscript
     (CanvasWidget: in Tk_Canvas; Options: in String) return String with
      Pre => Options /= "";
      -- ****

      -- ****f* Canvas/Canvas_Raise
      -- FUNCTION
      -- Move selected item higher in the display
      -- PARAMETERS
      -- CanvasWidget - Tk_Canvas in which items will be moved
      -- TagOrId      - Tag or Id of the items to move. If refers to more than
      --                one item, all items will be moved but they relative
      --                order will be preserved
      -- AfterThis    - Tag or Id of the item after which selected items will
      --                be moved. Default value is empty
      -- SOURCE
   procedure Canvas_Raise
     (CanvasWidget: in Tk_Canvas; TagOrId: in String;
      AboveThis: in String := "") with
      Pre => TagOrId /= "";
      -- ****

      -- ****f* Canvas/Rchars
      -- FUNCTION
      -- Replace text at selected position in the selected items. How text is
      -- replaced depends on the item type
      -- PARAMETERS
      -- CanvasWidget - Tk_Canvas in which items text will be replaced
      -- TagOrId      - Tag or Id of the items in which text will be replaced
      -- First        - Character position or coordinate at which replace text
      --                starts
      -- Last         - Character position or coordinate at which replace text
      --                ends
      -- Text         - Text to replace
      -- SOURCE
   procedure Rchars
     (CanvasWidget: in Tk_Canvas; TagOrId, First, Last, Text: in String) with
      Pre => TagOrId /= "" and First /= "" and Last /= "" and Text /= "";
      -- ****

      -- ****f* Canvas/Scale
      -- FUNCTION
      -- Rescale coordinates of the selected items in canvas coordinate space.
      -- Each point is scaled by distance between XOrgin and XScale and YOrgin
      -- and YScale respectively.
      -- PARAMETERS
      -- CanvasWidget - Tk_Canvas in which items will be scaled
      -- TagOrId      - Tag or Id of the items to scale
      -- XOrgin       - X coordinate of the scale starting point
      -- YOrgin       - Y coordinate of the scale starting point
      -- XScale       - X factor to scale points. 1.0 mean no scaling
      -- YScale       - Y factor to scale points. 1.0 mean no scaling
      -- SOURCE
   procedure Scale
     (CanvasWidget: in Tk_Canvas;
      TagOrId, XOrgin, YOrgin, XScale, YScale: in String) with
      Pre => TagOrId /= "" and XOrgin /= "" and YOrgin /= "" and
      XScale /= "" and YScale /= "";
      -- ****

      -- ****f* Canvas/Select_Adjust
      -- FUNCTION
      -- Resize current selection in the item in canvas to the selected index
      -- PARAMETERS
      -- CanvasWidget - Tk_Canvas in which selection will be resized
      -- TagOrId      - Tag or Id of the item in which selection will be
      --                resized
      -- Index        - New index to which selection will be done in the item
      -- SOURCE
   procedure Select_Adjust
     (CanvasWidget: in Tk_Canvas; TagOrId, Index: in String) with
      Pre => TagOrId /= "" and Index /= "";
      -- ****

      -- ****f* Canvas/Select_Clear
      -- FUNCTION
      -- Clear the selection in the selected Tk_Canvas
      -- PARAMETERS
      -- CanvasWidget - Tk_Canvas in which selection will be cleared
      -- SOURCE
   procedure Select_Clear(CanvasWidget: in Tk_Canvas);
   -- ****

   -- ****f* Canvas/Select_From
   -- FUNCTION
   -- Set the selection anchor point for the canvas in the selected item at
   -- selected character. This procedure does not change selection it just
   -- set fixed end selection for future Select_To procedure
   -- PARAMETERS
   -- CanvasWidget - Tk_Canvas in which the selection will be set
   -- TagOrId      - Tag or Id of the item in which the selection will be set
   -- Index        - Index of character before which the selection will be set
   -- SOURCE
   procedure Select_From
     (CanvasWidget: in Tk_Canvas; TagOrId, Index: in String) with
      Pre => TagOrId /= "" and Index /= "";
      -- ****

      -- ****f* Canvas/Select_Item
      -- FUNCTION
      -- Get Id of the selected item in the selected canvas
      -- PARAMETERS
      -- CanvasWidget - Tk_Canvas in which selection will be queried
      -- RESULT
      -- Id of the selected item or {} if no item selected in the CanvasWidget
      -- SOURCE
   function Select_Item(CanvasWidget: in Tk_Canvas) return String;
   -- ****

   -- ****f* Canvas/Select_To
   -- FUNCTION
   -- Set selection end for the canvas in the selected item at the selected
   -- character. Starting point is set by the most recent Select_Adjust or
   -- Select_From procedures
   -- PARAMETERS
   -- CanvasWidget - Tk_Canvas in which selection will be set
   -- TagOrId      - Tag or Id of the item in which selection will be set
   -- Index        - Index of character which will be added to the selection
   -- SOURCE
   procedure Select_To
     (CanvasWidget: in Tk_Canvas; TagOrId, Index: in String) with
      Pre => TagOrId /= "" and Index /= "";
      -- ****

      -- ****f* Canvas/Canvas_Type
      -- FUNCTION
      -- Get type of the selected item in the selected Tk_Canvas
      -- PARAMETERS
      -- CanvasWidget - Tk_Canvas in which item's type will be queried
      -- TagOrId      - Tag or Id of the item from which type will be get
      -- RESULT
      -- Type of the selected item. If TagOrId refers to more than one item,
      -- return type of the first item. If no item with the selected TagOrId,
      -- return {}
      -- SOURCE
   function Canvas_Type
     (CanvasWidget: in Tk_Canvas; TagOrId: in String) return String with
      Pre => TagOrId /= "";
      -- ****

      -- ****f* Canvas/XView
      -- FUNCTION
      -- Get which horizontal fraction of the canvas is visible
      -- PARAMETERS
      -- CanvasWidget - Tk_Canvas which will be queried for visibility
      -- RESULT
      -- Pair of elements: first element is the start of horizontal fraction of
      -- the CanvasWidget which is visible, second is the end of horizontal
      -- fraction of the CanvasWidget which is visible.
      -- SOURCE
   function XView(CanvasWidget: in Tk_Canvas) return String;
   -- ****

   -- ****f* Canvas/Xview_Move_To
   -- FUNCTION
   -- Adjusts the view in the window so that fraction of the total width of
   -- the Tk_Canvas is off-screen to the left.
   -- PARAMETERS
   -- CanvasWidget - Tk_Canvas which view will be adjusted
   -- Fraction     - Fraction of the CanvasWidget to move. Must be between 0
   --                and 1
   -- SOURCE
   procedure Xview_Move_To
     (CanvasWidget: in Tk_Canvas; Fraction: in String) with
      Pre => Fraction /= "";
      -- ****

      -- ****f* Canvas/Xview_Scroll
      -- FUNCTION
      -- Shift the view in the window on left or right according to Number and
      -- What.
      -- PARAMETERS
      -- CanvasWidget - Tk_Canvas which view will be shifted
      -- Number       - The amount of What to shift the CanvasWidget
      -- What         - Type of amount to move. Can be "units" or "pages"
      -- HISTORY
      -- 8.6.4 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   procedure Xview_Scroll
     (CanvasWidget: in Tk_Canvas; Number, What: in String) with
      Pre => Number /= "" and (What = "units" or What = "pages");
      -- ****

      -- ****f* Canvas/YView
      -- FUNCTION
      -- Get which vertical fraction of the canvas is visible
      -- PARAMETERS
      -- CanvasWidget - Tk_Canvas which will be queried for visibility
      -- RESULT
      -- Pair of elements: first element is the start of vertical fraction of
      -- the CanvasWidget which is visible, second is the end of vertical
      -- fraction of the CanvasWidget which is visible.
      -- HISTORY
      -- 8.6.4 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function YView(CanvasWidget: in Tk_Canvas) return String;
   -- ****

   -- ****f* Canvas/Yview_Move_To
   -- FUNCTION
   -- Adjusts the view in the window so that fraction of the total height of
   -- the Tk_Canvas is off-screen to the top.
   -- PARAMETERS
   -- CanvasWidget - Tk_Canvas which view will be adjusted
   -- Fraction     - Fraction of the CanvasWidget to move. Must be between 0
   --                and 1
   -- HISTORY
   -- 8.6.4 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   procedure Yview_Move_To
     (CanvasWidget: in Tk_Canvas; Fraction: in String) with
      Pre => Fraction /= "";
      -- ****

      -- ****f* Canvas/Yview_Scroll
      -- FUNCTION
      -- Shift the view in the window on top or bottom according to Number and
      -- What.
      -- PARAMETERS
      -- CanvasWidget - Tk_Canvas which view will be shifted
      -- Number       - The amount of What to shift the CanvasWidget
      -- What         - Type of amount to move. Can be "units" or "pages"
      -- HISTORY
      -- 8.6.4 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   procedure Yview_Scroll
     (CanvasWidget: in Tk_Canvas; Number, What: in String) with
      Pre => Number /= "" and (What = "units" or What = "pages");
      -- ****

private

   type Tk_Canvas is new Tk_Widget with null record;

end Tcl.Tk.Ada.Widgets.Canvas;

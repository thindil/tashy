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

   -- ****t* Canvas/Canvas.Tk_Canvas
   -- FUNCTION
   -- This is a non-abstract type derived directly from Tk_Widget.
   -- Each of the derived widgets redefines the Create subprogram
   -- in order to create the correct type of widget.
   -- SOURCE
   type Tk_Canvas is new Tk_Widget with private;
   -- ****

   -- ****f* Canvas/Canvas.Create_(function)
   -- FUNCTION
   -- Creates a new Tk_Canvas in the specified interpreter.
   -- PARAMETERS
   -- pathName - Tk path (starts with dot) for the widget
   -- options  - Options which will be passed to the widget. Default value is
   --            empty
   -- Interp   - Tcl interpreter to which the widget will be created. If null,
   --            the widget will be created in the "contextual" interpreter.
   --            Default value is null.
   -- RESULT
   -- Newly created Tk_Canvas
   -- HISTORY
   -- 8.6.1 - Added
   -- EXAMPLE
   -- -- Create a new canvas with pathname .mycanvas
   -- My_Canvas: constant Tk_Canvas := Create(".mycanvas");
   -- COMMANDS
   -- canvas pathName ?options?
   -- SEE ALSO
   -- Canvas.Create_(procedure)
   -- SOURCE
   overriding function Create
     (pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) return Tk_Canvas with
      Pre => pathName /= "";
      -- ****

     -- ****f* Canvas/Canvas.Create_(procedure)
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
     -- OUTPUT
     -- Newly created Tk_Canvas as parameter Widgt
     -- HISTORY
     -- 8.6.1 - Added
     -- EXAMPLE
     -- -- Create canvas My_Canvas with pathname .mycanvas and with black background on the current Tcl interpreter
     -- declare
     --    My_Canvas: Tk_Canvas;
     -- begin
     --    Create(My_Canvas, ".mycanvas", "-background black");
     -- end;
     -- COMMANDS
     -- canvas pathName ?options?
     -- SEE ALSO
     -- Canvas.Create_(function)
     -- SOURCE
   overriding procedure Create
     (Widgt: out Tk_Canvas; pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) with
      Pre => pathName /= "";
     -- ****

     -- ****f* Canvas/Canvas.Get_Widget
     -- FUNCTION
     -- Get the existing Tk_Canvas widget
     -- PARAMETERS
     -- pathName - Tk path (starts with dot) for the widget
     -- Interp   - Tcl interpreter on which the widget exists. Can be empty.
     --            Default value is current Tcl interpreter
     -- RESULT
     -- Existing Tk_Canvas widget
     -- HISTORY
     -- 8.6.9 - Added
     -- EXAMPLE
     -- -- Get canvas widget with name .mycanvas on the current Tcl interpreter
     -- My_Canvas: constant Tk_Canvas := Get_Widget(".mycanvas");
     -- SOURCE
   overriding function Get_Widget
     (pathName: in String; Interp: in Tcl_Interp := Get_Context)
      return Tk_Canvas;
     -- ****

     -- ****f* Canvas/Canvas.Add_Tag
     -- FUNCTION
     -- Add tag to the selected items in the Tk_Canvas
     -- PARAMETERS
     -- Tag        - Tag name to add
     -- SearchSpec - Requirement which item must meet to be selected
     -- Arguments  - Arguments for the SearchSpec. Default value is empty
     -- HISTORY
     -- 8.6.3 - Added
     -- EXAMPLE
     -- -- Add tag mytag to the all items below item taged othertag in the My_Canvas canvas
     -- Add_Tag(My_Canvas, "mytag", "below", "othertag");
     -- COMMANDS
     -- CanvasWidget addtag tag searchSpec ?arguments?
     -- SOURCE
   procedure Add_Tag
     (CanvasWidget: in Tk_Canvas; Tag, SearchSpec: in String;
      Arguments: in String := "") with
      Pre => Tag /= "" and
      SearchSpec in "above" | "all" | "below" | "closest" | "enclosed" |
          "overlapping" | "withtag";
      -- ****

      -- ****f* Canvas/Canvas.BBox
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
      -- HISTORY
      -- 8.6.3 - Added
      -- EXAMPLE
      -- -- Get the bouding box for the whole My_Canvas canvas
      -- Bounding_Box: constant String := BBox(My_Canvas, "all");
      -- COMMANDS
      -- CanvasWidget bbox tagOrId ?tagOrId tagOrId ...?
      -- SOURCE
   function BBox
     (CanvasWidget: in Tk_Canvas; TagOrId: in String) return String with
      Pre => TagOrId /= "";
      -- ****

      -- ****f* Canvas/Canvas.Bind_(procedure)
      -- FUNCTION
      -- Bind the selected command to the selected item in the selected canvas
      -- with the selected sequence
      -- PARAMETERS
      -- CanvasWidget - Tk_Canvas in which bind will be done
      -- TagOrId      - Tag or Id of items to which bind will be done
      -- Sequence     - Sequence to which command will be bound
      -- Command      - Tcl command which will be bound
      -- HISTORY
      -- 8.6.3 - Added
      -- EXAMPLE
      -- -- Bind the command exit to the tag mytag in My_Canvas at left mouse button click
      -- Bind(My_Canvas, "mytag", "<1>", "exit");
      -- COMMANDS
      -- CanvasWidget bind tagOrId sequence command
      -- SEE ALSO
      -- Canvas.Bind_(function)
      -- SOURCE
   procedure Bind
     (CanvasWidget: in Tk_Canvas; TagOrId, Sequence, Command: in String) with
      Pre => TagOrId /= "" and Sequence /= "" and Command /= "";
      -- ****

      -- ****f* Canvas/Canvas.Bind_(function)
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
      -- HISTORY
      -- 8.6.3 - Added
      -- EXAMPLE
      -- -- Get the all binding associated with the mytag tag in the My_Canvas canvas
      -- Bindings: constant String := Bind(My_Canvas, "mytag");
      -- COMMANDS
      -- CanvasWidget bind tagOrId ?sequence?
      -- SEE ALSO
      -- Canvas.Bind_(procedure)
      -- SOURCE
   function Bind
     (CanvasWidget: in Tk_Canvas; TagOrId: in String;
      Sequence: in String := "") return String with
      Pre => TagOrId /= "";
      -- ****

      -- ****f* Canvas/Canvas.CanvasX
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
      -- HISTORY
      -- 8.6.3 - Added
      -- EXAMPLE
      -- -- Get the X coordinate for screen X coordinate 14 at My_Canvas canvas
      -- X: constant String := CanvasX(My_Canvas, "14");
      -- COMMANDS
      -- CanvasWidget canvasx screenx ?gridspacing?
      -- SOURCE
   function CanvasX
     (CanvasWidget: in Tk_Canvas; ScreenX: in String;
      GridSpacing: in String := "") return String with
      Pre => ScreenX /= "";
      -- ****

      -- ****f* Canvas/Canvas.CanvasY
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
      -- HISTORY
      -- 8.6.3 - Added
      -- EXAMPLE
      -- -- Get the Y coordinate for screen Y coordinate 23 at My_Canvas canvas
      -- Y: constant String := CanvasX(My_Canvas, "23");
      -- COMMANDS
      -- CanvasWidget canvasy screeny ?gridspacing?
      -- SOURCE
   function CanvasY
     (CanvasWidget: in Tk_Canvas; ScreenY: in String;
      GridSpacing: in String := "") return String with
      Pre => ScreenY /= "";
      -- ****

      -- ****f* Canvas/Canvas.Coords_(procedure)
      -- FUNCTION
      -- Set new coordinates for the selected widget inside the selected
      -- Tk_Canvas
      -- PARAMETERS
      -- CanvasWidget - Tk_Canvas in which the widget will be moved
      -- TagOrId      - Tag or Id of the item which will be moved. If Tag
      --                refers to multiple items, only first will be used.
      -- Coordinates  - New coordinates for the item
      -- HISTORY
      -- 8.6.3 - Added
      -- EXAMPLE
      -- -- Set the coordinate for mytag item in My_Canvas canvas to (23, 56)
      -- Coords(My_Canvas, "mytag", " 23 56");
      -- COMMANDS
      -- CanvasWidget coords tagOrId x y
      -- SEE ALSO
      -- Canvas.Coords_(function)
      -- SOURCE
   procedure Coords
     (CanvasWidget: in Tk_Canvas; TagOrId, Coordinates: in String) with
      Pre => TagOrId /= "" and Coordinates /= "";
      -- ****

      -- ****f* Canvas/Canvas.Coords_(function)
      -- FUNCTION
      -- Get coordinates for the selected widgets inside the selected Tk_Canvas
      -- PARAMETERS
      -- CanvasWidget - Tk_Canvas in which the widgets will be queried
      -- TagOrId      - Tag or Id of the items which will be queried.
      -- RESULT
      -- List with coordinates of the selected items
      -- HISTORY
      -- 8.6.3 - Added
      -- EXAMPLE
      -- -- Get the coordinates of the mytag tag in My_Canvas canvas
      -- Coorditates: constant String := Coords(My_Canvas, "mytag");
      -- COMMANDS
      -- CanvasWidget coords tagOrId
      -- SEE ALSO
      -- Canvas.Coords_(procedure)
      -- SOURCE
   function Coords
     (CanvasWidget: in Tk_Canvas; TagOrId: in String) return String with
      Pre => TagOrId /= "";
      -- ****

      -- ****f* Canvas/Canvas.Canvas_Create_(procedure)
      -- FUNCTION
      -- Add the child to the canvas
      -- PARAMETERS
      -- Parent     - Tk_Canvas to which child will be added
      -- Child_Type - Tk type of child to add
      -- Options    - Tk options to create command
      -- HISTORY
      -- 8.6.3 - Added
      -- EXAMPLE
      -- -- Add button My_Button as a window to My_Canvas canvas at (0,0) point
      -- Canvas_Create(My_Canvas, "window", "0 0 -window " & My_Button);
      -- COMMANDS
      -- CanvasWidget create type ?options?
      -- SEE ALSO
      -- Canvas.Canvas_Create_(function)
      -- SOURCE
   procedure Canvas_Create
     (Parent: in Tk_Canvas; Child_Type: in String;
      Options: in String := "") with
      Pre => Child_Type /= "";
      -- ****

      -- ****f* Canvas/Canvas.Canvas_Create_(function)
      -- FUNCTION
      -- Add the child to the canvas
      -- PARAMETERS
      -- Parent     - Tk_Canvas to which child will be added
      -- Child_Type - Tk type of child to add
      -- Options    - Tk options to create command
      -- RESULT
      -- Id of the newly created window
      -- HISTORY
      -- 8.6.6 - Added
      -- EXAMPLE
      -- -- Add button My_Button as a window to My_Canvas canvas at (0,0) point and get it Id
      -- Button_Id := constant Sttring := Canvas_Create(My_Canvas, "window", "0 0 -window " & My_Button);
      -- COMMANDS
      -- CanvasWidget create type ?options?
      -- SEE ALSO
      -- Canvas.Canvas_Create_(procedure)
      -- SOURCE
   function Canvas_Create
     (Parent: in Tk_Canvas; Child_Type: in String; Options: in String := "")
      return String with
      Pre => Child_Type /= "";
      -- ****

      -- ****f* Canvas/Canvas.Dchars
      -- FUNCTION
      -- Delete characters in the selected items in the selected range
      -- PARAMETERS
      -- CanvasWidget - Tk_Canvas in which characters will be deleted
      -- TagOrId      - Tag or Id of the items in which characters will be
      --                deleted
      -- First        - Index or coordinates where to start deleting characters
      -- Last         - Index or coordinates where to end deleting characters.
      --                Default value is empty
      -- HISTORY
      -- 8.6.3 - Added
      -- EXAMPLE
      -- -- Delete characters in tag mytag from first to 10th in My_Canvas canvas
      -- Dchars(My_Canvas, "mytag", "0", "9");
      -- COMMANDS
      -- CanvasWidget dchars tagOrId first ?last?
      -- SOURCE
   procedure Dchars
     (CanvasWidget: in Tk_Canvas; TagOrId, First: in String;
      Last: in String := "") with
      Pre => TagOrId /= "" and First /= "";
      -- ****

      -- ****f* Canvas/Canvas.Delete
      -- FUNCTION
      -- Delete selected items from the selected canvas
      -- PARAMETERS
      -- CanvasWidget - Tk_Canvas in which items will be deleted
      -- TagOrId      - Tag or Id of the items to delete
      -- HISTORY
      -- 8.6.3 - Added
      -- EXAMPLE
      -- -- Delete item tagged "mytag" from the My_Canvas canvas
      -- Delete(My_Canvas, "mytag");
      -- COMMANDS
      -- CanvasWidget delete ?tagOrId tagOrId ...?
      -- SOURCE
   procedure Delete(CanvasWidget: in Tk_Canvas; TagOrId: in String) with
      Pre => TagOrId /= "";
      -- ****

      -- ****f* Canvas/Canvas.DTag
      -- FUNCTION
      -- Delete selected Tag from items in the selected canvas
      -- PARAMETERS
      -- CanvasWidget - Tk_Canvas in which tag will be deleted
      -- TagOrId      - Tag or Id of items from which tag will be deleted
      -- TagToDelete  - Tag to delete. If empty, delete value of parameter
      --                TagOrId. Default value is empty
      -- HISTORY
      -- 8.6.3 - Added
      -- EXAMPLE
      -- -- Delete tag "mytag" from the all items in the My_Canvas canvas
      -- DTag(My_Canvas, "all", "mytag");
      -- COMMANDS
      -- CanvasWidget dtag tagOrId ?tagToDelete?
      -- SOURCE
   procedure DTag
     (CanvasWidget: in Tk_Canvas; TagOrId: in String;
      TagToDelete: in String := "") with
      Pre => TagOrId /= "";
      -- ****

      -- ****f* Canvas/Canvas.Find
      -- FUNCTION
      -- Find items in the selected canvas
      -- PARAMETERS
      -- CanvasWidget  - Tk_Canvas which will be queried for items
      -- SearchCommand - Search criteria for items. It is that same as
      --                 SearchSpec for Add_Tag procedure.
      -- Arguments    - Arguments for SearchCommand. Must be that same as
      --                 arguments for Add_Tag procedure. Default value is
      --                 empty
      -- RESULT
      -- List of items in the stacking order, the lowest item first
      -- HISTORY
      -- 8.6.3 - Added
      -- EXAMPLE
      -- -- Find items above item tagged as mytag in the My_Canvas canvas
      -- Items: constant String := Find(My_Canvas, "above", "mytag");
      -- COMMANDS
      -- CanvasWidget find searchCommand ?arguments?
      -- SOURCE
   function Find
     (CanvasWidget: in Tk_Canvas; SearchCommand: in String;
      Arguments: in String := "") return String with
      Pre => SearchCommand /= "";
      -- ****

      -- ****f* Canvas/Canvas.Focus
      -- FUNCTION
      -- Set focused item in the selected canvas
      -- PARAMETERS
      -- CanvasWidget - Tk_Canvas in which focus will be set
      -- TagOrId      - Tag or Id of item to set as focused item. If few items
      --                are with this same tag, only first will be used. If no
      --                item with that tag or TagOrId is empty, reset focus.
      --                Default value is empty
      -- HISTORY
      -- 8.6.3 - Added
      -- EXAMPLE
      -- -- Set the focus in the My_Canvas canvas to item tagged "mytag"
      -- Focus(My_Canvas, "mytag");
      -- COMMANDS
      -- CanvasWidget focus ?tagOrId?
      -- SOURCE
   procedure Focus(CanvasWidget: in Tk_Canvas; TagOrId: in String := "");
   -- ****

   -- ****f* Canvas/Canvas.Get_Tags
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
   -- HISTORY
   -- 8.6.3 - Added
   -- EXAMPLE
   -- -- Get the list of tags associated with the item tagged "mytag" in the canvas My_Canvas
   -- Tags: constant String := Get_Tags(My_Canvas, "mytag");
   -- COMMANDS
   -- CanvasWidget gettags tagOrId
   -- SOURCE
   function Get_Tags
     (CanvasWidget: in Tk_Canvas; TagOrId: in String) return String with
      Pre => TagOrId /= "";
      -- ****

      -- ****f* Canvas/Canvas.ICursor
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
      -- HISTORY
      -- 8.6.3 - Added
      -- EXAMPLE
      -- -- Set the insertion cursor to start in the item tagged mytag in canvas My_Canvas
      -- ICursor(My_Canvas, "mytag", "0");
      -- COMMANDS
      -- CanvasWidget icursor tagOrId index
      -- SOURCE
   procedure ICursor
     (CanvasWidget: in Tk_Canvas; TagOrId, Index: in String) with
      Pre => TagOrId /= "" and Index /= "";
      -- ****

      -- ****f* Canvas/Canvas.IMove
      -- FUNCTION
      -- Move index'th coordinate of the selected items to a new location
      -- PARAMETERS
      -- CanvasWidget - Tk_Canvas in which items will be queried
      -- TagOrId      - Tag or Id of items which coordinates will be moved
      -- Index        - Index of coordinate to move. Each item interprets this
      --                value independently
      -- X            - A new X coordinate
      -- Y            - A new Y coordinate
      -- HISTORY
      -- 8.6.3 - Added
      -- EXAMPLE
      -- -- Move first index in the mytag tagged item in My_Canvas canvas to position (15, 89)
      -- IMove(My_Canvas, "mytag", "0", "15", "89");
      -- COMMANDS
      -- CanvasWidget imove tagOrId index x y
      -- SOURCE
   procedure IMove
     (CanvasWidget: in Tk_Canvas; TagOrId, Index, X, Y: in String) with
      Pre => TagOrId /= "" and Index /= "" and X /= "" and Y /= "";
      -- ****

      -- ****f* Canvas/Canvas.Index
      -- FUNCTION
      -- Get numerical index of the selected Index in the selected items
      -- PARAMETERS
      -- CanvasWidget - Tk_Canvas in which index will be queried
      -- TagOrId      - Tag or Id of items to query for index
      -- Index        - Depends on the item, it can be coordinate or index of
      --                character in textual description
      -- RESULT
      -- Numerical index of the selected Index in the selected items
      -- HISTORY
      -- 8.6.3 - Added
      -- EXAMPLE
      -- -- Get the index of the first index in mytag tagged item in My_Canvas canvas
      -- My_Index: constant String := Index(My_Canvas, "mytag", "0");
      -- COMMANDS
      -- CanvasWidget index tagOrId index
      -- SOURCE
   function Index
     (CanvasWidget: in Tk_Canvas; TagOrId, Index: in String) return String with
      Pre => TagOrId /= "" and Index /= "";
      -- ****

      -- ****f* Canvas/Canvas.Insert
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
      -- HISTORY
      -- 8.6.3 - Added
      -- EXAMPLE
      -- -- Insert hello world text at 10th character to all items tagged mytag in My_Canvas canvas
      -- Insert(My_Canvas, "mytag", "9", "hello world");
      -- COMMANDS
      -- CanvasWidget insert tagOrId beforeThis item
      -- SOURCE
   procedure Insert
     (CanvasWidget: in Tk_Canvas; TagOrId, BeforeThis, Item: in String) with
      Pre => TagOrId /= "" and BeforeThis /= "" and Item /= "";
      -- ****

      -- ****f* Canvas/Canvas.Item_Cget
      -- FUNCTION
      -- Get configuration option for the selected item in the selected canvas
      -- PARAMETERS
      -- CanvasWidget - Tk_Canvas which will be queried for option
      -- TagOrId      - Tag or Id of the item which will be queried for option
      -- Option       - Tk option to query
      -- RESULT
      -- Current value of the selected option of the selected item. If TagOrId
      -- refers to more than one item, only first item is checked.
      -- HISTORY
      -- 8.6.3 - Added
      -- EXAMPLE
      -- -- Get the text from the item tagged mytag in My_Canvas canvas
      -- Text: constant String := Item_Cget(My_Canvas, "mytag", "-text");
      -- COMMANDS
      -- CanvasWidget itemcget tagOrId option
      -- SOURCE
   function Item_Cget
     (CanvasWidget: in Tk_Canvas; TagOrId, Option: in String)
      return String with
      Pre => TagOrId /= "" and Option /= "";
      -- ****

      -- ****f* Canvas/Canvas.Item_Configure_(procedure)
      -- FUNCTION
      -- Modify the configuration options of the selected item
      -- PARAMETERS
      -- CanvasWidget - Tk_Canvas in which options will be modified
      -- TagOrId      - Tag or Id of the item which options will be modified
      -- Options      - Options to modify with values for them.
      -- HISTORY
      -- 8.6.3 - Added
      -- EXAMPLE
      -- -- Set the text to hello world in item tagged mytag in My_Canvas canvas
      -- Item_Configure(My_Canvas, "mytag", "-text {hello world}");
      -- COMMANDS
      -- CanvasWidget itemconfigure tagOrId options
      -- SEE ALSO
      -- Canvas.Item_Configure_(function)
      -- SOURCE
   procedure Item_Configure
     (CanvasWidget: in Tk_Canvas; TagOrId, Options: in String) with
      Pre => TagOrId /= "" and Options /= "";
      -- ****

      -- ****f* Canvas/Canvas.Item_Configure_(function)
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
      -- HISTORY
      -- 8.6.3 - Added
      -- EXAMPLE
      -- -- Get the text of the item tagged mytag in My_Canvas canvas
      -- Text: constant String := Item_Configure(My_Canvas, "mytag", "-text");
      -- COMMANDS
      -- CanvasWidget itemconfigure tagOrId ?options?
      -- SEE ALSO
      -- Canvas.Item_Configure_(procedure)
      -- SOURCE
   function Item_Configure
     (CanvasWidget: in Tk_Canvas; TagOrId: in String; Options: in String := "")
      return String with
      Pre => TagOrId /= "";
      -- ****

      -- ****f* Canvas/Canvas.Lower
      -- FUNCTION
      -- Move selected item lower in the display
      -- PARAMETERS
      -- CanvasWidget - Tk_Canvas in which items will be moved
      -- TagOrId      - Tag or Id of the items to move. If refers to more than
      --                one item, all items will be moved but they relative
      --                order will be preserved
      -- BelowThis    - Tag or Id of the item below which selected items will
      --                be moved. Default value is empty
      -- HISTORY
      -- 8.6.3 - Added
      -- EXAMPLE
      -- -- Move items tagged mytag in My_Canvas canvas
      -- Lower(My_Canvas, "mytag");
      -- COMMANDS
      -- CanvasWidget lower tagOrId ?belowThis?
      -- SOURCE
   procedure Lower
     (CanvasWidget: in Tk_Canvas; TagOrId: in String;
      BelowThis: in String := "") with
      Pre => TagOrId /= "";
      -- ****

      -- ****f* Canvas/Canvas.Move
      -- FUNCTION
      -- Move selected items in the canvas coodinate space
      -- PARAMETERS
      -- CanvasWidget - Tk_Canvas in which items will be moved
      -- TagOrId      - Tag or Id of the items to move
      -- XAmount      - Amount to add to X coordinate of the items
      -- YAmount      - Amount to add to Y coordinate of the items
      -- HISTORY
      -- 8.6.3 - Added
      -- EXAMPLE
      -- -- Move items tagged mytag in My_Canvas canvas by 10px in X and 14px in Y
      -- Move(My_Canvas, "mytag", "10", "14");
      -- COMMANDS
      -- CanvasWidget move tagOrId xAmount yAmount
      -- SOURCE
   procedure Move
     (CanvasWidget: in Tk_Canvas; TagOrId, XAmount, YAmount: in String) with
      Pre => TagOrId /= "" and XAmount /= "" and YAmount /= "";
      -- ****

      -- ****f* Canvas/Canvas.MoveTo
      -- FUNCTION
      -- Move selected items to the selected position in the selected canvas
      -- PARAMETERS
      -- CanvasWidget - Tk_Canvas in which items will be moved
      -- TagOrId      - Tag or Id of the item to move
      -- XPos         - A new X coordinate of the items
      -- YPos         - A new Y coordinate of the items
      -- HISTORY
      -- 8.6.3 - Added
      -- EXAMPLE
      -- -- Move all items tagged mytag in My_Canvas to point (24, 42)
      -- MoveTo(My_Canvas, "mytag", "24", "42");
      -- COMMANDS
      -- CanvasWidget moveto tagOrId xPos yPos
      -- SOURCE
   procedure MoveTo
     (CanvasWidget: in Tk_Canvas; TagOrId, XPos, YPos: in String) with
      Pre => XPos /= "" and YPos /= "";
      -- ****

      -- ****f* Canvas/Canvas.Postscript
      -- FUNCTION
      -- Generate a Postscript representation of part or all of the canvas
      -- PARAMETERS
      -- CanvasWidget - Tk_Canvas which Postscrip representation will be
      --                created
      -- Options      - Additional options passed to the command
      -- RESULT
      -- A Postscript representation of the CanvasWidget or empty string if
      -- representation was selected to write to file
      -- HISTORY
      -- 8.6.3 - Added
      -- EXAMPLE
      -- -- Save all the My_Canvas canvas to the file mycanvas.ps
      -- Postscript(My_Canvas, "-file mycanvas.ps");
      -- COMMANDS
      -- CanvasWidget postscript options
      -- SOURCE
   function Postscript
     (CanvasWidget: in Tk_Canvas; Options: in String) return String with
      Pre => Options /= "";
      -- ****

      -- ****f* Canvas/Canvas.Canvas_Raise
      -- FUNCTION
      -- Move selected item higher in the display
      -- PARAMETERS
      -- CanvasWidget - Tk_Canvas in which items will be moved
      -- TagOrId      - Tag or Id of the items to move. If refers to more than
      --                one item, all items will be moved but they relative
      --                order will be preserved
      -- AboveThis    - Tag or Id of the item above which selected items will
      --                be moved. Default value is empty
      -- HISTORY
      -- 8.6.3 - Added
      -- EXAMPLE
      -- -- Move items tagged with mytag higher in My_Canvas canvas
      -- Canvas_Raise(My_Canvas, "mytag");
      -- COMMANDS
      -- CanvasWidget raise tagOrId ?aboveThis?
      -- SOURCE
   procedure Canvas_Raise
     (CanvasWidget: in Tk_Canvas; TagOrId: in String;
      AboveThis: in String := "") with
      Pre => TagOrId /= "";
      -- ****

      -- ****f* Canvas/Canvas.Rchars
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
      -- HISTORY
      -- 8.6.3 - Added
      -- EXAMPLE
      -- -- Replace text in items tagged mytag between first and third character with text hello world in My_Canvas
      -- Rchars(My_Canvas, "mytag", "0", "2", "{hello world}");
      -- COMMANDS
      -- CanvasWidget rchars tagOrId first last Text
      -- SOURCE
   procedure Rchars
     (CanvasWidget: in Tk_Canvas; TagOrId, First, Last, Text: in String) with
      Pre => TagOrId /= "" and First /= "" and Last /= "" and Text /= "";
      -- ****

      -- ****f* Canvas/Canvas.Scale
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
      -- HISTORY
      -- 8.6.3 - Added
      -- EXAMPLE
      -- -- Scale all items tagged mytag in My_Canvas canvas from point (34, 54) by 0.5 in both dimensions
      -- Scale(My_Canvas, "mytag", "34", "54", "0.5", "0.5");
      -- COMMANDS
      -- CanvasWidget scale tagOrId xOrigin yOrigin xScale yScale
      -- SOURCE
   procedure Scale
     (CanvasWidget: in Tk_Canvas;
      TagOrId, XOrgin, YOrgin, XScale, YScale: in String) with
      Pre => TagOrId /= "" and XOrgin /= "" and YOrgin /= "" and
      XScale /= "" and YScale /= "";
      -- ****

      -- ****f* Canvas/Canvas.Select_Adjust
      -- FUNCTION
      -- Resize current selection in the item in canvas to the selected index
      -- PARAMETERS
      -- CanvasWidget - Tk_Canvas in which selection will be resized
      -- TagOrId      - Tag or Id of the item in which selection will be
      --                resized
      -- Index        - New index to which selection will be done in the item
      -- HISTORY
      -- 8.6.3 - Added
      -- EXAMPLE
      -- -- Resize selection to 10th index in item tagged mytag in My_Canvas canvas
      -- Select_Adjust(My_Canvas, "mytag", "9");
      -- COMMANDS
      -- CanvasWidget select adjust tagOrId index
      -- SOURCE
   procedure Select_Adjust
     (CanvasWidget: in Tk_Canvas; TagOrId, Index: in String) with
      Pre => TagOrId /= "" and Index /= "";
      -- ****

      -- ****f* Canvas/Canvas.Select_Clear
      -- FUNCTION
      -- Clear the selection in the selected Tk_Canvas
      -- PARAMETERS
      -- CanvasWidget - Tk_Canvas in which selection will be cleared
      -- HISTORY
      -- 8.6.3 - Added
      -- EXAMPLE
      -- -- Clear selection in My_Canvas canvas
      -- Select_Clear(My_Canvas);
      -- COMMANDS
      -- CanvasWidget select clear
      -- SOURCE
   procedure Select_Clear(CanvasWidget: in Tk_Canvas);
   -- ****

   -- ****f* Canvas/Canvas.Select_From
   -- FUNCTION
   -- Set the selection anchor point for the canvas in the selected item at
   -- selected character. This procedure does not change selection it just
   -- set fixed end selection for future Select_To procedure
   -- PARAMETERS
   -- CanvasWidget - Tk_Canvas in which the selection will be set
   -- TagOrId      - Tag or Id of the item in which the selection will be set
   -- Index        - Index of character before which the selection will be set
   -- HISTORY
   -- 8.6.3 - Added
   -- EXAMPLE
   -- -- Set the selection anchor point at first index in item tagged mytag in My_Canvas canvas
   -- Select_From(My_Canvas, "mytag", "0");
   -- COMMANDS
   -- CanvasWidget select from tagOrId index
   -- SOURCE
   procedure Select_From
     (CanvasWidget: in Tk_Canvas; TagOrId, Index: in String) with
      Pre => TagOrId /= "" and Index /= "";
      -- ****

      -- ****f* Canvas/Canvas.Select_Item
      -- FUNCTION
      -- Get Id of the selected item in the selected canvas
      -- PARAMETERS
      -- CanvasWidget - Tk_Canvas in which selection will be queried
      -- RESULT
      -- Id of the selected item or {} if no item selected in the CanvasWidget
      -- HISTORY
      -- 8.6.3 - Added
      -- EXAMPLE
      -- -- Get the Id of the selected item in My_Canvas canvas
      -- Item_Id: constant String := Select_Item(My_Canvas);
      -- COMMANDS
      -- CanvasWidget select item
      -- SOURCE
   function Select_Item(CanvasWidget: in Tk_Canvas) return String;
   -- ****

   -- ****f* Canvas/Canvas.Select_To
   -- FUNCTION
   -- Set selection end for the canvas in the selected item at the selected
   -- character. Starting point is set by the most recent Select_Adjust or
   -- Select_From procedures
   -- PARAMETERS
   -- CanvasWidget - Tk_Canvas in which selection will be set
   -- TagOrId      - Tag or Id of the item in which selection will be set
   -- Index        - Index of character which will be added to the selection
   -- HISTORY
   -- 8.6.3 - Added
   -- EXAMPLE
   -- -- Set the end of the selection to 10th index in mytag tagged item in My_Canvas canvas
   -- Select_To(My_Canvas, "mytag", "9");
   -- COMMANDS
   -- CanvasWidget select to tagOrId index
   -- SOURCE
   procedure Select_To
     (CanvasWidget: in Tk_Canvas; TagOrId, Index: in String) with
      Pre => TagOrId /= "" and Index /= "";
      -- ****

      -- ****f* Canvas/Canvas.Canvas_Type
      -- FUNCTION
      -- Get type of the selected item in the selected Tk_Canvas
      -- PARAMETERS
      -- CanvasWidget - Tk_Canvas in which item's type will be queried
      -- TagOrId      - Tag or Id of the item from which type will be get
      -- RESULT
      -- Type of the selected item. If TagOrId refers to more than one item,
      -- return type of the first item. If no item with the selected TagOrId,
      -- return {}
      -- HISTORY
      -- 8.6.3 - Added
      -- EXAMPLE
      -- -- Get the type of the item tagged mytag in My_Canvas canvas
      -- Item_Type: constant String := Canvas_Type(My_Canvas, "mytag");
      -- COMMANDS
      -- CanvasWidget type tagOrId
      -- SOURCE
   function Canvas_Type
     (CanvasWidget: in Tk_Canvas; TagOrId: in String) return String with
      Pre => TagOrId /= "";
      -- ****

      -- ****f* Canvas/Canvas.XView
      -- FUNCTION
      -- Get which horizontal fraction of the canvas is visible
      -- PARAMETERS
      -- CanvasWidget - Tk_Canvas which will be queried for visibility
      -- RESULT
      -- Pair of elements: first element is the start of horizontal fraction of
      -- the CanvasWidget which is visible, second is the end of horizontal
      -- fraction of the CanvasWidget which is visible.
      -- HISTORY
      -- 8.6.3 - Added
      -- EXAMPLE
      -- -- Get the horizontal fraction of the My_Canvas canvas
      -- Horizontal_Fraction: constant String := XView(My_Canvas);
      -- COMMANDS
      -- CanvasWidget xview
      -- SEE ALSO
      -- Canvas.YView
      -- SOURCE
   function XView(CanvasWidget: in Tk_Canvas) return String;
   -- ****

   -- ****f* Canvas/Canvas.Xview_Move_To
   -- FUNCTION
   -- Adjusts the view in the window so that fraction of the total width of
   -- the Tk_Canvas is off-screen to the left.
   -- PARAMETERS
   -- CanvasWidget - Tk_Canvas which view will be adjusted
   -- Fraction     - Fraction of the CanvasWidget to move. Must be between 0
   --                and 1
   -- HISTORY
   -- 8.6.3 - Added
   -- EXAMPLE
   -- -- Show the first half of the canvas My_Canvas
   -- Xview_Move_To(My_Canvas, "0.5");
   -- COMMANDS
   -- CanvasWidget xview moveto fraction
   -- SEE ALSO
   -- Canvas.Yview_Move_To
   -- SOURCE
   procedure Xview_Move_To
     (CanvasWidget: in Tk_Canvas; Fraction: in String) with
      Pre => Fraction /= "";
      -- ****

      -- ****f* Canvas/Canvas.Xview_Scroll
      -- FUNCTION
      -- Shift the view in the window on left or right according to Number and
      -- What.
      -- PARAMETERS
      -- CanvasWidget - Tk_Canvas which view will be shifted
      -- Number       - The amount of What to shift the CanvasWidget
      -- What         - Type of amount to move. Can be "units" or "pages"
      -- HISTORY
      -- 8.6.4 - Added
      -- EXAMPLE
      -- -- Move the view in the My_Canvas canvas by 10 units to right
      -- Xview_Scroll(My_Canvas, "10", "units");
      -- COMMANDS
      -- CanvasWidget xview scroll number what
      -- SEE ALSO
      -- Canvas.Yview_Scroll
      -- SOURCE
   procedure Xview_Scroll
     (CanvasWidget: in Tk_Canvas; Number, What: in String) with
      Pre => Number /= "" and (What = "units" or What = "pages");
      -- ****

      -- ****f* Canvas/Canvas.YView
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
      -- EXAMPLE
      -- -- Get the vertical fraction of the My_Canvas canvas
      -- Vertical_Fraction: constant String := YView(My_Canvas);
      -- COMMANDS
      -- CanvasWidget yview
      -- SEE ALSO
      -- Canvas.XView
      -- SOURCE
   function YView(CanvasWidget: in Tk_Canvas) return String;
   -- ****

   -- ****f* Canvas/Canvas.Yview_Move_To
   -- FUNCTION
   -- Adjusts the view in the window so that fraction of the total height of
   -- the Tk_Canvas is off-screen to the top.
   -- PARAMETERS
   -- CanvasWidget - Tk_Canvas which view will be adjusted
   -- Fraction     - Fraction of the CanvasWidget to move. Must be between 0
   --                and 1
   -- HISTORY
   -- 8.6.4 - Added
   -- EXAMPLE
   -- -- Show the first half of the canvas My_Canvas
   -- Yview_Move_To(My_Canvas, "0.5");
   -- COMMANDS
   -- CanvasWidget yview moveto fraction
   -- SEE ALSO
   -- Canvas.Xview_Move_To
   -- SOURCE
   procedure Yview_Move_To
     (CanvasWidget: in Tk_Canvas; Fraction: in String) with
      Pre => Fraction /= "";
      -- ****

      -- ****f* Canvas/Canvas.Yview_Scroll
      -- FUNCTION
      -- Shift the view in the window on top or bottom according to Number and
      -- What.
      -- PARAMETERS
      -- CanvasWidget - Tk_Canvas which view will be shifted
      -- Number       - The amount of What to shift the CanvasWidget
      -- What         - Type of amount to move. Can be "units" or "pages"
      -- HISTORY
      -- 8.6.4 - Added
      -- EXAMPLE
      -- -- Move the view in the My_Canvas canvas by 10 units to top
      -- Yview_Scroll(My_Canvas, "-10", "units");
      -- COMMANDS
      -- CanvasWidget yview scroll number what
      -- SEE ALSO
      -- Canvas.Xview_Scroll
      -- SOURCE
   procedure Yview_Scroll
     (CanvasWidget: in Tk_Canvas; Number, What: in String) with
      Pre => Number /= "" and (What = "units" or What = "pages");
      -- ****

private

   type Tk_Canvas is new Tk_Widget with null record;

end Tcl.Tk.Ada.Widgets.Canvas;

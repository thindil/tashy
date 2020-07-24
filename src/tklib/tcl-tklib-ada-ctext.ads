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

with Tcl.Tk.Ada.Widgets; use Tcl.Tk.Ada.Widgets;

-- ****h* TklibAda/Ctext
-- FUNCTION
-- Provides code for manipulate Tklib ctext package
-- SOURCE
package Tcl.Tklib.Ada.Ctext is
-- ****

   -- ****f* Ctext/Ctext_Init
   -- FUNCTION
   -- Load package Ctext. Raise Program_Error if package can't be loaded
   -- PARAMETERS
   -- Interp: Tcl interpreter to which getstring package will be added
   -- HISTORY
   -- 8.6.7 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   procedure Ctext_Init(Interp: in Tcl_Interp);
   -- ****

   -- ****t* Ctext/Tklib_Ctext
   -- FUNCTION
   -- This is a non-abstract type derived directly from Tk_Widget.
   -- Each of the derived widgets redefines the Create subprogram
   -- in order to create the correct type of widget.
   -- SOURCE
   type Tklib_Ctext is new Tk_Widget with private;
   -- ****

   -- ****f* Ctext/Create (function)
   -- FUNCTION
   -- Creates a new Tklib_Ctext in the specified interpreter.
   -- PARAMETERS
   -- pathName - Tk path (starts with dot) for the widget
   -- options  - Options which will be passed to the widget. Default value is
   --            empty
   -- Interp   - Tcl interpreter to which the widget will be created. If null,
   --            the widget will be created in the "contextual" interpreter.
   --            Default value is null.
   -- RESULT
   -- Newly created Tklib_Ctext
   -- HISTORY
   -- 8.6.7 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   overriding function Create
     (pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) return Tklib_Ctext with
      Pre => pathName /= "";
      -- ****

     -- ****f* Ctext/Create (procedure)
     -- FUNCTION
     -- Creates a new Tklib_Ctext in the specified interpreter.
     -- PARAMETERS
     -- Widgt    - Tklib_Ctext which will be created
     -- pathName - Tk path (starts with dot) for the widget
     -- options  - Options which will be passed to the widget. Default value is
     --            empty
     -- Interp   - Tcl interpreter to which the widget will be created. If null,
     --            the widget will be created in the "contextual" interpreter.
     --            Default value is null.
     -- HISTORY
     -- 8.6.7 - Added
     -- TODO
     -- Replace it with higher level of binding
     -- SOURCE
   overriding procedure Create
     (Widgt: out Tklib_Ctext; pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := null) with
      Pre => pathName /= "";
     -- ****

     -- ****f* Ctext/Add_Highlight_Class
     -- FUNCTION
     -- Add highlighting class to the selected Ctext widget
     -- PARAMETERS
     -- CtextWidget - Ctext widget to which a new highlighting Class will be
     --               added
     -- Class       - The name of highlighting class to add
     -- Color       - The name of color which will be used by the Class
     -- Keywordlist - List of keywords which will be included in that Class
     -- HISTORY
     -- 8.6.7 - Added
     -- TODO
     -- Replace it with higher level of binding
     -- SOURCE
   procedure Add_Highlight_Class
     (CtextWidget: in Tklib_Ctext; Class, Color, Keywordlist: in String) with
      Pre => Class /= "" and Color /= "" and Keywordlist /= "";
      -- ****

      -- ****f* Ctext/Add_Highlight_Class_With_Only_Char_Start
      -- FUNCTION
      -- Add highlighting class to the selected Ctext widget.
      -- CtextWidget - Ctext widget to which a new highlighting Class will be
      --               added
      -- Class       - The name of highlighting class to add
      -- Color       - The name of color which will be used by the Class
      -- Char        - All words which starts with that string will be
      --               highlighted
      -- HISTORY
      -- 8.6.7 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   procedure Add_Highlight_Class_With_Only_Char_Start
     (CtextWidget: in Tklib_Ctext; Class, Color, Char: in String) with
      Pre => Class /= "" and Color /= "" and Char /= "";
      -- ****

private

   type Tklib_Ctext is new Tk_Widget with null record;

end Tcl.Tklib.Ada.Ctext;

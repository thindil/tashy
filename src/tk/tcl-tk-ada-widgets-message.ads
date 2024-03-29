-- Copyright (c) 2020-2021 Bartek thindil Jasicki <thindil@laeran.pl>
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

-- ****h* Widgets/Message
-- FUNCTION
-- Provides code for manipulate Tk widget Message
-- SOURCE
package Tcl.Tk.Ada.Widgets.Message with
   SPARK_Mode
is
   pragma Elaborate_Body;
-- ****

   -- ****t* Message/Message.Tk_Message
   -- FUNCTION
   -- This is a non-abstract type derived directly from Tk_Widget.
   -- Each of the derived widgets redefines the Create subprogram
   -- in order to create the correct type of widget.
   -- SOURCE
   type Tk_Message is new Tk_Widget with private;
   -- ****

   -- ****f* Message/Message.Create_(function)
   -- FUNCTION
   -- Creates a new Tk_Message in the specified interpreter.
   -- PARAMETERS
   -- pathName - Tk path (starts with dot) for the widget
   -- options  - Options which will be passed to the widget. Default value is
   --            empty
   -- Interp   - Tcl interpreter to which the widget will be created. If null,
   --            the widget will be created in the "contextual" interpreter.
   --            Default value is null.
   -- RESULT
   -- Newly created Tk_Message
   -- HISTORY
   -- 8.6.1 - Moved from Tcl.Tk.Ada.Widgets
   -- EXAMPLE
   -- -- Create a new message with pathname .mymessage and text hello world
   -- My_Message: constant Tk_Message := Create(".mymessage", "-text {hello world}");
   -- COMMANDS
   -- message pathName ?options?
   -- SEE ALSO
   -- Message.Create_(procedure)
   -- SOURCE
   overriding function Create
     (pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := Null_Interp) return Tk_Message with
      Global => null;
     -- ****

     -- ****f* Message/Message.Create_(procedure)
     -- FUNCTION
     -- Creates a new Tk_Message in the specified interpreter.
     -- PARAMETERS
     -- Widgt    - Tk_Message which will be created
     -- pathName - Tk path (starts with dot) for the widget
     -- options  - Options which will be passed to the widget. Default value is
     --            empty
     -- Interp   - Tcl interpreter to which the widget will be created. If null,
     --            the widget will be created in the "contextual" interpreter.
     --            Default value is null.
     -- OUTPUT
     -- Newly created Tk_Message as parameter Widgt
     -- HISTORY
     -- 8.6.1 - Moved from Tcl.Tk.Ada.Widgets
     -- EXAMPLE
     -- -- Create message My_Message with pathname .mymessage and text hello world on the current Tcl interpreter
     -- declare
     --    My_Message: Tk_Message;
     -- begin
     --    Create(My_Message, ".mymessage", "-text {hello world}");
     -- end;
     -- COMMANDS
     -- message pathName ?options?
     -- SEE ALSO
     -- Message.Create_(function)
     -- SOURCE
   overriding procedure Create
     (Widgt: out Tk_Message; pathName: in String; options: in String := "";
      Interp: in Tcl_Interp := Null_Interp) with
      Global => null;
      -- ****

     -- ****f* Message/Message.Get_Widget
     -- FUNCTION
     -- Get the existing Tk_Message widget
     -- PARAMETERS
     -- pathName - Tk path (starts with dot) for the widget
     -- Interp   - Tcl interpreter on which the widget exists. Can be empty.
     --            Default value is current Tcl interpreter
     -- RESULT
     -- Existing Tk_Message widget
     -- HISTORY
     -- 8.6.9 - Added
     -- EXAMPLE
     -- -- Get message widget with name .mymessage on the current Tcl interpreter
     -- My_Message: constant Tk_Message := Get_Widget(".mymessage");
     -- SOURCE
   overriding function Get_Widget
     (pathName: in String; Interp: in Tcl_Interp := Get_Context)
      return Tk_Message with
      Global => null;
     -- ****

private

   type Tk_Message is new Tk_Widget with null record;

end Tcl.Tk.Ada.Widgets.Message;

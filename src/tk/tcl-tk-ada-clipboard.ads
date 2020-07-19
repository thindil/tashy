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

-- ****h* TkAda/Clipboard
-- FUNCTION
-- Provides code for manipulate Tk clipboard and selection
-- SOURCE
package Tcl.Tk.Ada.Clipboard is
-- ****

   -- ****f* Clipboard/Append
   -- FUNCTION
   -- Add the selected data to the clipboard
   -- PARAMETERS
   -- Data   - The data which will be added to the clipboard
   -- Window - Tk_Widget on which display the data will be added to clipboard
   -- Format - Format in which the data is transmitted to the requester.
   --          Possible values are STRING or ATOM. Default value is STRING
   -- CType  - Type of desired selection return. Possible values are STRING or
   --          FILE_NAME. Default value is STRING
   -- HISTORY
   -- 8.6.7 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- EXAMPLE
   -- -- Add text as string to the clipboard on display where My_Main_Window widget is
   -- Append("Data to add to clipboard", My_Main_Window);
   -- COMMANDS
   -- clipboard append -displayof window -format format -type ctype ?--? data
   -- SOURCE
   procedure Append
     (Data: in String; Window: in Tk_Widget'Class;
      Format, Ctype: in String := "STRING") with
      Pre => Data /= "" and Format in "STRING" | "ATOM" and
      Ctype in "STRING" | "FILE_NAME";
      -- ****

      -- ****f* Clipboard/Clear
      -- FUNCTION
      -- Claim ownership of the clipboard and remove any previous contents.
      -- PARAMETERS
      -- Window - Tk_Widget on which display the clipboard will be claimed
      -- HISTORY
      -- 8.6.7 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- EXAMPLE
      -- -- Clear the clipboard on display where My_Main_Window widget is
      -- Clear(My_Main_Window);
      -- COMMANDS
      -- clipboard clear -displayof window
      -- SEE ALSO
      -- Tcl.Tk.Ada.Clipboard.Selection_Clear
      -- SOURCE
   procedure Clear(Window: in Tk_Widget'Class);
   -- ****

   -- ****f* Clipboard/Get
   -- FUNCTION
   -- Retrieve the data from the clipboard
   -- PARAMETERS
   -- Window - Tk_Widget on which display the clipboard data will be retrieved
   -- CType  - The form in which the data will be returned. Possible values
   --          are STRING or FILE_NAME. Default value is STRING
   -- RESULT
   -- The content of the selected clipboard
   -- HISTORY
   -- 8.6.7 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- EXAMPLE
   -- -- Get the content of the clipboard in the string form on display where
   -- -- My_Main_Window is
   -- Clipboard_Content: constant String := Get(My_Main_Window);
   -- COMMANDS
   -- clipboard get -displayof window -type ctype
   -- SEE ALSO
   -- Tcl.Tk.Ada.Clipboard.Selection_Get
   -- SOURCE
   function Get
     (Window: in Tk_Widget'Class; CType: in String := "STRING")
      return String with
      Pre => CType in "STRING" | "FILE_NAME";
      -- ****

      -- ****f* Clipboard/Selection_Clear
      -- FUNCTION
      -- Clear the selected selection on the selected window's display
      -- PARAMETERS
      -- Window    - Tk_Widget on which display the selection will be cleared
      -- Selection - Type of selection to clear. Possible values are PRIMARY
      --             and CLIPBOARD. Default value is PRIMARY
      -- HISTORY
      -- 8.6.7 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- EXAMPLE
      -- -- Clear the PRIMARY selection on the My_Main_Window display
      -- Selection_Clear(My_Main_Window);
      -- -- Clear the CLIPBOARD selection on the My_Main_Window display
      -- Selection_Clear(My_Main_Window, "CLIPBOARD");
      -- COMMANDS
      -- selection clear -displayof window -selection selection
      -- SEE ALSO
      -- Tcl.Tk.Ada.Clipboard.Clear
      -- SOURCE
   procedure Selection_Clear
     (Window: in Tk_Widget'Class; Selection: in String := "PRIMARY") with
      Pre => Selection in "PRIMARY" | "CLIPBOARD";
      -- ****

      -- ****f* Clipboard/Selection_Get
      -- FUNCTION
      -- Retrieve the data from the selected selection on the selected
      -- window's display
      -- PARAMETERS
      -- Window    - Tk_Widget on which display the contents of the selection
      --             will be get
      -- Selection - The type of the selection. Possible values are PRIMARY
      --             and CLIPBOARD. Default value is PRIMARY
      -- SType     - Form in which the data will be returned. Possible values
      --             are STRING and FILE_NAME. Default value is STRING
      -- RESULT
      -- The contents of the selected selection
      -- HISTORY
      -- 8.6.7 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- EXAMPLE
      -- -- Get the PRIMARY selection on My_Main_Window widget display in
      -- -- form of string
      -- Selection_Content: constant String := Selection_Get(My_Main_Window);
      -- -- Get the CLIPBOARD selection on My_Main_Window widget display in
      -- -- form of file name
      -- File_Name: constant String := Selection_Get(My_Main_Window, "CLIPBOARD",
      --                                             "FILE_NAME");
      -- COMMANDS
      -- selection get -displayof window -selection selection -type stype
      -- SEE ALSO
      -- Tcl.Tk.Ada.Clipboard.Get
      -- SOURCE
   function Selection_Get
     (Window: in Tk_Widget'Class; Selection: in String := "PRIMARY";
      SType: in String := "STRING") return String with
      Pre => Selection in "PRIMARY" | "CLIPBOARD" and
      SType in "STRING" | "FILE_NAME";
      -- ****

      -- ****f* Clipboard/Selection_Handle
      -- FUNCTION
      -- Creates a handler for selection requests, such that command will be
      -- executed whenever selection is owned by the selected window
      -- PARAMETERS
      -- Window    - Tk_Widget which will be owe the selection
      -- Command   - Tcl command which will be executed
      -- Selection - The selection which will be queried. Possible values are
      --             PRIMARY and CLIPBOARD. Default value is PRIMARY
      -- SType     - Form of data retrieved from the selection. Possible
      --             values are STRING or FILE_NAME. Default value is STRING
      -- Format    - Format used to transmit the selection to the requester.
      --             Possible values are STRING, UTF8_STRING, ATOM and INTEGER.
      --             Default value is STRING
      -- HISTORY
      -- 8.6.7 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- EXAMPLE
      -- -- Create a handerl for My_Main_Window widget display PRIMARY
      -- -- selection which runs Tcl puts hello command
      -- Selection_Handle(My_Main_Window, "{puts hello}");
      -- -- Create a handerl for My_Main_Window widget display CLIPBOARD
      -- -- selection which runs Tcl puts hello command and data will be
      -- -- retrieved as file name
      -- Selection_Handle(My_Main_Window, "{puts hello}", "CLIPBOARD", "FILE_NAME");
      -- COMMANDS
      -- selection handle -selection selection -type stype -format format window command
      -- SOURCE
   procedure Selection_Handle
     (Window: in Tk_Widget'Class; Command: in String;
      Selection: in String := "PRIMARY"; SType: in String := "STRING";
      Format: in String := "STRING") with
      Pre => Command /= "" and Selection in "PRIMARY" | "CLIPBOARD" and
      SType in "STRING" | "FILE_NAME" and
      Format in "STRING" | "UTF8_STRING" | "ATOM" | "INTEGER";
      -- ****

      -- ****f* Clipboard/Selection_Own (function)
      -- FUNCTION
      -- Get the name of the window which owns the selected selection in the
      -- selected window's display
      -- PARAMETERS
      -- Window    - Tk_Widget on which display the owner of selection will be
      --             get
      -- Selection - The selection which will be checked. Possible values are
      --             PRIMARY and CLIPBOARD. Default value is PRIMARY
      -- RESULT
      -- The name of the window which owns the selection or {} if no window
      -- owns the selection.
      -- HISTORY
      -- 8.6.7 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- EXAMPLE
      -- -- Get the name of owner of PRIMARY selection on My_Main_Window
      -- -- widget display
      -- Owner_Name: constant String := Selection_Own(My_Main_Window);
      -- -- Get the name of owner of CLIPBOARD selection on My_Main_Window
      -- -- widget display
      -- Owner_Name: constant String := Selection_Own(My_Main_Window, "CLIPBOARD");
      -- COMMANDS
      -- selection own -displayof window -selection selection
      -- SOURCE
   function Selection_Own
     (Window: in Tk_Widget'Class; Selection: in String := "PRIMARY")
      return String with
      Pre => Selection in "PRIMARY" | "CLIPBOARD";
      -- ****

      -- ****f* Clipboard/Selection_Own (procedure)
      -- FUNCTION
      -- Set the Window as a new owner of the selected selection.
      -- PARAMETERS
      -- Window    - Tk_Widget which will be set as the owner of the selected
      --             Selection
      -- Command   - Tcl command to execute when other window claims ownership
      --             of the Selection from the Window. Must starts with
      --             "-command "
      -- Selection - The selection which will be owned. Possible values are
      --             PRIMARY and CLIPBOARD. Default value is PRIMARY
      -- HISTORY
      -- 8.6.7 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- EXAMPLE
      -- -- Set the name of owner of PRIMARY selection to My_Main_Window
      -- -- widget
      -- Selection_Own(My_Main_Window);
      -- -- Set the name of owner of CLIPBOARD selection to My_Main_Window and
      -- -- execute Tcl command puts hello when other widget will claim ownership
      -- Selection_Own(My_Main_Window, "{puts hello}", "CLIPBOARD");
      -- COMMANDS
      -- selection own -command command -selection selection window
      -- SOURCE
   procedure Selection_Own
     (Window: in Tk_Widget'Class; Command: in String := "";
      Selection: in String := "PRIMARY") with
      Pre => Selection in "PRIMARY" | "CLIPBOARD";
      -- ****

end Tcl.Tk.Ada.Clipboard;

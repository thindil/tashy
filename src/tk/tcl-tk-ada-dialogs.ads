-- Copyright (c) 2020-2021: Bartek thindil Jasicki <thindil@laeran.pl>
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

with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Tcl.Tk.Ada.Widgets.Toplevel; use Tcl.Tk.Ada.Widgets.Toplevel;

-- ****h* TkAda/Dialogs
-- FUNCTION
-- Provides code for manipulate Tk dialogs widgets
-- SOURCE
package Tcl.Tk.Ada.Dialogs with
   SPARK_Mode
is
-- ****

   type DialogButtons is array(Positive range <>) of Unbounded_String;

   -- ****f* Dialogs/Dialogs.Choose_Color
   -- FUNCTION
   -- Create dialog which allow the user select color.
   -- PARAMETERS
   -- Options - Tk options which will be passed to the dialog. Default value
   --           is empty string
   -- RESULT
   -- Name of selected color or empty string if color was not selected
   -- HISTORY
   -- 8.6.6 - Added
   -- EXAMPLE
   -- -- Get the name of the color from dialog created with title Color and
   -- -- with main window as a parent
   -- Color: constant String := Choose_Color("-title {Color} -parent .");
   -- COMMANDS
   -- tk_chooseColor options
   -- SOURCE
   function Choose_Color(Options: in String := "") return String;
   -- ****

   -- ****f* Dialogs/Dialogs.Choose_Directory
   -- FUNCTION
   -- Create dialog which allow the user select directory.
   -- PARAMETERS
   -- Options - Tk options which will be passed to the dialog. Default value
   --           is empty string
   -- RESULT
   -- Name of selected directory or empty string if directory was not selected
   -- HISTORY
   -- 8.6.1 - Added
   -- EXAMPLE
   -- -- Get the name of the selected directory which must exists and dialog
   -- -- has title Choose Directory and it parent is a main window
   -- Directory_Name : constant String := Choose_Directory("-mustexists true -title {Choose Directory} -parent .");
   -- COMMANDS
   -- tk_chooseDirectory options
   -- SOURCE
   function Choose_Directory(Options: in String := "") return String;
   -- ****

   -- ****f* Dialogs/Dialogs.Dialog_(function)
   -- FUNCTION
   -- Create the dialog from selected Tk_Toplevel widget. This function is not
   -- allowed in SPARK. use Dialogs.Dialog_(procedure) instead.
   -- PARAMETERS
   -- Widget  - Tk_Toplevel widget which will be used as the dialog.
   -- Title   - Title of the dialog
   -- Text    - Text to display in the dialog
   -- Bitmap  - Tk bitmap name to show in dialog
   -- Default - Default button in dialog. Buttons counts from 0. If less than
   --           0 no button will be set as default.
   -- Buttons - Array with text to show on buttons. One element is one button
   -- RESULT
   -- Index of button which was clicked or -1 if no button was clicked.
   -- OUTPUT
   -- Parameter Widget as a newly created dialog
   -- HISTORY
   -- 8.6.1 - Added
   -- EXAMPLE
   -- -- Create dialog from My_Dialog widget with title MyDialog, text My
   -- -- Dialog Text, bitmap question, default first button and buttons
   -- -- Yes and No
   -- Buttons: constant DialogButtons := array(To_Unbounded_String("Yes"), To_Unbounded_String("No"));
   -- Response: constant String := Dialog(My_Dialog, "MyDialog", "{My Dialog Text}", "question", 0, Buttons);
   -- COMMANDS
   -- tk_dialog window title text bitmap default string string
   -- SEE ALSO
   -- Dialogs.Dialog_(procedure)
   -- SOURCE
   function Dialog
     (Widget: in out Tk_Toplevel; Title, Text, Bitmap: in String;
      Default: in Integer; Buttons: in DialogButtons) return Integer with
      SPARK_Mode => Off,
      Pre =>
      (Title /= "" and Text /= "" and Bitmap /= "" and
       Default <= Buttons'Length);
      -- ****

      -- ****f* Dialogs/Dialogs.Dialog_(procedure)
      -- FUNCTION
      -- Create the dialog from selected Tk_Toplevel widget.
      -- PARAMETERS
      -- Widget  - Tk_Toplevel widget which will be used as the dialog.
      -- Title   - Title of the dialog
      -- Text    - Text to display in the dialog
      -- Bitmap  - Tk bitmap name to show in dialog
      -- Default - Default button in dialog. Buttons counts from 0. If less than
      --           0 no button will be set as default.
      -- Buttons - Array with text to show on buttons. One element is one button
      -- OUTPUT
      -- Parameter Widget as a newly created dialog and ButtonPressed as a Index
      -- of the buton which was clicked or -1 if no button was clicked
      -- HISTORY
      -- 8.6.12 - Added
      -- EXAMPLE
      -- -- Create dialog from My_Dialog widget with title MyDialog, text My
      -- -- Dialog Text, bitmap question, default first button and buttons
      -- -- Yes and No
      -- Buttons: constant DialogButtons := array(To_Unbounded_String("Yes"), To_Unbounded_String("No"));
      -- Result: Integer;
      -- Dialog(My_Dialog, "MyDialog", "{My Dialog Text}", "question", 0, Buttons, Result);
      -- COMMANDS
      -- tk_dialog window title text bitmap default string string
      -- SEE ALSO
      -- Dialogs.Dialog_(function)
      -- SOURCE
   procedure Dialog
     (Widget: in out Tk_Toplevel; Title, Text, Bitmap: in String;
      Default: in Integer; Buttons: in DialogButtons;
      ButtonPressed: out Integer) with
      Pre =>
      (Title /= "" and Text /= "" and Bitmap /= "" and
       Default <= Buttons'Length);
      -- ****

      -- ****f* Dialogs/Dialogs.FontChooser_Configure_(procedure)
      -- FUNCTION
      -- Set the selected option for the font chooser dialog
      -- PARAMETERS
      -- Options - Tk font chooser options with values to set
      -- HISTORY
      -- 8.6.6 - Added
      -- EXAMPLE
      -- -- Set a main window as parent and title Choose Font for the
      -- -- font chooser
      -- FontChooser_Configure("-parent . -title {Choose Font}");
      -- COMMANDS
      -- tk fontchooser configure -option value -option value ...
      -- SEE ALSO
      -- Dialogs.FontChooser_Configure_(function)
      -- SOURCE
   procedure FontChooser_Configure(Options: in String) with
      Pre => Options /= "";
      -- ****

      -- ****f* Dialogs/Dialogs.FontChooser_Configure_(function)
      -- FUNCTION
      -- Get the selected option value or values of all options for the font
      -- chooser dialog
      -- PARAMETERS
      -- Option - Name of the font chooser option to get. Can be empty. Default
      --          value is empty
      -- RESULT
      -- Value for the selected option or list of pairs name value of all
      -- available options
      -- HISTORY
      -- 8.6.6 - Added
      -- EXAMPLE
      -- -- Check if fontchooser dialog is visible
      -- if FontChooser_Configure("-visible") then
      -- -- Get the all available options for fontchooser dialog
      -- Options: constant String := FontChooser_Configure;
      -- COMMANDS
      -- tk fontchooser configure ?-option?
      -- SEE ALSO
      -- Dialogs.FontChooser_Configure_(procedure)
      -- SOURCE
   function FontChooser_Configure(Option: in String := "") return String;
   -- ****

   -- ****f* Dialogs/Dialogs.FontChooser_Hide
   -- FUNCTION
   -- Hide the font chooser dialog
   -- HISTORY
   -- 8.6.6 - Added
   -- EXAMPLE
   -- -- Hide fontchooser dialog
   -- FontChooser_Hide;
   -- COMMANDS
   -- tk fontchooser hide
   -- SOURCE
   procedure FontChooser_Hide;
   -- ****

   -- ****f* Dialogs/Dialogs.FontChooser_Show
   -- FUNCTION
   -- Show the font chooser dialog
   -- HISTORY
   -- 8.6.6 - Added
   -- EXAMPLE
   -- -- Show fontchooser dialog
   -- FontChooser_Show;
   -- COMMANDS
   -- tk fontchooser show
   -- SOURCE
   procedure FontChooser_Show;
   -- ****

   -- ****f* Dialogs/Dialogs.Get_Open_File
   -- FUNCTION
   -- Create dialog which allow the user select file to open.
   -- PARAMETERS
   -- Options - Tk options which will be passed to the dialog. Default value
   --           is empty string
   -- RESULT
   -- Name of selected file or empty string if no file was selected
   -- HISTORY
   -- 8.6.1 - Added
   -- EXAMPLE
   -- -- Get the name of the selected file from dialog which parent is set to
   -- -- a main window, title to Open File and initial dir to current directory
   -- File_Name: constant String := Get_Open_File("-parent . -title {Open File} -initialdir .");
   -- COMMANDS
   -- tk_getOpenFile ?option value ...?
   -- SOURCE
   function Get_Open_File(Options: in String := "") return String;
   -- ****

   -- ****f* Dialogs/Dialogs.Get_Save_File
   -- FUNCTION
   -- Create dialog which allow the user select file to save.
   -- PARAMETERS
   -- Options - Tk options which will be passed to the dialog. Default value
   --           is empty string
   -- RESULT
   -- Name of selected file or empty string if no file was selected
   -- HISTORY
   -- 8.6.1 - Added
   -- EXAMPLE
   -- -- Get the name of the selected file from dialog which parent is set to
   -- -- a main window, title to Save File As and confirm overwrite an
   -- -- existing file
   -- File_Name: constant String := Get_Save_File("-parent . -title {Sve File As} -confirmoverwrite true");
   -- COMMANDS
   -- tk_getSaveFile ?option value ...?
   -- SOURCE
   function Get_Save_File(Options: in String := "") return String;
   -- ****

   -- ****f* Dialogs/Dialogs.MessageBox
   -- FUNCTION
   -- Create message window and show it to user
   -- PARAMETERS
   -- Options - Tk options which will be passed to the dialog. Default value
   --           is empty string
   -- RESULT
   -- Symbolic name of the clicked button
   -- HISTORY
   -- 8.6.1 - Added
   -- EXAMPLE
   -- -- Show dialog with a main window as parent, text Hello, icon info and
   -- -- button Ok
   -- Answer := constant String := MessageBox("-parent . -message {Hello} -icon info -type ok");
   -- COMMANDS
   -- tk_messageBox ?option value ...?
   -- SOURCE
   function MessageBox(Options: in String := "") return String;
   -- ****

end Tcl.Tk.Ada.Dialogs;

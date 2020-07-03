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
   -- SOURCE
   function Get
     (Window: in Tk_Widget'Class; CType: in String := "STRING")
      return String with
      Pre => CType in "STRING" | "FILE_NAME";
      -- ****

end Tcl.Tk.Ada.Clipboard;

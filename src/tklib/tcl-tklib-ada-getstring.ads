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

-- ****h* TklibAda/GetString
-- FUNCTION
-- Provides code for manipulate Tklib getstring package
-- SOURCE
package Tcl.Tklib.Ada.GetString is
-- ****

   -- ****f* GetString/GetString_Init
   -- FUNCTION
   -- Load package GetString. Raise Program_Error if package can't be loaded
   -- PARAMETERS
   -- Interp: Tcl interpreter to which getstring package will be added
   -- HISTORY
   -- 8.6.7 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   procedure GetString_Init(Interp: in Tcl_Interp);
   -- ****

   -- ****f* GetString/Tk_Get_String
   -- FUNCTION
   -- Create a dialog which prompts the user with text to input a text string.
   -- PARAMETERS
   -- Interp     - Tcl interpreter on which the dialog will be created
   -- DialogName - The name of the dialog to create
   -- Variable   - The name of Tcl variable which will store value entered by
   --              the user
   -- Text       - Additional text to show to the user
   -- Options    - Additional options for the dialog. Can be empty. Default
   --              value is empty
   -- RESULT
   -- 1 if the user pressed Ok button, otherwise 0
   -- HISTORY
   -- 8.6.7 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   function Tk_Get_String
     (Interp: in Tcl_Interp; DialogName, Variable, Text: in String;
      Options: in String := "") return String with
      Pre => DialogName /= "" and Variable /= "" and Text /= "";
      -- ****

end Tcl.Tklib.Ada.GetString;

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

-- ****h* MsgCat/MsgCatAda
-- FUNCTION
-- Provide code for manipulate Tcl package msgcat
-- SOURCE
package Tcl.MsgCat.Ada is
-- ****

   -- ****f* MsgCatAda/MsgCat_Init
   -- FUNCTION
   -- Load package msgcat. Raise Program_Error if package can't be loaded
   -- PARAMETERS
   -- Interp - Tcl interpreter to which msgcat package will be added
   -- HISTORY
   -- 8.6.7 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   procedure MsgCat_Init(Interp: in Tcl_Interp);
   -- ****

   -- ****f* MsgCatAda/Mc_Locale (procedure)
   -- FUNCTION
   -- Set the new default locale for the selected interpreter
   -- PARAMETERS
   -- NewLocale - The name of the new default locale for the selected
   --             Tcl interpreter
   -- Interp    - Tcl interpreter on which locale will be set
   -- HISTORY
   -- 8.6.7 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   procedure Mc_Locale(NewLocale: in String; Interp: Tcl_Interp) with
      Pre => NewLocale /= "";
      -- ****

      -- ****f* MsgCatAda/Mc_Locale (function)
      -- FUNCTION
      -- Get the default locale for the selected interpreter
      -- PARAMETERS
      -- Interp - Tcl interpreter from which locale will be get
      -- RESULT
      -- The name of the currently set locale
      -- HISTORY
      -- 8.6.7 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Mc_Locale(Interp: Tcl_Interp) return String;
   -- ****

end Tcl.MsgCat.Ada;

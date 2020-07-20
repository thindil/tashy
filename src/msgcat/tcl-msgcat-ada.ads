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

   -- ****f* MsgCatAda/Mc
   -- FUNCTION
   -- Get the translation for the selected string
   -- PARAMETERS
   -- Interp     - Tcl interpreter on which translation will be get
   -- Src_String - Source string which for which translation will be get
   -- Arguments  - Additional arguments. If not empty, command format will be
   --              used for format translation result and Arguments will be
   --              passed to it. Default value is empty.
   -- RESULT
   -- String with translation of Src_String. If no translation string exists,
   -- it return result string from routine mcunknown
   -- HISTORY
   -- 8.6.7 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   function Mc
     (Interp: Tcl_Interp; Src_String: in String; Arguments: in String := "")
      return String with
      Pre => Src_String /= "";
      -- ****

      -- ****f* MsgCatAda/Mc_Exists
      -- FUNCTION
      -- Check it translation for the selected string exists
      -- PARAMETERS
      -- Interp     - Tcl interpreter on which translation will be looking for
      -- Src_String - Source string for which translation will be looking for
      -- Options    - Additional options, can be "-exactnamespace" or
      --              "-exactlocale" or both. Default value is empty
      -- Result
      -- True if translation for the selected string exists, otherwise false
      -- HISTORY
      -- 8.6.7 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Mc_Exists
     (Interp: Tcl_Interp; Src_String: in String; Options: in String := "")
      return String with
      Pre => Src_String /= "";
      -- ****

      -- ****f* MsgCatAda/Mc_Load (procedure)
      -- FUNCTION
      -- Load the translations for the currently set locale from the selected
      -- directory
      -- PARAMETERS
      -- DirName - The name of the directory which will be scanned for the
      --           translations and if found anything, loaded
      -- Interp  - Tcl interpreter on which the locations will be loaded
      -- HISTORY
      -- 8.6.7 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   procedure Mc_Load(DirName: in String; Interp: in Tcl_Interp) with
      Pre => DirName /= "";
      -- ****

   -- ****f* MsgCatAda/Mc_Load (function)
   -- FUNCTION
   -- Load the translations for the currently set locale from the selected
   -- directory
   -- PARAMETERS
   -- DirName - The name of the directory which will be scanned for the
   --           translations and if found anything, loaded
   -- Interp  - Tcl interpreter on which the locations will be loaded
   -- HISTORY
   -- 8.6.7 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   function Mc_Load
     (DirName: in String; Interp: in Tcl_Interp) return String with
      Pre => DirName /= "";
      -- ****

      -- ****f* MsgCatAda/Mc_LoadedLocales_Get
      -- FUNCTION
      -- Get the list of the currently loaded locales
      -- PARAMETERS
      -- Interp - Tcl interpreter on which the loaded locales will be queried
      -- RESULT
      -- The list of the currently loaded locales
      -- HISTORY
      -- 8.6.7 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Mc_LoadedLocales_Get(Interp: in Tcl_Interp) return String;
   -- ****

   -- ****f* MsgCatAda/Mc_Locale (procedure)
   -- FUNCTION
   -- Set the new default locale for the selected interpreter
   -- PARAMETERS
   -- NewLocale - The name of the new default locale for the selected
   --             Tcl interpreter
   -- Interp    - Tcl interpreter on which locale will be set
   -- RESULT
   -- Number of translation files loaded
   -- HISTORY
   -- 8.6.7 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   procedure Mc_Locale(NewLocale: in String; Interp: in Tcl_Interp) with
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
   function Mc_Locale(Interp: in Tcl_Interp) return String;
   -- ****

   -- ****f* MsgCatAda/Mc_Max
   -- FUNCTION
   -- Get the longest translated string for selected values.
   -- PARAMETERS
   -- Strings - Source strings which translations will be check for length
   -- Interp  - Tcl interpreter on which length check will be done
   -- RESULT
   -- Length of the longest translated string for selected Strings
   -- HISTORY
   -- 8.6.7 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   function Mc_Max
     (Strings: in String; Interp: in Tcl_Interp) return String with
      Pre => Strings /= "";
      -- ****

      -- ****f* MsgCatAda/Mc_Preferences
      -- FUNCTION
      -- Get the list with locales preferred by the user, based on the user's
      -- language specification
      -- PARAMETERS
      -- Interp - Tcl interpreter on which locales will be get
      -- RESULT
      -- List with locales preferred by the user
      -- HISTORY
      -- 8.6.7 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Mc_Preferences(Interp: in Tcl_Interp) return String;
   -- ****

   -- ****f* MsgCatAda/Mc_Set (procedure)
   -- FUNCTION
   -- Set the translation for the selected string for the selected locale in
   -- the selected interpreter
   -- PARAMETERS
   -- Interp           - Tcl interpreter on which translation will be set
   -- Locale           - The name of locale in which the translation will be
   --                    set
   -- Src_String       - The string which will be translated
   -- Translate_String - The translation of the Src_String. If empty,
   --                    Src_String will be used as translation. Default value
   --                    is empty
   -- HISTORY
   -- 8.6.7 - Added
   -- TODO
   -- Replace it with higher level of binding
   -- SOURCE
   procedure Mc_Set
     (Interp: Tcl_Interp; Locale, Src_String: in String;
      Translate_String: in String := "") with
      Pre => Locale /= "" and Src_String /= "";
      -- ****

      -- ****f* MsgCatAda/Mc_Set (function)
      -- FUNCTION
      -- Set the translation for the selected string for the selected locale in
      -- the selected interpreter
      -- PARAMETERS
      -- Interp           - Tcl interpreter on which translation will be set
      -- Locale           - The name of locale in which the translation will be
      --                    set
      -- Src_String       - The string which will be translated
      -- Translate_String - The translation of the Src_String. If empty,
      --                    Src_String will be used as translation. Default value
      --                    is empty
      -- RESULT
      -- Value of Translate_String
      -- HISTORY
      -- 8.6.7 - Added
      -- TODO
      -- Replace it with higher level of binding
      -- SOURCE
   function Mc_Set
     (Interp: Tcl_Interp; Locale, Src_String: in String;
      Translate_String: in String := "") return String with
      Pre => Locale /= "" and Src_String /= "";
      -- ****

end Tcl.MsgCat.Ada;

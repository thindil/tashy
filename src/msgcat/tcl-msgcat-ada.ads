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
   -- EXAMPLE
   -- -- Init msgcat package on My_Interp Tcl interpreter
   -- MsgCat_Init(My_Interp);
   -- COMMANDS
   -- package require msgcat
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
   -- EXAMPLE
   -- -- Get the translation for string hello world in My_Interp Tcl interpreter
   -- Translation: constant String := Mc(My_Interp, "{hello world}");
   -- COMMANDS
   -- ::msgcat::mc src-string ?arguments?
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
      -- EXAMPLE
      -- -- Check if translation for string hello world exists in My_Interp interpreter
      -- Is_Translated: constant String := Mc_Exists(My_Interp, "{hello world}");
      -- COMMANDS
      -- ::msgcat::mcexists ?options? src-string
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
      -- EXAMPLE
      -- -- Load translations from directory messages to My_Interp interpreter
      -- Mc_Load("messages", My_Interp);
      -- COMMANDS
      -- ::msgcat::mcload dirname
      -- SEE ALSO
      -- Mc_Load (function)
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
      -- RESULT
      -- Amount of loaded translation files
      -- HISTORY
      -- 8.6.7 - Added
      -- EXAMPLE
      -- -- Load translations from directory messages to My_Interp interpreter
      -- Loaded_Files: constant String := Mc_Load("messages", My_Interp);
      -- COMMANDS
      -- ::msgcat::mcload dirname
      -- SEE ALSO
      -- Mc_Load (procedure)
      -- SOURCE
   function Mc_Load
     (DirName: in String; Interp: in Tcl_Interp) return String with
      Pre => DirName /= "";
      -- ****

      -- ****f* MsgCatAda/Mc_LoadedLocales_Clear
      -- FUNCTION
      -- Remove locales and their data, which are not in the current
      -- preferences list
      -- PARAMETERS
      -- Interp - Tcl interpreter on which locales will be cleared
      -- HISTORY
      -- 8.6.7 - Added
      -- EXAMPLE
      -- -- Remove all locales and their data from My_Interp interpreter
      -- Mc_LoadedLocales_Clear(My_Interp);
      -- COMMANDS
      -- ::msgcat:mcloadedlocales clear
      -- SOURCE
   procedure Mc_LoadedLocales_Clear(Interp: in Tcl_Interp);
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
   -- EXAMPLE
   -- -- Get the list of currently loaded locales in My_Interp Tcl interpreter
   -- Loaded_Locales: constant String := Mc_LoadedLocales_Get(My_Interp);
   -- COMMANDS
   -- ::msgcat:mcloadedlocales get
   -- SOURCE
   function Mc_LoadedLocales_Get(Interp: in Tcl_Interp) return String;
   -- ****

   -- ****f* MsgCatAda/Mc_LoadedLocales_Present
   -- FUNCTION
   -- Check if the selected locale was loaded in the selected interpreter
   -- PARAMETERS
   -- Interp - Tcl interpreter on which locale will be check
   -- Locale - The name of the locale to check
   -- RESULT
   -- True if the selected Locale was loaded, otherwise false
   -- HISTORY
   -- 8.6.7 - Added
   -- EXAMPLE
   -- -- Check if locale pl was loaded to My_Interp Tcl interpreter
   -- Is_Loaded: constant String := Mc_LoadedLocales_Present(My_Interp, "pl");
   -- COMMANDS
   -- ::msgcat:mcloadedlocales present locale
   -- SOURCE
   function Mc_LoadedLocales_Present
     (Interp: in Tcl_Interp; Locale: in String) return String with
      Pre => Locale /= "";
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
      -- EXAMPLE
      -- -- Set default locale to en_US on My_Interp Tcl interpreter
      -- Mc_Locale("en_US", My_Interp);
      -- COMMANDS
      -- ::msgcat::mclocale newlocale
      -- SEE ALSO
      -- Mc_Locale (function)
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
      -- EXAMPLE
      -- -- Get the name of default locale for My_Interp Tcl interpreter
      -- Locale_Name: constant String := Mc_Locale(My_Interp);
      -- COMMANDS
      -- ::msgcat::mclocale
      -- SEE ALSO
      -- Mc_Locale (procedure)
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
   -- EXAMPLE
   -- -- Get the longest translation length for string my word and hello world in My_Interp interpreter
   -- Max_Length: constant String := Mc_Max("{my word} {hello word}", My_Interp);
   -- COMMANDS
   -- ::msgcat::mcmax strings
   -- SOURCE
   function Mc_Max
     (Strings: in String; Interp: in Tcl_Interp) return String with
      Pre => Strings /= "";
      -- ****

      -- ****f* MsgCatAda/Mc_Mset (procedure)
      -- FUNCTION
      -- Set the translations for the multiple source strings for the selected
      -- locale in the selected interpreter
      -- PARAMETERS
      -- Interp - Tcl interpreter in which translations will be set
      -- Locale - The name of the locale in which translations will be added
      -- List   - List of source translation source translation ... to add
      -- HISTORY
      -- 8.6.7 - Added
      -- EXAMPLE
      -- -- Set the translations hello world to helloword and my word to myword in locale en_US in My_Interp interpreter
      -- Mc_Mset(My_Interp, "en_US", "[list {hello world} {helloword} {my word} {myword}]");
      -- COMMANDS
      -- ::msgcat::mcmset locale list
      -- SEE ALSO
      -- Mc_Mset (function)
      -- SOURCE
   procedure Mc_Mset(Interp: in Tcl_Interp; Locale, List: in String) with
      Pre => Locale /= "" and List /= "";
      -- ****

      -- ****f* MsgCatAda/Mc_Mset (function)
      -- FUNCTION
      -- Set the translations for the multiple source strings for the selected
      -- locale in the selected interpreter
      -- PARAMETERS
      -- Interp - Tcl interpreter in which translations will be set
      -- Locale - The name of the locale in which translations will be added
      -- List   - List of source translation source translation ... to add
      -- RESULT
      -- Number of translations set
      -- HISTORY
      -- 8.6.7 - Added
      -- EXAMPLE
      -- -- Set the translations hello world to helloword and my word to myword in locale en_US in My_Interp interpreter
      -- Translations_Amount: constant String := Mc_Mset(My_Interp, "en_US", "[list {hello world} {helloword} {my word} {myword}]");
      -- COMMANDS
      -- ::msgcat::mcmset locale list
      -- SEE ALSO
      -- Mc_Mset (function)
      -- SOURCE
   function Mc_Mset
     (Interp: in Tcl_Interp; Locale, List: in String) return String with
      Pre => Locale /= "" and List /= "";
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
      -- EXAMPLE
      -- -- Get the list of locales for the user on My_Interp Tcl interpreter
      -- Languages_List: constant String := Mc_Preferences(My_Interp);
      -- COMMANDS
      -- ::msgcat::mcpreferences
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
   -- EXAMPLE
   -- -- Set the translation of hello world to helloword1 in locale en_US on My_Interp interpreter
   -- Mc_Set(My_Interp, "en_US", "{hello world}", "{helloword1}");
   -- COMMANDS
   -- ::msgcat::mcset locale src-string ?translate-string?
   -- SEE ALSO
   -- Mc_Set (function)
   -- SOURCE
   procedure Mc_Set
     (Interp: in Tcl_Interp; Locale, Src_String: in String;
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
      -- EXAMPLE
      -- -- Set the translation of hello world to helloword1 in locale en_US on My_Interp interpreter
      -- Translation: constant String := Mc_Set(My_Interp, "en_US", "{hello world}", "{helloword1}");
      -- COMMANDS
      -- ::msgcat::mcset locale src-string ?translate-string?
      -- SEE ALSO
      -- Mc_Set (procedure)
      -- SOURCE
   function Mc_Set
     (Interp: in Tcl_Interp; Locale, Src_String: in String;
      Translate_String: in String := "") return String with
      Pre => Locale /= "" and Src_String /= "";
      -- ****

      -- ****f* MsgCatAda/Mc_Forget_Package
      -- FUNCTION
      -- Clear all msgcat settings and translations at the selected interpreter
      -- PARAMETERS
      -- Interp - Tcl interpreter on which current state of mgscat will be
      --          cleared
      -- 8.6.7 - Added
      -- EXAMPLE
      -- -- Clear all msgcat settings on My_Interp Tcl interpreter
      -- Mc_Forget_Package(My_Interp);
      -- COMMANDS
      -- ::msgcat::mcforgetpackage
      -- SOURCE
   procedure Mc_Forget_Package(Interp: in Tcl_Interp);
   -- ****

end Tcl.MsgCat.Ada;

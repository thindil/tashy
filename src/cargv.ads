--------------------------------------------------------------------
--
--  cargv.ads -- Create C-style "argv" vectors from strings and
--              Ada.Command_Line.
--
--  Copyright (c) 1995-2000 Terry J. Westley
--  Copyright (c) 2021 Bartek thindil Jasicki <thindil@laeran.pl>
--
--  See the file "license.htm" for information on usage and
--  redistribution of this file, and for a DISCLAIMER OF ALL WARRANTIES.
--
--  This package provides the data type Chars_Ptr_Ptr which corresponds
--  to the char** of C and subprograms for creating and manipulating
--  arrays of C strings.
--
--------------------------------------------------------------------

with Interfaces.C.Pointers;
with Interfaces.C.Strings;
with Ada.Strings.Unbounded;

-- ****h* Tashy/CArgv
-- FUNCTION
--  This package provides the data type Chars_Ptr_Ptr which corresponds
--  to the char** of C and subprograms for creating and manipulating
--  arrays of C strings.
-- SOURCE
package CArgv is
-- ****

   package C renames Interfaces.C;

   -- ****t* CArgv/CArgv.CNatural
   -- FUNCTION
   -- Used as natural integer type in C bindings
   -- SOURCE
   subtype CNatural is C.int range 0 .. C.int'Last;
   -- ****

   -- ****t* CArgv/CArgv.Vector
   -- FUNCTION
   -- This is a C-style "argv" vector.
   -- SOURCE
   type Vector is array(CNatural range <>) of aliased C.Strings.chars_ptr;
   -- ****

   package Argv_Pointer is new C.Pointers
     (Index => CNatural, Element => C.Strings.chars_ptr,
      Element_Array => Vector, Default_Terminator => C.Strings.Null_Ptr);

   -- ****t* CArgv/CArgv.Chars_Ptr_Ptr
   -- FUNCTION
   -- This is C char **
   -- SOURCE
   subtype Chars_Ptr_Ptr is Argv_Pointer.Pointer;
   -- ****

   ---------------------------------------------------------------------
   --
   --  The following subprograms support converting command line
   --  arguments to C-style argc/argv command line arguments.
   --
   ---------------------------------------------------------------------

   -- ****f* CArgv/CArgv.Create
   -- FUNCTION
   -- Create returns the command line arguments from Ada.Command_Line
   -- and converts them to a C-style, null-terminated argument vector.
   -- SOURCE
   procedure Create(Argc: out CNatural; Argv: out Chars_Ptr_Ptr);
   -- ****

   -- ****f* CArgv/CArgv.Show
   -- FUNCTION
   -- Prints Argc and Argv to standard out.
   -- SOURCE
   procedure Show(Argc: in CNatural; Argv: in Chars_Ptr_Ptr);
   -- ****

   -- ****f* CArgv/CArgv.Free
   -- FUNCTION
   -- Free all space used by Argv.
   -- SOURCE
   procedure Free(Argv: in out Chars_Ptr_Ptr);
   -- ****

   --  Example of getting Ada command line arguments and passing them
   --  to a C function requiring argc/argv arguments:
   --
   --    declare
   --       Argc : C.Int;
   --       Argv : CArgv.Chars_Ptr_Ptr;
   --    begin
   --       CArgv.Create (Argc, Argv);
   --       Tcl.Tcl_Concat (Argc, Argv);
   --       CArgv.Free (Argv);
   --    end;

   ---------------------------------------------------------------------
   --
   --  The following subprogram supports retrieving a command line
   --  argument from C-style argv command line arguments.
   --
   ---------------------------------------------------------------------

   -- ****f* CArgv/CArgv.Arg
   -- FUNCTION
   -- Returns the Nth argument from Argv.
   -- SOURCE
   function Arg(Argv: Chars_Ptr_Ptr; N: CNatural) return String;
   -- ****

   ---------------------------------------------------------------------
   --
   --  The following subprograms support creating C-style argc/argv
   --  argument vectors from strings.
   --
   ---------------------------------------------------------------------

   -- ****f* CArgv/CArgv.Empty
   -- FUNCTION
   -- An empty Chars_Ptr_Ptr, used for constructors.
   -- SOURCE
   function Empty return Chars_Ptr_Ptr;
   -- ****

   -- ****f* CArgv/CArgv."&"
   -- FUNCTION
   -- Construct a Chars_Ptr_Ptr using concat operation.
   -- SOURCE
   function "&"(Argv: Chars_Ptr_Ptr; Arg: String) return Chars_Ptr_Ptr;
   -- ****

   -- ****f* CArgv/CArgv.Argc
   -- FUNCTION
   -- Returns the number of arguments in a Chars_Ptr_Ptr.
   -- SOURCE
   function Argc(Argv: in Chars_Ptr_Ptr) return CNatural;
   -- ****

   --  Example of creating a Chars_Ptr_Ptr to pass to a C function requiring
   --  argc/argv arguments:
   --
   --    declare
   --       Argv : CArgv.Chars_Ptr_Ptr :=
   --          Empty & "this" & "is" & "four" & "arguments";
   --    begin
   --       Tcl.Tcl_Concat (CArgv.Argc (Argv), Argv);
   --       CArgv.Free (Argv);
   --    end;

   type Arguments_Array is
     array(Positive range <>) of Ada.Strings.Unbounded.Unbounded_String;

     -- ****f* CArgv/CArgv.Arguments_To_Array
     -- FUNCTION
     -- Convert Arguments list to the array of Unbounded_Strings
     -- SOURCE
   function Arguments_To_Array(Argv: Chars_Ptr_Ptr) return Arguments_Array;
   -- ****

end CArgv;

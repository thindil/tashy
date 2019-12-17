/*
 * tclmacro.c --
 *
 *    This file encapsulates calls to all tcl.h macro functions into C
 *    function calls.  These can then be called from Ada.  This avoids
 *    having to translate the macro.
 *
 *  Copyright (c) 1999-2000 Terry J. Westley
 *
 *  Tash is free software; you can redistribute it and/or modify it
 *  under terms of the GNU General Public License as published by the
 *  Free Software Foundation; either version 2, or (at your option)
 *  any later version. Tash is distributed in the hope that it will be
 *  useful, but WITHOUT ANY WARRANTY; without even the implied
 *  warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
 *  PURPOSE. See the GNU General Public License for more details. You
 *  should have received a copy of the GNU General Public License
 *  distributed with Tash; see file COPYING. If not, write to
 *
 *          Free Software Foundation
 *          59 Temple Place - Suite 330
 *          Boston, MA 02111-1307, USA
 *
 *  As a special exception, if other files instantiate generics from
 *  this unit, or you link this unit with other files to produce an
 *  executable, this unit does not by itself cause the resulting
 *  executable to be covered by the GNU General Public License. This
 *  exception does not however invalidate any other reasons why the
 *  executable file might be covered by the GNU Public License.
 */

#if 0
#define __CYGWIN__
#endif

#include <tcl.h>
#include <stdlib.h>

int Tcl_CallIncrRefCount (struct Tcl_Obj *objPtr)
{
   return Tcl_IncrRefCount (objPtr);
}

void Tcl_CallDecrRefCount (struct Tcl_Obj *objPtr)
{
   Tcl_DecrRefCount (objPtr);
}

int Tcl_CallIsShared (struct Tcl_Obj *objPtr)
{
   return Tcl_IsShared (objPtr);
}

ClientData Tcl_CallGetHashValue (Tcl_HashEntry *h)
{
   return Tcl_GetHashValue (h);
}

void Tcl_CallSetHashValue (Tcl_HashEntry *h, ClientData value)
{
   Tcl_SetHashValue (h, value);
}

char *Tcl_CallGetHashKey (Tcl_HashTable *tablePtr, Tcl_HashEntry *h)
{
   return Tcl_GetHashKey (tablePtr, h);
}

Tcl_HashEntry *Tcl_CallFindHashEntry (Tcl_HashTable *tablePtr, char *key)
{
   return Tcl_FindHashEntry (tablePtr, key);
}

Tcl_HashEntry *Tcl_CallCreateHashEntry
 (Tcl_HashTable *tablePtr, char *key, int *newPtr)
{
   return Tcl_CreateHashEntry (tablePtr, key, newPtr);
}




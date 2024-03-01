/**
This is free and unencumbered software released into the public domain.

Anyone is free to copy, modify, publish, use, compile, sell, or
distribute this software, either in source code form or as a compiled
binary, for any purpose, commercial or non-commercial, and by any
means.
**/
/*------------------------------------------------------------------------
    File        : PersonComparer
    Purpose     :
    Author(s)   : Peter Judge, Consultingwerk Ltd
    Notes       :
  ----------------------------------------------------------------------*/

block-level on error undo, throw.

using collections.* from propath.
using Progress.Collections.*.

class collections.PersonComparer
    implements IComparer<IPerson>:


    /* Comparison method, used by SortedSet's default comparer

        SORTS ON FIRSTNAME+LASTNAME

        - If the returned value is less than 0 (zero), then the current object sorts before the object passed in.
        - If the returned value equals 0 (zero) , then the current object occupies the same position in the sort order.
        - If the returned value is greater than 0(zero), then the current object sorts after the object passed in.
        - If either object's Value is the unknown value (?), then that sorts high/early/before

        @return integer  0 = same object
                        +1 = sorts after
                        -1 = sorts before   */
    method public integer Compare(poPerson1 as IPerson, poPerson2 as IPerson).

        define variable cFullName as character extent 2 no-undo.

        // same object, also handles being the unknown value
        if poPerson1 = poPerson2 then
            return 0.

        if not valid-object(poPerson1) then
            return -1.
        else
        if not valid-object(poPerson2) then
            return 1.

        cFullName[1] = substitute("&1+&2", poPerson1:FirstName, poPerson1:LastName).
        cFullName[2] = substitute("&1+&2", poPerson2:FirstName, poPerson2:LastName).

        if cFullName[1] < cFullName[2] then
            return -1.
        else
        if cFullName[1] > cFullName[2] then
            return 1.

        // sorts the same
        return 0.
    end.

end class.
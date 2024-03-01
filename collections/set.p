/**
This is free and unencumbered software released into the public domain.

Anyone is free to copy, modify, publish, use, compile, sell, or
distribute this software, either in source code form or as a compiled
binary, for any purpose, commercial or non-commercial, and by any
means.
**/
/*------------------------------------------------------------------------
    File        : set.p
    Purpose     :
    Author(s)   : Peter Judge, Consultingwerk Ltd
    Notes       :
  ----------------------------------------------------------------------*/
block-level on error undo, throw.

using Progress.Collections.*.
using collections.*.

var ISet<IPerson> oPersonSet = new SortedSet<IPerson>().
var IIterator<IPerson> oSetIterator.

oPersonSet:Add(new Person("Zadie", "Jones")).
oPersonSet:Add(new Person("Ansel", "Adams")).
//oPersonSet:Add(?).
oPersonSet:Add(new Person("Zadie", "Jones")).
oPersonSet:Add(new Person("Roger", "Thomson")).

message
    "Count: " oPersonSet:Count .

oSetIterator = oPersonSet:GetIterator().

display "Sorted by Last Name, First Name" skip "First Name     Last Name"  skip
    fill("=", 40) format "x(40)".

repeat while oSetIterator:MoveNext():
    display oSetIterator:Current:FirstName  oSetIterator:Current:LastName.
end.

catch err as Progress.Lang.Error:
    message
        err:GetMessage(1) skip(2)
        err:CallStack
        .
end catch.
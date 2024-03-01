/**
This is free and unencumbered software released into the public domain.

Anyone is free to copy, modify, publish, use, compile, sell, or
distribute this software, either in source code form or as a compiled
binary, for any purpose, commercial or non-commercial, and by any
means.
**/
/*------------------------------------------------------------------------
    File        : Employee
    Purpose     :
    Author(s)   : Peter Judge, Consultingwerk Ltd
    Notes       :
  ----------------------------------------------------------------------*/

block-level on error undo, throw.

using collections.* from propath.
using Progress.Collections.*.

class collections.Employee
    inherits Person
    implements  IEmployee, IHashable
    :

    define public property EmployeeId as integer no-undo
    get.
    private set.

    constructor public Employee (pcFirstName as character, pcLastName as character, piId as integer):
        super(pcFirstName, pcLastName).

        this-object:EmployeeId = piId.
    end constructor.

    constructor public Employee (pcFirstName as character, pcMiddleNames as character extent, pcLastName as character, piId as integer):
        super(pcFirstName, pcMiddleNames, pcLastName).

        this-object:EmployeeId = piId.
    end constructor.

    method override public character ToString():
        return substitute("&1,&2 (&3)", this-object:LastName, this-object:FirstName, this-object:EmployeeId).
    end method.

    /* The HashCode() method */
    method public integer HashCode().
        // Hash on the value of property EmployeeID
        return hash-code(this-object:EmployeeID).
    end.

    method public override logical Equals(poOther as Progress.Lang.Object):

        /* TYPE-OF returns FALSE if not valid-object, as of 12.6 */
        if not type-of(poOther, IEmployee) then
            return false.

        if this-object:EmployeeID = cast(poOther, IEmployee):EmployeeID then
            return true.

        return false.
    end.

end class.
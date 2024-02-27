

block-level on error undo, throw.

using collections.* from propath.
using Progress.Collections.*.

class collections.EmployeeFinder
    implements  IEmployee, IHashable:

    define public property EmployeeId as integer no-undo
    get.
    private set.

    constructor public EmployeeFinder (piId as integer):
        this-object:EmployeeId = piId.
    end constructor.


    method override public character ToString():
        return substitute("Id: &1", this-object:EmployeeId).
    end method.

    /* The HashCode()
    */
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
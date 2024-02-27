

block-level on error undo, throw.

using collections.* from propath.
using Progress.Collections.*.

class collections.Person
    implements IPerson, IComparable<IPerson>:

    define public property FirstName as character no-undo
    get.
    private set.

    define public property LastName as character no-undo
    get.
    private set.

    define public property MiddleNames as character no-undo extent
    get.
    private set.

    constructor public Person (pcFirstName as character, pcLastName as character):
        this-object:FirstName = pcFirstName.
        this-object:LastName  = pcLastName.
    end constructor.

    constructor public Person (pcFirstName as character, pcMiddleNames as character extent, pcLastName as character):
        this-object(pcFirstName, pcLastName).

        this-object:MiddleNames = pcMiddleNames.

    end constructor.

    /* Comparison method, used by SortedSet's default comparer

        SORTS ON LASTNAME,FIRSTNAME

        - If the returned value is less than 0 (zero), then the current object sorts before the object passed in.
        - If the returned value equals 0 (zero) , then the current object occupies the same position in the sort order.
        - If the returned value is greater than 0(zero), then the current object sorts after the object passed in.
        - If either object's Value is the unknown value (?), then that sorts high/early/before

        @param FileInfo The object to compare to (Can be type File or Folder).
        @return integer  0 = same object
                        +1 = sorts after
                        -1 = sorts before   */
    method public integer CompareTo (poOther as IPerson):

        define variable cFullName as character extent 2 no-undo.

        cFullName[1] = substitute("&1,&2", this-object:LastName, this-object:FirstName).
        cFullName[2] = substitute("&1,&2", poOther:LastName, poOther:FirstName).

        if cFullName[1] = cFullName[2] then
            return 0.
        else
        // unknown values are not allowed
        if cFullName[1] > cFullName[2] then
            return +1.
        else
        if cFullName[1] < cFullName[2] then
            return -1.

        // this will raise an error in the Comparer; we should never get here though.
        return ?.
    end method.

    method override public character ToString():
        return substitute("&1,&2", this-object:LastName, this-object:FirstName).
    end method.

end class.
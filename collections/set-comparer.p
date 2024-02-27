block-level on error undo, throw.

using Progress.Collections.*.
using collections.*.

var ISet<IPerson> oPersonSet = new SortedSet<IPerson>(new PersonComparer()).    // Using our custom comparer
var IIterator<IPerson> oSetIterator.

oPersonSet:Add(new Person("Zadie", "Jones")).
oPersonSet:Add(new Person("Ansel", "Adams")).
oPersonSet:Add(new Person("Roger", "Thomson")).

message
    oPersonSet:Count skip
    view-as alert-box.

oSetIterator = oPersonSet:GetIterator().

display "First Name     Last Name"  skip
    fill("=", 40) format "x(40)".

repeat while oSetIterator:MoveNext():
    display oSetIterator:Current:FirstName  oSetIterator:Current:LastName.
end.

catch err as Progress.Lang.Error:
    message
        err:GetMessage(1)
        view-as alert-box.
end catch.


block-level on error undo, throw.

using collections.*.
using Progress.Collections.*.

var IMap<IEmployee, ICountry> oEmployeeLocation = new HashMap<IEmployee, ICountry>().
var IIterator<KeyValuePair<IEmployee, ICountry>> oMapIterator.
var IIterator<IEmployee> oKeyIterator.

oEmployeeLocation:Add(new Employee("Jack", "Smith", 42),        new EuropeanCountry("NL", true)).
oEmployeeLocation:Add(new Employee("Kurt", "Muller", 38),       new EuropeanCountry("DE", true)).
oEmployeeLocation:Add(new Employee("Anders", "Andersen", 10),   new EuropeanCountry("DK", false)).
oEmployeeLocation:Add(new Employee("Sam", "O'British", 68),     ?).

/* Iterate over the whole Map, keys and values */
oMapIterator = oEmployeeLocation:GetIterator().

repeat while oMapIterator:MoveNext():
    display "Key: " string(oMapIterator:Current:Key) form 'x(20)' " Value: " string(oMapIterator:Current:Value) form 'x(20)'.
end.

/* Iterate over the whole keys only */
if type-of(oEmployeeLocation:Keys, IIterable<IEmployee>) then do:
    oKeyIterator = cast(oEmployeeLocation:Keys, IIterable<IEmployee>):GetIterator().

    repeat while oKeyIterator:MoveNext():
        display "Key only: " string(oKeyIterator:Current) form 'x(20)'.
    end.
end.

catch err as Progress.Lang.Error:
    message
        err:GetMessage(1) skip(2)
        err:CallStack
        view-as alert-box.
end catch.

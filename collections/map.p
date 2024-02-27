

block-level on error undo, throw.

using collections.*.
using Progress.Collections.*.

var IMap<IEmployee, ICountry> oEmployeeLocation = new HashMap<IEmployee, ICountry>().
var IEmployee oEmployee.
var ICountry oCountry.
var logical lHasKey.

oEmployeeLocation:Add(new Employee("Jack", "Smith", 42),        new EuropeanCountry("NL", true)).
oEmployeeLocation:Add(new Employee("Kurt", "Muller", 38),       new EuropeanCountry("DE", true)).
oEmployeeLocation:Add(new Employee("Anders", "Andersen", 10),   new EuropeanCountry("DK", false)).
oEmployeeLocation:Add(new Employee("Sam", "O'British", 68),     ?). // No requirements on the Value

message
    oEmployeeLocation:Count skip
    view-as alert-box
    .

oCountry = oEmployeeLocation:GetValue(new Employee("Anders", "Andersen", 10)).
message
    oCountry
    view-as alert-box.

oCountry = oEmployeeLocation:GetValue(new Employee("Sam", "O'British", 68)).
message
    "Employee in the collection: " oCountry
    view-as alert-box.

oCountry = oEmployeeLocation:GetValue(new Employee("XX", "XXX", -1)).
message
    "Employee not in the collection: " oCountry
    view-as alert-box.

catch err as Progress.Lang.Error:
    message
        err:GetMessage(1) skip(2)
        err:CallStack
        view-as alert-box.
end catch.

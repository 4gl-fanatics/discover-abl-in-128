block-level on error undo, throw.

using Progress.Collections.*.
using collections.*.

var IList<ICountry> oCountryList = new List<ICountry>().
var IIterator<ICountry> oListIterator.

oCountryList:Add(new EuropeanCountry("DE", true)).
oCountryList:Add(new AfricanCountry("ZA")).
oCountryList:Add(?).

message
    oCountryList:Count skip
    "item 2: " oCountryList:Get(2)
    view-as alert-box.

oListIterator = oCountryList:GetIterator().

//oCountryList:Add(new EuropeanCountry("DK", false)).

repeat while oListIterator:MoveNext():
    message oListIterator:Current
        view-as alert-box.
end.

catch err as Progress.Lang.Error:
    message
        err:GetMessage(1)
        view-as alert-box.
end catch.
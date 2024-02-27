block-level on error undo, throw.

using Progress.Collections.*.
using collections.*.

var ISet<ICountry> oCountrySet = new SortedSet<ICountry>().     // Using the default comparer

oCountrySet:Add(new EuropeanCountry("DE", true)).
oCountrySet:Add(new EuropeanCountry("DK", false)).
oCountrySet:Add(new AfricanCountry("ZA")).

message
    oCountrySet:Count skip
    view-as alert-box.

catch err as Progress.Lang.Error:
    message
        err:GetMessage(1) skip
        err:CalLStack
        view-as alert-box.
end catch.
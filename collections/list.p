/**
This is free and unencumbered software released into the public domain.

Anyone is free to copy, modify, publish, use, compile, sell, or
distribute this software, either in source code form or as a compiled
binary, for any purpose, commercial or non-commercial, and by any
means.
**/
/*------------------------------------------------------------------------
    File        : list.p
    Purpose     :
    Author(s)   : Peter Judge, Consultingwerk Ltd
    Notes       :
  ----------------------------------------------------------------------*/
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
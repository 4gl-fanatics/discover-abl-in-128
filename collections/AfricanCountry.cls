/**
This is free and unencumbered software released into the public domain.

Anyone is free to copy, modify, publish, use, compile, sell, or
distribute this software, either in source code form or as a compiled
binary, for any purpose, commercial or non-commercial, and by any
means.
**/
/*------------------------------------------------------------------------
    File        : AfricanCountry
    Purpose     :
    Author(s)   : Peter Judge, Consultingwerk Ltd
    Notes       :
  ----------------------------------------------------------------------*/

block-level on error undo, throw.

using collections.* from propath.

class collections.AfricanCountry
    implements ICountry:

    define public property CountryCode as character no-undo
    get.
    private set.

    constructor public AfricanCountry(pcCode as character):
        this-object:CountryCode = pcCode.
    end constructor.

    method override public character ToString():
        return "AF-" + this-object:CountryCode.
    end method.

end class.
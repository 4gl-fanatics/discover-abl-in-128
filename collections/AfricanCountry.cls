
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